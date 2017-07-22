module chromosomeErrorSum 
	( input iClock
	, input iProcessing
	, input iKeepResult
	, input iClockLevel
	, input [15:0][7:0] iExpectedSequence
	, input [3:0] iCurrentSequence
	, input [31:0] iChromosomeOutput
	, output [7:0][31:0] oErrorSums
	);
	
	parameter CYCLES_TO_IGNORE = 20;
	reg [7:0][31:0] errorSums;
	reg lastClockLevel = 0;
	reg [31:0] currentCycle = 0;
	
	assign oErrorSums = errorSums;
	
function [7:0][31:0] nextErrorSums
	( input processing
	, input keepResult
	, input [15:0][7:0] expectedSequence
	, input [3:0] currentSequence
	, input [31:0] chromosomeOutput
	, input [31:0] cycle
	, input [7:0][31:0] currentErrorSums
	);
	
	if (processing) begin
		if (cycle < CYCLES_TO_IGNORE) begin
			nextErrorSums = currentErrorSums;
		end else begin
			nextErrorSums[0] = currentErrorSums[0] + (chromosomeOutput[0] ^ expectedSequence[currentSequence][0]);
			nextErrorSums[1] = currentErrorSums[1] + (chromosomeOutput[1] ^ expectedSequence[currentSequence][1]);
			nextErrorSums[2] = currentErrorSums[2] + (chromosomeOutput[2] ^ expectedSequence[currentSequence][2]);
			nextErrorSums[3] = currentErrorSums[3] + (chromosomeOutput[3] ^ expectedSequence[currentSequence][3]);
			nextErrorSums[4] = currentErrorSums[4] + (chromosomeOutput[4] ^ expectedSequence[currentSequence][4]);
			nextErrorSums[5] = currentErrorSums[5] + (chromosomeOutput[5] ^ expectedSequence[currentSequence][5]);
			nextErrorSums[6] = currentErrorSums[6] + (chromosomeOutput[6] ^ expectedSequence[currentSequence][6]);
			nextErrorSums[7] = currentErrorSums[7] + (chromosomeOutput[7] ^ expectedSequence[currentSequence][7]);
		end
	end else if (keepResult)
		nextErrorSums = currentErrorSums;
	else begin
		nextErrorSums[0] = 0;
		nextErrorSums[1] = 0;
		nextErrorSums[2] = 0;
		nextErrorSums[3] = 0;
		nextErrorSums[4] = 0;
		nextErrorSums[5] = 0;
		nextErrorSums[6] = 0;
		nextErrorSums[7] = 0;
	end
	
endfunction

function [31:0] nextCycle
	( input processing
	, input [31:0] curCycle
	, input lastClockLevel
	, input clockLevel
	);
	
	if (processing)
		if (lastClockLevel == 1'b1 && clockLevel == 1'b0)
			nextCycle = 0;
		else
			nextCycle = curCycle + 1;
	else
		nextCycle = 0;
	
endfunction

always @(posedge iClock) begin
	errorSums <= nextErrorSums(iProcessing, iKeepResult, iExpectedSequence, iCurrentSequence, iChromosomeOutput, currentCycle, errorSums);
	currentCycle <= nextCycle(iProcessing, currentCycle, lastClockLevel, iClockLevel);
	lastClockLevel <= iClockLevel;
end


endmodule