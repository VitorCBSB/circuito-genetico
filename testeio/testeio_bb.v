
module testeio (
	chrom_seg_0_export,
	chrom_seg_1_export,
	chrom_seg_10_export,
	chrom_seg_11_export,
	chrom_seg_12_export,
	chrom_seg_13_export,
	chrom_seg_14_export,
	chrom_seg_15_export,
	chrom_seg_16_export,
	chrom_seg_17_export,
	chrom_seg_18_export,
	chrom_seg_19_export,
	chrom_seg_2_export,
	chrom_seg_20_export,
	chrom_seg_21_export,
	chrom_seg_22_export,
	chrom_seg_23_export,
	chrom_seg_24_export,
	chrom_seg_25_export,
	chrom_seg_26_export,
	chrom_seg_27_export,
	chrom_seg_28_export,
	chrom_seg_29_export,
	chrom_seg_3_export,
	chrom_seg_30_export,
	chrom_seg_4_export,
	chrom_seg_5_export,
	chrom_seg_6_export,
	chrom_seg_7_export,
	chrom_seg_8_export,
	chrom_seg_9_export,
	clk_clk,
	done_processing_chrom_export,
	done_processing_feedback_export,
	error_sum_0_export,
	error_sum_1_export,
	error_sum_2_export,
	error_sum_3_export,
	error_sum_4_export,
	error_sum_5_export,
	error_sum_6_export,
	error_sum_7_export,
	expected_output_0_export,
	expected_output_1_export,
	expected_output_2_export,
	expected_output_3_export,
	expected_output_4_export,
	hps_io_hps_io_emac1_inst_TX_CLK,
	hps_io_hps_io_emac1_inst_TXD0,
	hps_io_hps_io_emac1_inst_TXD1,
	hps_io_hps_io_emac1_inst_TXD2,
	hps_io_hps_io_emac1_inst_TXD3,
	hps_io_hps_io_emac1_inst_RXD0,
	hps_io_hps_io_emac1_inst_MDIO,
	hps_io_hps_io_emac1_inst_MDC,
	hps_io_hps_io_emac1_inst_RX_CTL,
	hps_io_hps_io_emac1_inst_TX_CTL,
	hps_io_hps_io_emac1_inst_RX_CLK,
	hps_io_hps_io_emac1_inst_RXD1,
	hps_io_hps_io_emac1_inst_RXD2,
	hps_io_hps_io_emac1_inst_RXD3,
	hps_io_hps_io_sdio_inst_CMD,
	hps_io_hps_io_sdio_inst_D0,
	hps_io_hps_io_sdio_inst_D1,
	hps_io_hps_io_sdio_inst_CLK,
	hps_io_hps_io_sdio_inst_D2,
	hps_io_hps_io_sdio_inst_D3,
	hps_io_hps_io_usb1_inst_D0,
	hps_io_hps_io_usb1_inst_D1,
	hps_io_hps_io_usb1_inst_D2,
	hps_io_hps_io_usb1_inst_D3,
	hps_io_hps_io_usb1_inst_D4,
	hps_io_hps_io_usb1_inst_D5,
	hps_io_hps_io_usb1_inst_D6,
	hps_io_hps_io_usb1_inst_D7,
	hps_io_hps_io_usb1_inst_CLK,
	hps_io_hps_io_usb1_inst_STP,
	hps_io_hps_io_usb1_inst_DIR,
	hps_io_hps_io_usb1_inst_NXT,
	hps_io_hps_io_uart0_inst_RX,
	hps_io_hps_io_uart0_inst_TX,
	input_sequence_0_export,
	input_sequence_1_export,
	input_sequence_2_export,
	input_sequence_3_export,
	input_sequence_4_export,
	mem_s2_address,
	mem_s2_chipselect,
	mem_s2_clken,
	mem_s2_write,
	mem_s2_readdata,
	mem_s2_writedata,
	mem_s2_byteenable,
	memory_mem_a,
	memory_mem_ba,
	memory_mem_ck,
	memory_mem_ck_n,
	memory_mem_cke,
	memory_mem_cs_n,
	memory_mem_ras_n,
	memory_mem_cas_n,
	memory_mem_we_n,
	memory_mem_reset_n,
	memory_mem_dq,
	memory_mem_dqs,
	memory_mem_dqs_n,
	memory_mem_odt,
	memory_mem_dm,
	memory_oct_rzqin,
	ready_to_process_export,
	reset_reset_n,
	sequences_to_process_export,
	start_processing_chrom_export,
	valid_output_0_export,
	valid_output_1_export,
	valid_output_2_export,
	valid_output_3_export,
	valid_output_4_export,
	valid_output_5_export,
	valid_output_6_export,
	valid_output_7_export,
	valid_output_8_export,
	valid_output_9_export,
	valid_output_10_export,
	valid_output_11_export,
	valid_output_12_export,
	valid_output_13_export,
	valid_output_14_export,
	valid_output_15_export,
	valid_output_16_export,
	valid_output_17_export,
	valid_output_18_export,
	valid_output_19_export,
	valid_output_20_export,
	valid_output_21_export,
	valid_output_22_export,
	valid_output_23_export,
	valid_output_24_export,
	valid_output_25_export,
	input_sequence_62_export,
	valid_output_26_export,
	valid_output_27_export,
	valid_output_28_export,
	valid_output_29_export,
	valid_output_30_export,
	valid_output_31_export,
	valid_output_32_export,
	valid_output_33_export,
	valid_output_34_export,
	valid_output_35_export,
	valid_output_36_export,
	valid_output_37_export,
	valid_output_38_export,
	valid_output_39_export,
	valid_output_40_export,
	valid_output_41_export,
	valid_output_42_export,
	valid_output_43_export,
	valid_output_44_export,
	valid_output_45_export,
	valid_output_46_export,
	valid_output_47_export,
	valid_output_48_export,
	valid_output_49_export,
	valid_output_50_export,
	valid_output_51_export,
	valid_output_52_export,
	valid_output_53_export,
	valid_output_54_export,
	valid_output_55_export,
	valid_output_56_export,
	valid_output_57_export,
	valid_output_58_export,
	valid_output_59_export,
	valid_output_60_export,
	valid_output_61_export,
	valid_output_62_export,
	valid_output_63_export,
	input_sequence_5_export,
	input_sequence_6_export,
	input_sequence_7_export,
	input_sequence_8_export,
	input_sequence_9_export,
	input_sequence_10_export,
	input_sequence_11_export,
	input_sequence_12_export,
	input_sequence_13_export,
	input_sequence_14_export,
	input_sequence_15_export,
	input_sequence_16_export,
	input_sequence_17_export,
	input_sequence_18_export,
	input_sequence_19_export,
	input_sequence_20_export,
	input_sequence_21_export,
	input_sequence_22_export,
	input_sequence_23_export,
	input_sequence_24_export,
	input_sequence_25_export,
	input_sequence_26_export,
	input_sequence_27_export,
	input_sequence_28_export,
	input_sequence_29_export,
	input_sequence_30_export,
	input_sequence_31_export,
	input_sequence_32_export,
	input_sequence_33_export,
	input_sequence_34_export,
	input_sequence_35_export,
	input_sequence_36_export,
	input_sequence_37_export,
	input_sequence_38_export,
	input_sequence_39_export,
	input_sequence_40_export,
	input_sequence_41_export,
	input_sequence_42_export,
	input_sequence_43_export,
	input_sequence_44_export,
	input_sequence_45_export,
	input_sequence_46_export,
	input_sequence_47_export,
	input_sequence_48_export,
	input_sequence_49_export,
	input_sequence_50_export,
	input_sequence_51_export,
	input_sequence_52_export,
	input_sequence_53_export,
	input_sequence_54_export,
	input_sequence_55_export,
	input_sequence_56_export,
	input_sequence_57_export,
	input_sequence_58_export,
	input_sequence_59_export,
	input_sequence_60_export,
	input_sequence_61_export,
	input_sequence_63_export,
	expected_output_5_export,
	expected_output_6_export,
	expected_output_7_export,
	expected_output_8_export,
	expected_output_9_export,
	expected_output_10_export,
	expected_output_11_export,
	expected_output_12_export,
	expected_output_13_export,
	expected_output_14_export,
	expected_output_15_export,
	expected_output_16_export,
	expected_output_17_export,
	expected_output_18_export,
	expected_output_19_export,
	expected_output_20_export,
	expected_output_21_export,
	expected_output_22_export,
	expected_output_23_export,
	expected_output_24_export,
	expected_output_25_export,
	expected_output_26_export,
	expected_output_27_export,
	expected_output_28_export,
	expected_output_29_export,
	expected_output_30_export,
	expected_output_31_export,
	expected_output_32_export,
	expected_output_33_export,
	expected_output_34_export,
	expected_output_35_export,
	expected_output_36_export,
	expected_output_37_export,
	expected_output_38_export,
	expected_output_39_export,
	expected_output_40_export,
	expected_output_41_export,
	expected_output_42_export,
	expected_output_43_export,
	expected_output_44_export,
	expected_output_45_export,
	expected_output_46_export,
	expected_output_47_export,
	expected_output_48_export,
	expected_output_49_export,
	expected_output_50_export,
	expected_output_51_export,
	expected_output_52_export,
	expected_output_53_export,
	expected_output_54_export,
	expected_output_55_export,
	expected_output_56_export,
	expected_output_57_export,
	expected_output_58_export,
	expected_output_59_export,
	expected_output_60_export,
	expected_output_61_export,
	expected_output_62_export,
	expected_output_63_export);	

	output	[31:0]	chrom_seg_0_export;
	output	[31:0]	chrom_seg_1_export;
	output	[31:0]	chrom_seg_10_export;
	output	[31:0]	chrom_seg_11_export;
	output	[31:0]	chrom_seg_12_export;
	output	[31:0]	chrom_seg_13_export;
	output	[31:0]	chrom_seg_14_export;
	output	[31:0]	chrom_seg_15_export;
	output	[31:0]	chrom_seg_16_export;
	output	[31:0]	chrom_seg_17_export;
	output	[31:0]	chrom_seg_18_export;
	output	[31:0]	chrom_seg_19_export;
	output	[31:0]	chrom_seg_2_export;
	output	[31:0]	chrom_seg_20_export;
	output	[31:0]	chrom_seg_21_export;
	output	[31:0]	chrom_seg_22_export;
	output	[31:0]	chrom_seg_23_export;
	output	[31:0]	chrom_seg_24_export;
	output	[31:0]	chrom_seg_25_export;
	output	[31:0]	chrom_seg_26_export;
	output	[31:0]	chrom_seg_27_export;
	output	[31:0]	chrom_seg_28_export;
	output	[31:0]	chrom_seg_29_export;
	output	[31:0]	chrom_seg_3_export;
	output	[31:0]	chrom_seg_30_export;
	output	[31:0]	chrom_seg_4_export;
	output	[31:0]	chrom_seg_5_export;
	output	[31:0]	chrom_seg_6_export;
	output	[31:0]	chrom_seg_7_export;
	output	[31:0]	chrom_seg_8_export;
	output	[31:0]	chrom_seg_9_export;
	input		clk_clk;
	input		done_processing_chrom_export;
	output		done_processing_feedback_export;
	input	[31:0]	error_sum_0_export;
	input	[31:0]	error_sum_1_export;
	input	[31:0]	error_sum_2_export;
	input	[31:0]	error_sum_3_export;
	input	[31:0]	error_sum_4_export;
	input	[31:0]	error_sum_5_export;
	input	[31:0]	error_sum_6_export;
	input	[31:0]	error_sum_7_export;
	output	[31:0]	expected_output_0_export;
	output	[31:0]	expected_output_1_export;
	output	[31:0]	expected_output_2_export;
	output	[31:0]	expected_output_3_export;
	output	[31:0]	expected_output_4_export;
	output		hps_io_hps_io_emac1_inst_TX_CLK;
	output		hps_io_hps_io_emac1_inst_TXD0;
	output		hps_io_hps_io_emac1_inst_TXD1;
	output		hps_io_hps_io_emac1_inst_TXD2;
	output		hps_io_hps_io_emac1_inst_TXD3;
	input		hps_io_hps_io_emac1_inst_RXD0;
	inout		hps_io_hps_io_emac1_inst_MDIO;
	output		hps_io_hps_io_emac1_inst_MDC;
	input		hps_io_hps_io_emac1_inst_RX_CTL;
	output		hps_io_hps_io_emac1_inst_TX_CTL;
	input		hps_io_hps_io_emac1_inst_RX_CLK;
	input		hps_io_hps_io_emac1_inst_RXD1;
	input		hps_io_hps_io_emac1_inst_RXD2;
	input		hps_io_hps_io_emac1_inst_RXD3;
	inout		hps_io_hps_io_sdio_inst_CMD;
	inout		hps_io_hps_io_sdio_inst_D0;
	inout		hps_io_hps_io_sdio_inst_D1;
	output		hps_io_hps_io_sdio_inst_CLK;
	inout		hps_io_hps_io_sdio_inst_D2;
	inout		hps_io_hps_io_sdio_inst_D3;
	inout		hps_io_hps_io_usb1_inst_D0;
	inout		hps_io_hps_io_usb1_inst_D1;
	inout		hps_io_hps_io_usb1_inst_D2;
	inout		hps_io_hps_io_usb1_inst_D3;
	inout		hps_io_hps_io_usb1_inst_D4;
	inout		hps_io_hps_io_usb1_inst_D5;
	inout		hps_io_hps_io_usb1_inst_D6;
	inout		hps_io_hps_io_usb1_inst_D7;
	input		hps_io_hps_io_usb1_inst_CLK;
	output		hps_io_hps_io_usb1_inst_STP;
	input		hps_io_hps_io_usb1_inst_DIR;
	input		hps_io_hps_io_usb1_inst_NXT;
	input		hps_io_hps_io_uart0_inst_RX;
	output		hps_io_hps_io_uart0_inst_TX;
	output	[31:0]	input_sequence_0_export;
	output	[31:0]	input_sequence_1_export;
	output	[31:0]	input_sequence_2_export;
	output	[31:0]	input_sequence_3_export;
	output	[31:0]	input_sequence_4_export;
	input	[15:0]	mem_s2_address;
	input		mem_s2_chipselect;
	input		mem_s2_clken;
	input		mem_s2_write;
	output	[31:0]	mem_s2_readdata;
	input	[31:0]	mem_s2_writedata;
	input	[3:0]	mem_s2_byteenable;
	output	[14:0]	memory_mem_a;
	output	[2:0]	memory_mem_ba;
	output		memory_mem_ck;
	output		memory_mem_ck_n;
	output		memory_mem_cke;
	output		memory_mem_cs_n;
	output		memory_mem_ras_n;
	output		memory_mem_cas_n;
	output		memory_mem_we_n;
	output		memory_mem_reset_n;
	inout	[31:0]	memory_mem_dq;
	inout	[3:0]	memory_mem_dqs;
	inout	[3:0]	memory_mem_dqs_n;
	output		memory_mem_odt;
	output	[3:0]	memory_mem_dm;
	input		memory_oct_rzqin;
	input		ready_to_process_export;
	input		reset_reset_n;
	output	[31:0]	sequences_to_process_export;
	output		start_processing_chrom_export;
	output	[31:0]	valid_output_0_export;
	output	[31:0]	valid_output_1_export;
	output	[31:0]	valid_output_2_export;
	output	[31:0]	valid_output_3_export;
	output	[31:0]	valid_output_4_export;
	output	[31:0]	valid_output_5_export;
	output	[31:0]	valid_output_6_export;
	output	[31:0]	valid_output_7_export;
	output	[31:0]	valid_output_8_export;
	output	[31:0]	valid_output_9_export;
	output	[31:0]	valid_output_10_export;
	output	[31:0]	valid_output_11_export;
	output	[31:0]	valid_output_12_export;
	output	[31:0]	valid_output_13_export;
	output	[31:0]	valid_output_14_export;
	output	[31:0]	valid_output_15_export;
	output	[31:0]	valid_output_16_export;
	output	[31:0]	valid_output_17_export;
	output	[31:0]	valid_output_18_export;
	output	[31:0]	valid_output_19_export;
	output	[31:0]	valid_output_20_export;
	output	[31:0]	valid_output_21_export;
	output	[31:0]	valid_output_22_export;
	output	[31:0]	valid_output_23_export;
	output	[31:0]	valid_output_24_export;
	output	[31:0]	valid_output_25_export;
	output	[31:0]	input_sequence_62_export;
	output	[31:0]	valid_output_26_export;
	output	[31:0]	valid_output_27_export;
	output	[31:0]	valid_output_28_export;
	output	[31:0]	valid_output_29_export;
	output	[31:0]	valid_output_30_export;
	output	[31:0]	valid_output_31_export;
	output	[31:0]	valid_output_32_export;
	output	[31:0]	valid_output_33_export;
	output	[31:0]	valid_output_34_export;
	output	[31:0]	valid_output_35_export;
	output	[31:0]	valid_output_36_export;
	output	[31:0]	valid_output_37_export;
	output	[31:0]	valid_output_38_export;
	output	[31:0]	valid_output_39_export;
	output	[31:0]	valid_output_40_export;
	output	[31:0]	valid_output_41_export;
	output	[31:0]	valid_output_42_export;
	output	[31:0]	valid_output_43_export;
	output	[31:0]	valid_output_44_export;
	output	[31:0]	valid_output_45_export;
	output	[31:0]	valid_output_46_export;
	output	[31:0]	valid_output_47_export;
	output	[31:0]	valid_output_48_export;
	output	[31:0]	valid_output_49_export;
	output	[31:0]	valid_output_50_export;
	output	[31:0]	valid_output_51_export;
	output	[31:0]	valid_output_52_export;
	output	[31:0]	valid_output_53_export;
	output	[31:0]	valid_output_54_export;
	output	[31:0]	valid_output_55_export;
	output	[31:0]	valid_output_56_export;
	output	[31:0]	valid_output_57_export;
	output	[31:0]	valid_output_58_export;
	output	[31:0]	valid_output_59_export;
	output	[31:0]	valid_output_60_export;
	output	[31:0]	valid_output_61_export;
	output	[31:0]	valid_output_62_export;
	output	[31:0]	valid_output_63_export;
	output	[31:0]	input_sequence_5_export;
	output	[31:0]	input_sequence_6_export;
	output	[31:0]	input_sequence_7_export;
	output	[31:0]	input_sequence_8_export;
	output	[31:0]	input_sequence_9_export;
	output	[31:0]	input_sequence_10_export;
	output	[31:0]	input_sequence_11_export;
	output	[31:0]	input_sequence_12_export;
	output	[31:0]	input_sequence_13_export;
	output	[31:0]	input_sequence_14_export;
	output	[31:0]	input_sequence_15_export;
	output	[31:0]	input_sequence_16_export;
	output	[31:0]	input_sequence_17_export;
	output	[31:0]	input_sequence_18_export;
	output	[31:0]	input_sequence_19_export;
	output	[31:0]	input_sequence_20_export;
	output	[31:0]	input_sequence_21_export;
	output	[31:0]	input_sequence_22_export;
	output	[31:0]	input_sequence_23_export;
	output	[31:0]	input_sequence_24_export;
	output	[31:0]	input_sequence_25_export;
	output	[31:0]	input_sequence_26_export;
	output	[31:0]	input_sequence_27_export;
	output	[31:0]	input_sequence_28_export;
	output	[31:0]	input_sequence_29_export;
	output	[31:0]	input_sequence_30_export;
	output	[31:0]	input_sequence_31_export;
	output	[31:0]	input_sequence_32_export;
	output	[31:0]	input_sequence_33_export;
	output	[31:0]	input_sequence_34_export;
	output	[31:0]	input_sequence_35_export;
	output	[31:0]	input_sequence_36_export;
	output	[31:0]	input_sequence_37_export;
	output	[31:0]	input_sequence_38_export;
	output	[31:0]	input_sequence_39_export;
	output	[31:0]	input_sequence_40_export;
	output	[31:0]	input_sequence_41_export;
	output	[31:0]	input_sequence_42_export;
	output	[31:0]	input_sequence_43_export;
	output	[31:0]	input_sequence_44_export;
	output	[31:0]	input_sequence_45_export;
	output	[31:0]	input_sequence_46_export;
	output	[31:0]	input_sequence_47_export;
	output	[31:0]	input_sequence_48_export;
	output	[31:0]	input_sequence_49_export;
	output	[31:0]	input_sequence_50_export;
	output	[31:0]	input_sequence_51_export;
	output	[31:0]	input_sequence_52_export;
	output	[31:0]	input_sequence_53_export;
	output	[31:0]	input_sequence_54_export;
	output	[31:0]	input_sequence_55_export;
	output	[31:0]	input_sequence_56_export;
	output	[31:0]	input_sequence_57_export;
	output	[31:0]	input_sequence_58_export;
	output	[31:0]	input_sequence_59_export;
	output	[31:0]	input_sequence_60_export;
	output	[31:0]	input_sequence_61_export;
	output	[31:0]	input_sequence_63_export;
	output	[31:0]	expected_output_5_export;
	output	[31:0]	expected_output_6_export;
	output	[31:0]	expected_output_7_export;
	output	[31:0]	expected_output_8_export;
	output	[31:0]	expected_output_9_export;
	output	[31:0]	expected_output_10_export;
	output	[31:0]	expected_output_11_export;
	output	[31:0]	expected_output_12_export;
	output	[31:0]	expected_output_13_export;
	output	[31:0]	expected_output_14_export;
	output	[31:0]	expected_output_15_export;
	output	[31:0]	expected_output_16_export;
	output	[31:0]	expected_output_17_export;
	output	[31:0]	expected_output_18_export;
	output	[31:0]	expected_output_19_export;
	output	[31:0]	expected_output_20_export;
	output	[31:0]	expected_output_21_export;
	output	[31:0]	expected_output_22_export;
	output	[31:0]	expected_output_23_export;
	output	[31:0]	expected_output_24_export;
	output	[31:0]	expected_output_25_export;
	output	[31:0]	expected_output_26_export;
	output	[31:0]	expected_output_27_export;
	output	[31:0]	expected_output_28_export;
	output	[31:0]	expected_output_29_export;
	output	[31:0]	expected_output_30_export;
	output	[31:0]	expected_output_31_export;
	output	[31:0]	expected_output_32_export;
	output	[31:0]	expected_output_33_export;
	output	[31:0]	expected_output_34_export;
	output	[31:0]	expected_output_35_export;
	output	[31:0]	expected_output_36_export;
	output	[31:0]	expected_output_37_export;
	output	[31:0]	expected_output_38_export;
	output	[31:0]	expected_output_39_export;
	output	[31:0]	expected_output_40_export;
	output	[31:0]	expected_output_41_export;
	output	[31:0]	expected_output_42_export;
	output	[31:0]	expected_output_43_export;
	output	[31:0]	expected_output_44_export;
	output	[31:0]	expected_output_45_export;
	output	[31:0]	expected_output_46_export;
	output	[31:0]	expected_output_47_export;
	output	[31:0]	expected_output_48_export;
	output	[31:0]	expected_output_49_export;
	output	[31:0]	expected_output_50_export;
	output	[31:0]	expected_output_51_export;
	output	[31:0]	expected_output_52_export;
	output	[31:0]	expected_output_53_export;
	output	[31:0]	expected_output_54_export;
	output	[31:0]	expected_output_55_export;
	output	[31:0]	expected_output_56_export;
	output	[31:0]	expected_output_57_export;
	output	[31:0]	expected_output_58_export;
	output	[31:0]	expected_output_59_export;
	output	[31:0]	expected_output_60_export;
	output	[31:0]	expected_output_61_export;
	output	[31:0]	expected_output_62_export;
	output	[31:0]	expected_output_63_export;
endmodule
