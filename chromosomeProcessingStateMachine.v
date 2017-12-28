module chromosomeProcessingStateMachine
	( input wire iClock
	, input wire [991:0] iConcatedChromDescription
	, input wire [15:0][7:0] iInputSequence
	, input wire [15:0][7:0] iExpectedOutput
	, input wire [7:0] iHardCodedInput
	, input wire iUseHardcodedInput
	, input wire iHardStore
	, input wire [1:0] iClockChangeCyclesSelector
	
	// State machine control
	, input wire iStartProcessing
	, input wire iDoneProcessingFeedback
	, input wire iStall
	, input wire [3:0] iStallIndex
	, output wire oReadyToProcess
	, output wire oDoneProcessing
	
	, output wire [31:0] oChromOutput
	, output wire [7:0][31:0] oErrorSums
	, output wire [1:0] oState
	);
	
	/* Modelo semântico em Haskell
	
	data State = 
	 Idle
	 | Processing Int Int Bool -- current index, current clock cycle, current clock
	 | Stalled Int -- current index
	 | Done
	 deriving (Show)
		 
	maxIndex = 15
	clockCyclesToChange = 1000

	checkForFinalIndex :: Int -> State
	checkForFinalIndex i =
		 if i >= maxIndex then
			  Done
		 else
			  Processing (i + 1) 0 True

	step :: Bool -> Maybe Int -> Bool -> State -> State
	step startSignal stallSignal doneSignal state =
		 case state of
			  Idle
					| startSignal -> Processing 0 0 True
					| otherwise -> Idle
			  Processing i cy cl 
					| cy >= clockCyclesToChange && cl == False ->
						 case stallSignal of
							  Just stallI -> if i >= stallI then
														Stalled i
												  else
														checkForFinalIndex i
							  Nothing -> checkForFinalIndex i
					| cy >= clockCyclesToChange -> Processing i 0 False
					| otherwise -> Processing i (cy + 1) cl
			  Stalled i -> case stallSignal of
									 Just i' -> if i' > i then
														 checkForFinalIndex i
													else
														 Stalled i
									 Nothing -> 
										  checkForFinalIndex i
			  Done
					| doneSignal -> Idle
					| otherwise -> Done
	*/
	
	parameter IDLE = 2'b00, PROCESSING = 2'b01, DONE = 2'b10, STALLED = 2'b11;
	
	reg [1:0] currentState = IDLE;
    
   reg [31:0] clockCycleCounter = 0;
   reg [3:0] currentInput = 4'b0;
   reg clockLevel = 1'b1;
	reg [15:0] currentAddress = 0;
   
	wire writeToMemory;
	wire [7:0] inputToUse;
	integer clockChangeCycles;
	integer finalClockCycle;
	
   wire [7:0] inputAggregation;
	wire [31:0] chromosomeOutput;

assign oReadyToProcess =
	currentState == IDLE;
	
assign oDoneProcessing =
	currentState == DONE;
	
assign oChromOutput = chromosomeOutput;

assign oState = currentState;

assign clockChangeCycles = 
		iClockChangeCyclesSelector == 2'b00 ? 100 :
		iClockChangeCyclesSelector == 2'b01 ? 500 :
		iClockChangeCyclesSelector == 2'b10 ? 1000 :
		2000;

assign finalClockCycle = clockChangeCycles - 1;

assign writeToMemory = currentState == PROCESSING || iHardStore;

always@ (posedge iClock) begin
	currentInput <= currentInput;
	clockCycleCounter <= clockCycleCounter;
	clockLevel <= clockLevel;
	currentState <= currentState;
	case (currentState)
	IDLE: begin
		if (iStartProcessing) begin
			currentInput <= 0;
			clockCycleCounter <= 0;
			clockLevel <= 1;
			currentState <= PROCESSING;
		end
	end
	PROCESSING: begin
		if (clockCycleCounter >= finalClockCycle && clockLevel == 1'b0) begin
			if (iStall) begin
				if (currentInput >= iStallIndex) begin
					currentState <= STALLED;
				end else begin
					if (currentInput >= 4'hF) begin
						currentState <= DONE;
					end else begin
						currentState <= PROCESSING;
						currentInput <= currentInput + 4'b1;
						clockCycleCounter <= 0;
						clockLevel <= 1'b1;
					end
				end
			end else begin
				if (currentInput >= 4'hF) begin
					currentState <= DONE;
				end else begin
					currentState <= PROCESSING;
					currentInput <= currentInput + 4'b1;
					clockCycleCounter <= 0;
					clockLevel <= 1'b1;
				end
			end
		end else if (clockCycleCounter >= finalClockCycle) begin
			clockCycleCounter <= 0;
			clockLevel <= 1'b0;
		end else begin
			clockCycleCounter <= clockCycleCounter + 1;
		end
	end
	STALLED: begin
		if (iStall) begin
			if (iStallIndex > currentInput) begin
				if (currentInput >= 4'hF) begin
					currentState <= DONE;
				end else begin
					currentState <= PROCESSING;
					currentInput <= currentInput + 4'b1;
					clockCycleCounter <= 0;
					clockLevel <= 1'b1;
				end
			end
		end else begin
			if (currentInput >= 4'hF) begin
				currentState <= DONE;
			end else begin
				currentState <= PROCESSING;
				currentInput <= currentInput + 4'b1;
				clockCycleCounter <= 0;
				clockLevel <= 1'b1;
			end
		end
	end
	DONE: begin
		if (iDoneProcessingFeedback) begin
			currentState <= IDLE;
		end
	end
	endcase
	
	currentAddress <= currentAddress;
	if (writeToMemory) begin
		currentAddress <= currentAddress + 16'b1;
	end else if (currentState != STALLED) begin
		currentAddress <= 16'b0;
	end
end

assign inputAggregation = { iInputSequence[currentInput]/*, clockLevel*/ };
assign inputToUse = iUseHardcodedInput ? iHardCodedInput : inputAggregation;

chromosomeErrorSum chromErrorSum 
	( .iClock(iClock)
	, .iProcessing(currentState == PROCESSING)
	, .iKeepResult(currentState == DONE || currentState == STALLED)
	, .iClockCycleCounter(clockCycleCounter)
	, .iExpectedSequence(iExpectedOutput)
	, .iCurrentSequence(currentInput)
	, .iChromosomeOutput(chromosomeOutput)
	, .oErrorSums(oErrorSums)
	);

fenotipo fenotipo 
	( .cromossomo(iConcatedChromDescription)
	, .chromIn(inputToUse)
	, .chromOut(chromosomeOutput)
	);


mem memModule
	( .address(currentAddress)
	, .clock(iClock)
	, .data({ inputToUse, { 4'b0, currentInput}, iExpectedOutput[currentInput], chromosomeOutput[7:0] })
	, .wren(writeToMemory)
	, .q()
	);


endmodule