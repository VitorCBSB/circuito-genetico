module chromosomeProcessingStateMachine
	( input wire iClock
	, input wire [991:0] iConcatedChromDescription
	, input wire [15:0][7:0] iInputSequence
	, input wire [15:0][7:0] iExpectedOutput
	, input wire [15:0][7:0] iValidOutput
	, input wire [7:0] iHardCodedInput
	, input wire iUseHardcodedInput
	, input wire iHardStore
	, input wire [1:0] iClockChangeCyclesSelector
	, input wire [7:0] iSequencesToProcess
	
	// State machine control
	, input wire iStartProcessing
	, input wire iDoneProcessingFeedback
	, input wire iStall
	, output wire oReadyToProcess
	, output wire oDoneProcessing
	
	, output wire [31:0] oChromOutput
	, output wire [7:0][31:0] oErrorSums
	, output wire [2:0] oState
	);
	
	parameter IDLE = 3'b000, 
				 PROCESSING = 3'b001, 
				 DONE = 3'b010, 
				 STALLED = 3'b011,
				 INPUT_WAIT = 3'b100,
				 ZEROING_VRC = 3'b101;
	
	parameter CYCLES_TO_IGNORE = 5;
	
	reg [2:0] currentState = IDLE;
    
   reg [31:0] clockCycleCounter = 0;
   reg [7:0] currentInput = 8'b0;
	reg [15:0] currentAddress = 0;
	reg [7:0] currentInputFromSequence = 0;
	reg [7:0][31:0] currentErrorSums;
	reg [7:0][31:0] currentSamplingSum;
   
	wire writeToMemory;
	wire [7:0] inputToUse;
	integer clockChangeCycles;
	integer finalClockCycle;

	wire [31:0] chromosomeOutput;
	wire [991:0] chromDesc;

assign oReadyToProcess =
	currentState == IDLE;
	
assign oDoneProcessing =
	currentState == DONE;
	
assign oChromOutput = chromosomeOutput;

assign oState = currentState;

assign oErrorSums = currentErrorSums;

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
	currentState <= currentState;
	currentInputFromSequence <= iInputSequence[currentInput];
	currentErrorSums <= currentErrorSums;
	case (currentState)
	IDLE: begin
		if (iStartProcessing) begin
			currentInput <= 0;
			currentErrorSums[0] <= 0;
			currentErrorSums[1] <= 0;
			currentErrorSums[2] <= 0;
			currentErrorSums[3] <= 0;
			currentErrorSums[4] <= 0;
			currentErrorSums[5] <= 0;
			currentErrorSums[6] <= 0;
			currentErrorSums[7] <= 0;
			currentState <= ZEROING_VRC;
		end
	end
	ZEROING_VRC: begin
		currentState <= INPUT_WAIT;
	end
	INPUT_WAIT: begin
		clockCycleCounter <= 0;
		currentSamplingSum[0] <= 0;
		currentSamplingSum[1] <= 0;
		currentSamplingSum[2] <= 0;
		currentSamplingSum[3] <= 0;
		currentSamplingSum[4] <= 0;
		currentSamplingSum[5] <= 0;
		currentSamplingSum[6] <= 0;
		currentSamplingSum[7] <= 0;
		currentState <= PROCESSING;
	end
	PROCESSING: begin
		if (clockCycleCounter >= finalClockCycle) begin
			if (currentInput >= iSequencesToProcess) begin
				if (iStall) begin
					currentState <= STALLED;
				end else begin
					currentState <= DONE;
				end
			end else begin
				currentInput <= currentInput + 8'b1;
				currentState <= INPUT_WAIT;
			end
			
			currentErrorSums[0] = currentErrorSums[0] + (currentSamplingSum[0] > 0);
			currentErrorSums[1] = currentErrorSums[1] + (currentSamplingSum[1] > 0);
			currentErrorSums[2] = currentErrorSums[2] + (currentSamplingSum[2] > 0);
			currentErrorSums[3] = currentErrorSums[3] + (currentSamplingSum[3] > 0);
			currentErrorSums[4] = currentErrorSums[4] + (currentSamplingSum[4] > 0);
			currentErrorSums[5] = currentErrorSums[5] + (currentSamplingSum[5] > 0);
			currentErrorSums[6] = currentErrorSums[6] + (currentSamplingSum[6] > 0);
			currentErrorSums[7] = currentErrorSums[7] + (currentSamplingSum[7] > 0); 
		end else begin
			clockCycleCounter <= clockCycleCounter + 1;
		end
		// Soma dos erros da saída do cromossomo
		if (clockCycleCounter >= CYCLES_TO_IGNORE) begin
			currentSamplingSum[0] = currentSamplingSum[0] + ((chromosomeOutput[0] ^ iExpectedOutput[currentInput][0]) && iValidOutput[currentInput][0]);
			currentSamplingSum[1] = currentSamplingSum[1] + ((chromosomeOutput[1] ^ iExpectedOutput[currentInput][1]) && iValidOutput[currentInput][1]);
			currentSamplingSum[2] = currentSamplingSum[2] + ((chromosomeOutput[2] ^ iExpectedOutput[currentInput][2]) && iValidOutput[currentInput][2]);
			currentSamplingSum[3] = currentSamplingSum[3] + ((chromosomeOutput[3] ^ iExpectedOutput[currentInput][3]) && iValidOutput[currentInput][3]);
			currentSamplingSum[4] = currentSamplingSum[4] + ((chromosomeOutput[4] ^ iExpectedOutput[currentInput][4]) && iValidOutput[currentInput][4]);
			currentSamplingSum[5] = currentSamplingSum[5] + ((chromosomeOutput[5] ^ iExpectedOutput[currentInput][5]) && iValidOutput[currentInput][5]);
			currentSamplingSum[6] = currentSamplingSum[6] + ((chromosomeOutput[6] ^ iExpectedOutput[currentInput][6]) && iValidOutput[currentInput][6]);
			currentSamplingSum[7] = currentSamplingSum[7] + ((chromosomeOutput[7] ^ iExpectedOutput[currentInput][7]) && iValidOutput[currentInput][7]); 
		end
	end
	STALLED: begin
		if (!iStall) begin
			currentState <= DONE;
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
	end else if (currentState != STALLED && currentState != INPUT_WAIT) begin
		currentAddress <= 16'b0;
	end
end

assign inputToUse = iUseHardcodedInput ? iHardCodedInput : { currentInputFromSequence };
assign chromDesc = currentState == ZEROING_VRC ? 992'b0 : iConcatedChromDescription;

fenotipo fenotipo 
	( .cromossomo(chromDesc)
	, .chromIn(inputToUse)
	, .chromOut(chromosomeOutput)
	);


/*
Circuito2x2manual circ
	( .inp(inputToUse)
	, .out(chromosomeOutput)
	);


mem memModule
	( .address(currentAddress)
	, .clock(iClock)
	, .data({ inputToUse, { 4'b0, currentInput}, iExpectedOutput[currentInput], chromosomeOutput[7:0] })
	, .wren(writeToMemory)
	, .q()
	);
*/

endmodule