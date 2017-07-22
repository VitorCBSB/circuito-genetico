module chromosomeProcessingStateMachine
	( input wire iClock
	, input wire [991:0] iConcatedChromDescription
	, input wire [15:0][7:0] iInputSequence
	, input wire [15:0][7:0] iExpectedOutput
	
	// State machine control
	, input wire iStartProcessing
	, input wire iDoneProcessingFeedback
	, output wire oReadyToProcess
	, output wire oDoneProcessing
	
	, output wire [31:0] oChromOutput
	, output wire [7:0][31:0] oErrorSums
	, output wire [1:0] oState
	);
	
	parameter IDLE = 2'b00, PROCESSING = 2'b01, DONE = 2'b10;

	reg [1:0] currentState = IDLE;

	parameter CLOCK_CHANGE_CYCLES = 100;
    
   reg [5:0] clockCycleCounter = 0;
   reg [3:0] currentInput = 4'b0;
   reg clockLevel = 1'b1;
	reg [3:0] lastInput;
    
   wire [5:0] nextCycleCounter;
   wire newClockLevel;
   wire [3:0] newInput;
	
   wire [8:0] inputAggregation;
	wire [31:0] chromosomeOutput;

assign oReadyToProcess =
	currentState == IDLE;
	
assign oDoneProcessing =
	currentState == DONE;
	
assign oChromOutput = chromosomeOutput;

assign oState = currentState;

function [1:0] transferFunc
	( input startProcessing
	, input doneProcessingFeedback
	, input [1:0] state
	, input [3:0] lastInput
	, input [3:0] currentInput
	);
	
	case (currentState)
	IDLE: begin
		if (startProcessing == 1) begin
			transferFunc = PROCESSING;
		end else begin
			transferFunc = IDLE;
		end
	end
	PROCESSING: begin
		if (lastInput == 4'hF && currentInput == 4'h0) begin
			transferFunc = DONE;
		end else begin
			transferFunc = PROCESSING;
		end
	end
	DONE: begin
		if (doneProcessingFeedback == 1) begin
			transferFunc = IDLE;
		end else begin
			transferFunc = DONE;
		end
	end
	default: transferFunc = IDLE;
	endcase

endfunction
	 
function [5:0] nextClockCycleCounter
    ( input processing
    , input integer clockChangeCycles
    , input [5:0] currentClockCycleCounter
    );
    
    if (processing) begin
        if (currentClockCycleCounter < clockChangeCycles) 
            nextClockCycleCounter = currentClockCycleCounter + 6'b1;
        else
            nextClockCycleCounter = 6'b0;
    end
    else
        nextClockCycleCounter = 6'b0;
    
endfunction

function nextClockLevel
    ( input processing
    , input [5:0] nextClockCycleCounter
    , input currentClockLevel
    );
    
    if (processing) begin
        if (nextClockCycleCounter == 6'b0)
            nextClockLevel = ~currentClockLevel;
        else
            nextClockLevel = currentClockLevel;
    end
    else
        nextClockLevel = 1'b1;
    
endfunction

function [3:0] nextInput
    ( input processing
	 , input next
    , input [3:0] currentInput
    );
    
    if (processing)
	     if (next)
	         nextInput = currentInput + 4'b1;
		  else
		      nextInput = currentInput;
    else
        nextInput = 4'b0;
    
endfunction
    
assign nextCycleCounter = nextClockCycleCounter(currentState == PROCESSING, CLOCK_CHANGE_CYCLES, clockCycleCounter);
assign newClockLevel = nextClockLevel(currentState == PROCESSING, nextCycleCounter, clockLevel);
assign newInput = nextInput(currentState == PROCESSING, newClockLevel == 1'b1 && nextCycleCounter == 6'b0, currentInput);

always@(posedge iClock) begin
	currentState <= transferFunc(iStartProcessing, iDoneProcessingFeedback, currentState, lastInput, currentInput);
	clockCycleCounter <= nextCycleCounter;
   clockLevel <= newClockLevel;
   currentInput <= newInput;
	lastInput <= currentInput;
end

assign inputAggregation = { iInputSequence[currentInput], clockLevel };

chromosomeErrorSum chromErrorSum 
	( .iClock(iClock)
	, .iProcessing(currentState == PROCESSING)
	, .iKeepResult(currentState == DONE)
	, .iClockLevel(clockLevel)
	, .iExpectedSequence(iExpectedOutput)
	, .iCurrentSequence(currentInput)
	, .iChromosomeOutput(chromosomeOutput)
	, .oErrorSums(oErrorSums)
	);

fenotipo fenotipo (
	.cromossomo(iConcatedChromDescription),
	.chromIn(inputAggregation),
	.chromOut(chromosomeOutput)
);


endmodule