module chromosomeProcessingStateMachine
	( input wire iClock
	, input wire [991:0] iConcatedChromDescription
	, input wire [127:0][7:0] iInputSequence
	, input wire [127:0][7:0] iExpectedOutput
	, input wire [127:0][7:0] iValidOutput
	, input wire [7:0] iHardCodedInput
	, input wire iUseHardcodedInput
	, input wire [1:0] iClockChangeCyclesSelector
	, input wire [7:0] iSequencesToProcess
	
	// State machine control
	, input wire iStartProcessing
	, input wire iDoneProcessingFeedback
	, output wire oReadyToProcess
	, output wire oDoneProcessing
	
	, output wire [31:0] oChromOutput
	, output wire [7:0][31:0] oErrorSums
	, output wire [2:0] oState
	
	, output wire [31:0] oMemContentToWrite
	, output wire [14:0] oMemAddr
	, output wire [14:0] oCorrectMemAddr
	, output wire oWriteToMem
	, output wire oWriteToCorrectMem
	);
	
   `include "parameters.sv"
	
	parameter CYCLES_TO_IGNORE = 5;
	
	reg [2:0] currentState = IDLE;
    
   reg [31:0] clockCycleCounter = 0;
   reg [7:0] currentInput = 8'b0;
	reg [7:0] currentInputFromSequence = 0;
	reg [7:0][31:0] currentErrorSums;
	reg [7:0][31:0] currentSamplingSum;
	reg [14:0] currentMemAddress;
	reg [14:0] currentCorrectMemAddress;
   
	wire [7:0] inputToUse;
	integer clockChangeCycles;

	wire [31:0] chromosomeOutput;
	wire [991:0] chromDesc;

assign oReadyToProcess =
	currentState == IDLE;
	
assign oDoneProcessing =
	currentState == DONE;
	
assign oChromOutput = chromosomeOutput;

assign oState = currentState;

assign oErrorSums = currentErrorSums;

assign oWriteToMem = currentState == PROCESSING;

assign oWriteToCorrectMem = currentState == TRANSFER;

assign oMemAddr = currentMemAddress;

assign oCorrectMemAddr = currentCorrectMemAddress;

assign oMemContentToWrite = { inputToUse
									 , currentInput
									 , iExpectedOutput[currentInput]
									 , chromosomeOutput[7:0] 
									 };

assign clockChangeCycles = 
		iClockChangeCyclesSelector == 2'b00 ? 100 :
		iClockChangeCyclesSelector == 2'b01 ? 500 :
		iClockChangeCyclesSelector == 2'b10 ? 1000 :
		2000;

always@ (posedge iClock) begin
	currentInput <= currentInput;
	clockCycleCounter <= clockCycleCounter;
	currentState <= currentState;
	currentInputFromSequence <= iInputSequence[currentInput];
	currentErrorSums <= currentErrorSums;
	currentMemAddress <= currentMemAddress;
	currentCorrectMemAddress <= currentMemAddress; // lags behind memAddr by 1.
	
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
		currentMemAddress <= 15'b0;
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
		if (clockCycleCounter >= (clockChangeCycles - 1)) begin
			if (currentInput >= (iSequencesToProcess - 1)) begin
				currentState <= CHECK_TRANSFER;
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
		currentMemAddress <= currentMemAddress + 15'b1;
	end
	SETUP_TRANSFER: begin
		currentState <= TRANSFER;
		currentMemAddress <= currentMemAddress + 15'b1;
	end
	TRANSFER: begin
		if (currentCorrectMemAddress == 15'h7FFF) begin
			currentState <= DONE;
		end else begin
			currentMemAddress <= currentMemAddress + 15'b1;
		end
	end
	CHECK_TRANSFER: begin
		if ((currentErrorSums[0]
			+ currentErrorSums[1]
			+ currentErrorSums[2]
			+ currentErrorSums[3]
			+ currentErrorSums[4]
			+ currentErrorSums[5]
			+ currentErrorSums[6]
			+ currentErrorSums[7]) == 31'b0) begin
			currentMemAddress <= 15'b0;
			currentState <= SETUP_TRANSFER;
		end else begin
			currentState <= DONE;
		end
	end
	DONE: begin
		if (iDoneProcessingFeedback) begin
			currentState <= IDLE;
		end
	end
	endcase
	
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