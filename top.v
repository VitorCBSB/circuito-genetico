module top(
	// FPGA
	input wire CLOCK_50,
	output wire [9:0] LEDR,
	input wire [9:0] SW,
	input wire [3:0] KEY,
	// HPS
	inout wire HPS_CONV_USB_N,
	output wire [14:0] HPS_DDR3_ADDR,
	output wire [2:0] HPS_DDR3_BA,
	output wire HPS_DDR3_CAS_N,
	output wire HPS_DDR3_CKE,
	output wire HPS_DDR3_CK_N,
	output wire HPS_DDR3_CK_P,
	output wire HPS_DDR3_CS_N,
	output wire [3:0] HPS_DDR3_DM,
	inout wire [31:0] HPS_DDR3_DQ,
	inout [3:0] HPS_DDR3_DQS_N,
	inout [3:0] HPS_DDR3_DQS_P,
	output wire HPS_DDR3_ODT,
	output wire HPS_DDR3_RAS_N,
	output wire HPS_DDR3_RESET_N,
	input wire HPS_DDR3_RZQ,
	output wire HPS_DDR3_WE_N,
	output wire HPS_ENET_GTX_CLK,
	inout wire HPS_ENET_INT_N,
	output wire HPS_ENET_MDC,
	inout wire HPS_ENET_MDIO,
	input wire HPS_ENET_RX_CLK,
	input wire [3:0] HPS_ENET_RX_DATA,
	input wire HPS_ENET_RX_DV,
	output wire [3:0] HPS_ENET_TX_DATA,
	output wire HPS_ENET_TX_EN,
	inout wire HPS_KEY,
	output wire HPS_SD_CLK,
	inout wire HPS_SD_CMD,
	inout wire [3:0] HPS_SD_DATA,
	input wire HPS_UART_RX,
	output wire HPS_UART_TX,
	input wire HPS_USB_CLKOUT,
	inout wire [7:0] HPS_USB_DATA,
	input wire HPS_USB_DIR,
	input wire HPS_USB_NXT,
	output wire HPS_USB_STP
);

wire [31:0] rawChromInput[30:0];
wire [991:0] concatedChromInput;
wire [7:0][31:0] errorSumOutput;
wire [63:0][7:0] inputSequences;
wire [63:0][7:0] expectedOutputs;
wire [63:0][7:0] validOutputs;
wire [7:0] sequencesToProcess;
wire [31:0] chromOutput;
wire [15:0] chosenOutput;
wire [7:0] outputToShow;
wire [1:0] state;

wire [14:0] memAddress;
wire [14:0] correctMemAddress;
wire [31:0] memReadData;
wire [31:0] memWriteData;
wire writeToMem;
wire writeToCorrectMem;

wire startProcessingChrom;
wire readyToProcess;
wire doneProcessingFeedback;
wire doneProcessingChrom;

wire doneFilling;

assign LEDR[6:0] = chromOutput[6:0];
assign LEDR[9:7] = state;

assign concatedChromInput = {
	rawChromInput[30],
	rawChromInput[29],
	rawChromInput[28],
	rawChromInput[27],
	rawChromInput[26],
	rawChromInput[25],
	rawChromInput[24],
	rawChromInput[23],
	rawChromInput[22],
	rawChromInput[21],
	rawChromInput[20],
	rawChromInput[19],
	rawChromInput[18],
	rawChromInput[17],
	rawChromInput[16],
	rawChromInput[15],
	rawChromInput[14],
	rawChromInput[13],
	rawChromInput[12],
	rawChromInput[11],
	rawChromInput[10],
	rawChromInput[9],
	rawChromInput[8],
	rawChromInput[7],
	rawChromInput[6],
	rawChromInput[5],
	rawChromInput[4],
	rawChromInput[3],
	rawChromInput[2],
	rawChromInput[1],
	rawChromInput[0]
};

testeio u0 (
        .clk_clk                             (CLOCK_50),
        .hps_io_hps_io_emac1_inst_TX_CLK     (HPS_ENET_GTX_CLK),     //                       hps_io.hps_io_emac1_inst_TX_CLK
        .hps_io_hps_io_emac1_inst_TXD0       (HPS_ENET_TX_DATA[0]),       //                             .hps_io_emac1_inst_TXD0
        .hps_io_hps_io_emac1_inst_TXD1       (HPS_ENET_TX_DATA[1]),       //                             .hps_io_emac1_inst_TXD1
        .hps_io_hps_io_emac1_inst_TXD2       (HPS_ENET_TX_DATA[2]),       //                             .hps_io_emac1_inst_TXD2
        .hps_io_hps_io_emac1_inst_TXD3       (HPS_ENET_TX_DATA[3]),       //                             .hps_io_emac1_inst_TXD3
        .hps_io_hps_io_emac1_inst_RXD0       (HPS_ENET_RX_DATA[0]),       //                             .hps_io_emac1_inst_RXD0
        .hps_io_hps_io_emac1_inst_MDIO       (HPS_ENET_MDIO),       //                             .hps_io_emac1_inst_MDIO
        .hps_io_hps_io_emac1_inst_MDC        (HPS_ENET_MDC),        //                             .hps_io_emac1_inst_MDC
        .hps_io_hps_io_emac1_inst_RX_CTL     (HPS_ENET_RX_DV),     //                             .hps_io_emac1_inst_RX_CTL
        .hps_io_hps_io_emac1_inst_TX_CTL     (HPS_ENET_TX_EN),     //                             .hps_io_emac1_inst_TX_CTL
        .hps_io_hps_io_emac1_inst_RX_CLK     (HPS_ENET_RX_CLK),     //                             .hps_io_emac1_inst_RX_CLK
        .hps_io_hps_io_emac1_inst_RXD1       (HPS_ENET_RX_DATA[1]),       //                             .hps_io_emac1_inst_RXD1
        .hps_io_hps_io_emac1_inst_RXD2       (HPS_ENET_RX_DATA[2]),       //                             .hps_io_emac1_inst_RXD2
        .hps_io_hps_io_emac1_inst_RXD3       (HPS_ENET_RX_DATA[3]),       //                             .hps_io_emac1_inst_RXD3
        .hps_io_hps_io_sdio_inst_CMD         (HPS_SD_CMD),         //                             .hps_io_sdio_inst_CMD
        .hps_io_hps_io_sdio_inst_D0          (HPS_SD_DATA[0]),          //                             .hps_io_sdio_inst_D0
        .hps_io_hps_io_sdio_inst_D1          (HPS_SD_DATA[1]),          //                             .hps_io_sdio_inst_D1
        .hps_io_hps_io_sdio_inst_CLK         (HPS_SD_CLK),         //                             .hps_io_sdio_inst_CLK
        .hps_io_hps_io_sdio_inst_D2          (HPS_SD_DATA[2]),          //                             .hps_io_sdio_inst_D2
        .hps_io_hps_io_sdio_inst_D3          (HPS_SD_DATA[3]),          //                             .hps_io_sdio_inst_D3
        .hps_io_hps_io_usb1_inst_D0          (HPS_USB_DATA[0]),          //                             .hps_io_usb1_inst_D0
        .hps_io_hps_io_usb1_inst_D1          (HPS_USB_DATA[1]),          //                             .hps_io_usb1_inst_D1
        .hps_io_hps_io_usb1_inst_D2          (HPS_USB_DATA[2]),          //                             .hps_io_usb1_inst_D2
        .hps_io_hps_io_usb1_inst_D3          (HPS_USB_DATA[3]),          //                             .hps_io_usb1_inst_D3
        .hps_io_hps_io_usb1_inst_D4          (HPS_USB_DATA[4]),          //                             .hps_io_usb1_inst_D4
        .hps_io_hps_io_usb1_inst_D5          (HPS_USB_DATA[5]),          //                             .hps_io_usb1_inst_D5
        .hps_io_hps_io_usb1_inst_D6          (HPS_USB_DATA[6]),          //                             .hps_io_usb1_inst_D6
        .hps_io_hps_io_usb1_inst_D7          (HPS_USB_DATA[7]),          //                             .hps_io_usb1_inst_D7
        .hps_io_hps_io_usb1_inst_CLK         (HPS_USB_CLKOUT),         //                             .hps_io_usb1_inst_CLK
        .hps_io_hps_io_usb1_inst_STP         (HPS_USB_STP),         //                             .hps_io_usb1_inst_STP
        .hps_io_hps_io_usb1_inst_DIR         (HPS_USB_DIR),         //                             .hps_io_usb1_inst_DIR
        .hps_io_hps_io_usb1_inst_NXT         (HPS_USB_NXT),         //                             .hps_io_usb1_inst_NXT
        .hps_io_hps_io_uart0_inst_RX         (HPS_UART_RX),         //                             .hps_io_uart0_inst_RX
        .hps_io_hps_io_uart0_inst_TX         (HPS_UART_TX),         //                             .hps_io_uart0_inst_TX
        .memory_mem_a                        (HPS_DDR3_ADDR),                        //                       memory.mem_a
        .memory_mem_ba                       (HPS_DDR3_BA),                       //                             .mem_ba
        .memory_mem_ck                       (HPS_DDR3_CK_P),                       //                             .mem_ck
        .memory_mem_ck_n                     (HPS_DDR3_CK_N),                     //                             .mem_ck_n
        .memory_mem_cke                      (HPS_DDR3_CKE),                      //                             .mem_cke
        .memory_mem_cs_n                     (HPS_DDR3_CS_N),                     //                             .mem_cs_n
        .memory_mem_ras_n                    (HPS_DDR3_RAS_N),                    //                             .mem_ras_n
        .memory_mem_cas_n                    (HPS_DDR3_CAS_N),                    //                             .mem_cas_n
        .memory_mem_we_n                     (HPS_DDR3_WE_N),                     //                             .mem_we_n
        .memory_mem_reset_n                  (HPS_DDR3_RESET_N),                  //                             .mem_reset_n
        .memory_mem_dq                       (HPS_DDR3_DQ),                       //                             .mem_dq
        .memory_mem_dqs                      (HPS_DDR3_DQS_P),                      //                             .mem_dqs
        .memory_mem_dqs_n                    (HPS_DDR3_DQS_N),                    //                             .mem_dqs_n
        .memory_mem_odt                      (HPS_DDR3_ODT),                      //                             .mem_odt
        .memory_mem_dm                       (HPS_DDR3_DM),                       //                             .mem_dm
        .memory_oct_rzqin                    (HPS_DDR3_RZQ),                    //                             .oct_rzqin
		  .reset_reset_n                       (1'b1),
		  .chrom_seg_0_export                  (rawChromInput[0]),              //    chrom_seg_0.export
        .chrom_seg_1_export                  (rawChromInput[1]),              //    chrom_seg_1.export
        .chrom_seg_2_export                  (rawChromInput[2]),              //    chrom_seg_2.export
        .chrom_seg_3_export                  (rawChromInput[3]),              //    chrom_seg_3.export
        .chrom_seg_4_export                  (rawChromInput[4]),              //    chrom_seg_4.export
        .chrom_seg_5_export                  (rawChromInput[5]),              //    chrom_seg_5.export
        .chrom_seg_6_export                  (rawChromInput[6]),              //    chrom_seg_6.export
        .chrom_seg_7_export                  (rawChromInput[7]),              //    chrom_seg_7.export
        .chrom_seg_8_export                  (rawChromInput[8]),              //    chrom_seg_8.export
        .chrom_seg_9_export                  (rawChromInput[9]),              //    chrom_seg_9.export
        .chrom_seg_10_export                 (rawChromInput[10]),             //   chrom_seg_10.export
        .chrom_seg_11_export                 (rawChromInput[11]),             //   chrom_seg_11.export
        .chrom_seg_12_export                 (rawChromInput[12]),             //   chrom_seg_12.export
        .chrom_seg_13_export                 (rawChromInput[13]),             //   chrom_seg_13.export
        .chrom_seg_14_export                 (rawChromInput[14]),             //   chrom_seg_14.export
        .chrom_seg_15_export                 (rawChromInput[15]),             //   chrom_seg_15.export
        .chrom_seg_16_export                 (rawChromInput[16]),             //   chrom_seg_16.export
        .chrom_seg_17_export                 (rawChromInput[17]),             //   chrom_seg_17.export
        .chrom_seg_18_export                 (rawChromInput[18]),             //   chrom_seg_18.export
        .chrom_seg_19_export                 (rawChromInput[19]),             //   chrom_seg_19.export
        .chrom_seg_20_export                 (rawChromInput[20]),             //   chrom_seg_20.export
        .chrom_seg_21_export                 (rawChromInput[21]),             //   chrom_seg_21.export
        .chrom_seg_22_export                 (rawChromInput[22]),             //   chrom_seg_22.export
        .chrom_seg_23_export                 (rawChromInput[23]),             //   chrom_seg_23.export
        .chrom_seg_24_export                 (rawChromInput[24]),             //   chrom_seg_24.export
        .chrom_seg_25_export                 (rawChromInput[25]),             //   chrom_seg_25.export
        .chrom_seg_26_export                 (rawChromInput[26]),             //   chrom_seg_26.export
        .chrom_seg_27_export                 (rawChromInput[27]),             //   chrom_seg_27.export
        .chrom_seg_28_export                 (rawChromInput[28]),             //   chrom_seg_28.export
        .chrom_seg_29_export                 (rawChromInput[29]),             //   chrom_seg_29.export
        .chrom_seg_30_export                 (rawChromInput[30]),
		  .error_sum_0_export                  (errorSumOutput[0]),
		  .error_sum_1_export                  (errorSumOutput[1]),
		  .error_sum_2_export                  (errorSumOutput[2]),
		  .error_sum_3_export                  (errorSumOutput[3]),
		  .error_sum_4_export                  (errorSumOutput[4]),
		  .error_sum_5_export                  (errorSumOutput[5]),
		  .error_sum_6_export                  (errorSumOutput[6]),
		  .error_sum_7_export                  (errorSumOutput[7]),
		  
		  .input_sequence_0_export					({ inputSequences[3], inputSequences[2], inputSequences[1], inputSequences[0] }),
		  .input_sequence_1_export					({ inputSequences[7], inputSequences[6], inputSequences[5], inputSequences[4] }),
		  .input_sequence_2_export					({ inputSequences[11], inputSequences[10], inputSequences[9], inputSequences[8] }),
		  .input_sequence_3_export					({ inputSequences[15], inputSequences[14], inputSequences[13], inputSequences[12] }),
		  .input_sequence_4_export					({ inputSequences[19], inputSequences[18], inputSequences[17], inputSequences[16] }),
		  .input_sequence_5_export					({ inputSequences[23], inputSequences[22], inputSequences[21], inputSequences[20] }),
		  .input_sequence_6_export					({ inputSequences[27], inputSequences[26], inputSequences[25], inputSequences[24] }),
		  .input_sequence_7_export					({ inputSequences[31], inputSequences[30], inputSequences[29], inputSequences[28] }),
		  .input_sequence_8_export					({ inputSequences[35], inputSequences[34], inputSequences[33], inputSequences[32] }),
		  .input_sequence_9_export					({ inputSequences[39], inputSequences[38], inputSequences[37], inputSequences[36] }),
		  .input_sequence_10_export				({ inputSequences[43], inputSequences[42], inputSequences[41], inputSequences[40] }),
		  .input_sequence_11_export				({ inputSequences[47], inputSequences[46], inputSequences[45], inputSequences[44] }),
		  .input_sequence_12_export				({ inputSequences[51], inputSequences[50], inputSequences[49], inputSequences[48] }),
		  .input_sequence_13_export				({ inputSequences[55], inputSequences[54], inputSequences[53], inputSequences[52] }),
		  .input_sequence_14_export				({ inputSequences[59], inputSequences[58], inputSequences[57], inputSequences[56] }),
		  .input_sequence_15_export				({ inputSequences[63], inputSequences[62], inputSequences[61], inputSequences[60] }),
		  .expected_output_0_export				({ expectedOutputs[3], expectedOutputs[2], expectedOutputs[1], expectedOutputs[0] }),
		  .expected_output_1_export				({ expectedOutputs[7], expectedOutputs[6], expectedOutputs[5], expectedOutputs[4] }),
		  .expected_output_2_export				({ expectedOutputs[11], expectedOutputs[10], expectedOutputs[9], expectedOutputs[8] }),
		  .expected_output_3_export				({ expectedOutputs[15], expectedOutputs[14], expectedOutputs[13], expectedOutputs[12] }),
		  .expected_output_4_export				({ expectedOutputs[19], expectedOutputs[18], expectedOutputs[17], expectedOutputs[16] }),
		  .expected_output_5_export				({ expectedOutputs[23], expectedOutputs[22], expectedOutputs[21], expectedOutputs[20] }),
		  .expected_output_6_export				({ expectedOutputs[27], expectedOutputs[26], expectedOutputs[25], expectedOutputs[24] }),
		  .expected_output_7_export				({ expectedOutputs[31], expectedOutputs[30], expectedOutputs[29], expectedOutputs[28] }),
		  .expected_output_8_export				({ expectedOutputs[35], expectedOutputs[34], expectedOutputs[33], expectedOutputs[32] }),
		  .expected_output_9_export				({ expectedOutputs[39], expectedOutputs[38], expectedOutputs[37], expectedOutputs[36] }),
		  .expected_output_10_export				({ expectedOutputs[43], expectedOutputs[42], expectedOutputs[41], expectedOutputs[40] }),
		  .expected_output_11_export				({ expectedOutputs[47], expectedOutputs[46], expectedOutputs[45], expectedOutputs[44] }),
		  .expected_output_12_export				({ expectedOutputs[51], expectedOutputs[50], expectedOutputs[49], expectedOutputs[48] }),
		  .expected_output_13_export				({ expectedOutputs[55], expectedOutputs[54], expectedOutputs[53], expectedOutputs[52] }),
		  .expected_output_14_export				({ expectedOutputs[59], expectedOutputs[58], expectedOutputs[57], expectedOutputs[56] }),
		  .expected_output_15_export				({ expectedOutputs[63], expectedOutputs[62], expectedOutputs[61], expectedOutputs[60] }),
		  .valid_output_0_export					({validOutputs[3], validOutputs[2], validOutputs[1], validOutputs[0] }),
		  .valid_output_1_export					({validOutputs[7], validOutputs[6], validOutputs[5], validOutputs[4] }),
		  .valid_output_2_export					({validOutputs[11], validOutputs[10], validOutputs[9], validOutputs[8] }),
		  .valid_output_3_export					({validOutputs[15], validOutputs[14], validOutputs[13], validOutputs[12] }),
		  .valid_output_4_export					({validOutputs[19], validOutputs[18], validOutputs[17], validOutputs[16] }),
		  .valid_output_5_export					({validOutputs[23], validOutputs[22], validOutputs[21], validOutputs[20] }),
		  .valid_output_6_export					({validOutputs[27], validOutputs[26], validOutputs[25], validOutputs[24] }),
		  .valid_output_7_export					({validOutputs[31], validOutputs[30], validOutputs[29], validOutputs[28] }),
		  .valid_output_8_export					({validOutputs[35], validOutputs[34], validOutputs[33], validOutputs[32] }),
		  .valid_output_9_export					({validOutputs[39], validOutputs[38], validOutputs[37], validOutputs[36] }),
		  .valid_output_10_export					({validOutputs[43], validOutputs[42], validOutputs[41], validOutputs[40] }),
		  .valid_output_11_export					({validOutputs[47], validOutputs[46], validOutputs[45], validOutputs[44] }),
		  .valid_output_12_export					({validOutputs[51], validOutputs[50], validOutputs[49], validOutputs[48] }),
		  .valid_output_13_export					({validOutputs[55], validOutputs[54], validOutputs[53], validOutputs[52] }),
		  .valid_output_14_export					({validOutputs[59], validOutputs[58], validOutputs[57], validOutputs[56] }),
		  .valid_output_15_export					({validOutputs[63], validOutputs[62], validOutputs[61], validOutputs[60] }),
		  .sequences_to_process_export         (sequencesToProcess),
		  .start_processing_chrom_export       (startProcessingChrom),   // start_processing_chrom.export
        .done_processing_chrom_export        (doneProcessingChrom),     //  done_processing_chrom.export
		  .ready_to_process_export             (readyToProcess),
		  .done_processing_feedback_export     (doneProcessingFeedback),
		  
		  .mem_s2_address                      (memAddress),
		  .mem_s2_chipselect                   (1'b1),
		  .mem_s2_clken                        (1'b1),
		  .mem_s2_write                        (writeToMem),
		  .mem_s2_readdata                     (memReadData),
		  .mem_s2_writedata                    (memWriteData),
		  .mem_s2_byteenable                   (4'b1111),
		  
		  .correct_mem_s2_address              (correctMemAddress),
		  .correct_mem_s2_chipselect           (1'b1),
		  .correct_mem_s2_clken                (1'b1),
		  .correct_mem_s2_write                (writeToCorrectMem),
		  .correct_mem_s2_readdata             (),
		  .correct_mem_s2_writedata            (memReadData),
		  .correct_mem_s2_byteenable           (4'b1111)
    );

chromosomeProcessingStateMachine cpsm
	( .iClock(CLOCK_50)
	, .iConcatedChromDescription(concatedChromInput)
	, .iInputSequence(inputSequences)
	, .iExpectedOutput(expectedOutputs)
	, .iValidOutput(validOutputs)
	, .iHardCodedInput(SW[7:0])
	, .iUseHardcodedInput(SW[8])
	, .iUseLastManualInput(SW[9])
	, .iLastRepetitionManualInput(~KEY[0])
	, .iClockChangeCyclesSelector(SW[7:6])
	, .iSequencesToProcess(sequencesToProcess)
	
	// State machine control
	, .iStartProcessing(startProcessingChrom)
	, .iDoneProcessingFeedback(doneProcessingFeedback)
	, .oReadyToProcess(readyToProcess)
	, .oDoneProcessing(doneProcessingChrom)
	
	, .oChromOutput(chromOutput)
	, .oErrorSums(errorSumOutput)
	, .oState(state)
	
	, .oMemContentToWrite(memWriteData)
	, .oMemAddr(memAddress)
	, .oCorrectMemAddr(correctMemAddress)
	, .oWriteToMem(writeToMem)
	, .oWriteToCorrectMem(writeToCorrectMem)
	);
	 
endmodule