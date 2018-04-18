// (C) 2001-2016 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel MegaCore Function License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// (C) 2001-2014 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License Subscription 
// Agreement, Altera MegaCore Function License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// $Id: //acds/rel/16.1/ip/merlin/altera_merlin_multiplexer/altera_merlin_multiplexer.sv.terp#1 $
// $Revision: #1 $
// $Date: 2016/08/07 $
// $Author: swbranch $

// ------------------------------------------
// Merlin Multiplexer
// ------------------------------------------

`timescale 1 ns / 1 ns


// ------------------------------------------
// Generation parameters:
//   output_name:         testeio_mm_interconnect_0_rsp_mux
//   NUM_INPUTS:          142
//   ARBITRATION_SHARES:  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
//   ARBITRATION_SCHEME   "no-arb"
//   PIPELINE_ARB:        0
//   PKT_TRANS_LOCK:      61 (arbitration locking enabled)
//   ST_DATA_W:           126
//   ST_CHANNEL_W:        142
// ------------------------------------------

module testeio_mm_interconnect_0_rsp_mux
(
    // ----------------------
    // Sinks
    // ----------------------
    input                       sink0_valid,
    input [126-1   : 0]  sink0_data,
    input [142-1: 0]  sink0_channel,
    input                       sink0_startofpacket,
    input                       sink0_endofpacket,
    output                      sink0_ready,

    input                       sink1_valid,
    input [126-1   : 0]  sink1_data,
    input [142-1: 0]  sink1_channel,
    input                       sink1_startofpacket,
    input                       sink1_endofpacket,
    output                      sink1_ready,

    input                       sink2_valid,
    input [126-1   : 0]  sink2_data,
    input [142-1: 0]  sink2_channel,
    input                       sink2_startofpacket,
    input                       sink2_endofpacket,
    output                      sink2_ready,

    input                       sink3_valid,
    input [126-1   : 0]  sink3_data,
    input [142-1: 0]  sink3_channel,
    input                       sink3_startofpacket,
    input                       sink3_endofpacket,
    output                      sink3_ready,

    input                       sink4_valid,
    input [126-1   : 0]  sink4_data,
    input [142-1: 0]  sink4_channel,
    input                       sink4_startofpacket,
    input                       sink4_endofpacket,
    output                      sink4_ready,

    input                       sink5_valid,
    input [126-1   : 0]  sink5_data,
    input [142-1: 0]  sink5_channel,
    input                       sink5_startofpacket,
    input                       sink5_endofpacket,
    output                      sink5_ready,

    input                       sink6_valid,
    input [126-1   : 0]  sink6_data,
    input [142-1: 0]  sink6_channel,
    input                       sink6_startofpacket,
    input                       sink6_endofpacket,
    output                      sink6_ready,

    input                       sink7_valid,
    input [126-1   : 0]  sink7_data,
    input [142-1: 0]  sink7_channel,
    input                       sink7_startofpacket,
    input                       sink7_endofpacket,
    output                      sink7_ready,

    input                       sink8_valid,
    input [126-1   : 0]  sink8_data,
    input [142-1: 0]  sink8_channel,
    input                       sink8_startofpacket,
    input                       sink8_endofpacket,
    output                      sink8_ready,

    input                       sink9_valid,
    input [126-1   : 0]  sink9_data,
    input [142-1: 0]  sink9_channel,
    input                       sink9_startofpacket,
    input                       sink9_endofpacket,
    output                      sink9_ready,

    input                       sink10_valid,
    input [126-1   : 0]  sink10_data,
    input [142-1: 0]  sink10_channel,
    input                       sink10_startofpacket,
    input                       sink10_endofpacket,
    output                      sink10_ready,

    input                       sink11_valid,
    input [126-1   : 0]  sink11_data,
    input [142-1: 0]  sink11_channel,
    input                       sink11_startofpacket,
    input                       sink11_endofpacket,
    output                      sink11_ready,

    input                       sink12_valid,
    input [126-1   : 0]  sink12_data,
    input [142-1: 0]  sink12_channel,
    input                       sink12_startofpacket,
    input                       sink12_endofpacket,
    output                      sink12_ready,

    input                       sink13_valid,
    input [126-1   : 0]  sink13_data,
    input [142-1: 0]  sink13_channel,
    input                       sink13_startofpacket,
    input                       sink13_endofpacket,
    output                      sink13_ready,

    input                       sink14_valid,
    input [126-1   : 0]  sink14_data,
    input [142-1: 0]  sink14_channel,
    input                       sink14_startofpacket,
    input                       sink14_endofpacket,
    output                      sink14_ready,

    input                       sink15_valid,
    input [126-1   : 0]  sink15_data,
    input [142-1: 0]  sink15_channel,
    input                       sink15_startofpacket,
    input                       sink15_endofpacket,
    output                      sink15_ready,

    input                       sink16_valid,
    input [126-1   : 0]  sink16_data,
    input [142-1: 0]  sink16_channel,
    input                       sink16_startofpacket,
    input                       sink16_endofpacket,
    output                      sink16_ready,

    input                       sink17_valid,
    input [126-1   : 0]  sink17_data,
    input [142-1: 0]  sink17_channel,
    input                       sink17_startofpacket,
    input                       sink17_endofpacket,
    output                      sink17_ready,

    input                       sink18_valid,
    input [126-1   : 0]  sink18_data,
    input [142-1: 0]  sink18_channel,
    input                       sink18_startofpacket,
    input                       sink18_endofpacket,
    output                      sink18_ready,

    input                       sink19_valid,
    input [126-1   : 0]  sink19_data,
    input [142-1: 0]  sink19_channel,
    input                       sink19_startofpacket,
    input                       sink19_endofpacket,
    output                      sink19_ready,

    input                       sink20_valid,
    input [126-1   : 0]  sink20_data,
    input [142-1: 0]  sink20_channel,
    input                       sink20_startofpacket,
    input                       sink20_endofpacket,
    output                      sink20_ready,

    input                       sink21_valid,
    input [126-1   : 0]  sink21_data,
    input [142-1: 0]  sink21_channel,
    input                       sink21_startofpacket,
    input                       sink21_endofpacket,
    output                      sink21_ready,

    input                       sink22_valid,
    input [126-1   : 0]  sink22_data,
    input [142-1: 0]  sink22_channel,
    input                       sink22_startofpacket,
    input                       sink22_endofpacket,
    output                      sink22_ready,

    input                       sink23_valid,
    input [126-1   : 0]  sink23_data,
    input [142-1: 0]  sink23_channel,
    input                       sink23_startofpacket,
    input                       sink23_endofpacket,
    output                      sink23_ready,

    input                       sink24_valid,
    input [126-1   : 0]  sink24_data,
    input [142-1: 0]  sink24_channel,
    input                       sink24_startofpacket,
    input                       sink24_endofpacket,
    output                      sink24_ready,

    input                       sink25_valid,
    input [126-1   : 0]  sink25_data,
    input [142-1: 0]  sink25_channel,
    input                       sink25_startofpacket,
    input                       sink25_endofpacket,
    output                      sink25_ready,

    input                       sink26_valid,
    input [126-1   : 0]  sink26_data,
    input [142-1: 0]  sink26_channel,
    input                       sink26_startofpacket,
    input                       sink26_endofpacket,
    output                      sink26_ready,

    input                       sink27_valid,
    input [126-1   : 0]  sink27_data,
    input [142-1: 0]  sink27_channel,
    input                       sink27_startofpacket,
    input                       sink27_endofpacket,
    output                      sink27_ready,

    input                       sink28_valid,
    input [126-1   : 0]  sink28_data,
    input [142-1: 0]  sink28_channel,
    input                       sink28_startofpacket,
    input                       sink28_endofpacket,
    output                      sink28_ready,

    input                       sink29_valid,
    input [126-1   : 0]  sink29_data,
    input [142-1: 0]  sink29_channel,
    input                       sink29_startofpacket,
    input                       sink29_endofpacket,
    output                      sink29_ready,

    input                       sink30_valid,
    input [126-1   : 0]  sink30_data,
    input [142-1: 0]  sink30_channel,
    input                       sink30_startofpacket,
    input                       sink30_endofpacket,
    output                      sink30_ready,

    input                       sink31_valid,
    input [126-1   : 0]  sink31_data,
    input [142-1: 0]  sink31_channel,
    input                       sink31_startofpacket,
    input                       sink31_endofpacket,
    output                      sink31_ready,

    input                       sink32_valid,
    input [126-1   : 0]  sink32_data,
    input [142-1: 0]  sink32_channel,
    input                       sink32_startofpacket,
    input                       sink32_endofpacket,
    output                      sink32_ready,

    input                       sink33_valid,
    input [126-1   : 0]  sink33_data,
    input [142-1: 0]  sink33_channel,
    input                       sink33_startofpacket,
    input                       sink33_endofpacket,
    output                      sink33_ready,

    input                       sink34_valid,
    input [126-1   : 0]  sink34_data,
    input [142-1: 0]  sink34_channel,
    input                       sink34_startofpacket,
    input                       sink34_endofpacket,
    output                      sink34_ready,

    input                       sink35_valid,
    input [126-1   : 0]  sink35_data,
    input [142-1: 0]  sink35_channel,
    input                       sink35_startofpacket,
    input                       sink35_endofpacket,
    output                      sink35_ready,

    input                       sink36_valid,
    input [126-1   : 0]  sink36_data,
    input [142-1: 0]  sink36_channel,
    input                       sink36_startofpacket,
    input                       sink36_endofpacket,
    output                      sink36_ready,

    input                       sink37_valid,
    input [126-1   : 0]  sink37_data,
    input [142-1: 0]  sink37_channel,
    input                       sink37_startofpacket,
    input                       sink37_endofpacket,
    output                      sink37_ready,

    input                       sink38_valid,
    input [126-1   : 0]  sink38_data,
    input [142-1: 0]  sink38_channel,
    input                       sink38_startofpacket,
    input                       sink38_endofpacket,
    output                      sink38_ready,

    input                       sink39_valid,
    input [126-1   : 0]  sink39_data,
    input [142-1: 0]  sink39_channel,
    input                       sink39_startofpacket,
    input                       sink39_endofpacket,
    output                      sink39_ready,

    input                       sink40_valid,
    input [126-1   : 0]  sink40_data,
    input [142-1: 0]  sink40_channel,
    input                       sink40_startofpacket,
    input                       sink40_endofpacket,
    output                      sink40_ready,

    input                       sink41_valid,
    input [126-1   : 0]  sink41_data,
    input [142-1: 0]  sink41_channel,
    input                       sink41_startofpacket,
    input                       sink41_endofpacket,
    output                      sink41_ready,

    input                       sink42_valid,
    input [126-1   : 0]  sink42_data,
    input [142-1: 0]  sink42_channel,
    input                       sink42_startofpacket,
    input                       sink42_endofpacket,
    output                      sink42_ready,

    input                       sink43_valid,
    input [126-1   : 0]  sink43_data,
    input [142-1: 0]  sink43_channel,
    input                       sink43_startofpacket,
    input                       sink43_endofpacket,
    output                      sink43_ready,

    input                       sink44_valid,
    input [126-1   : 0]  sink44_data,
    input [142-1: 0]  sink44_channel,
    input                       sink44_startofpacket,
    input                       sink44_endofpacket,
    output                      sink44_ready,

    input                       sink45_valid,
    input [126-1   : 0]  sink45_data,
    input [142-1: 0]  sink45_channel,
    input                       sink45_startofpacket,
    input                       sink45_endofpacket,
    output                      sink45_ready,

    input                       sink46_valid,
    input [126-1   : 0]  sink46_data,
    input [142-1: 0]  sink46_channel,
    input                       sink46_startofpacket,
    input                       sink46_endofpacket,
    output                      sink46_ready,

    input                       sink47_valid,
    input [126-1   : 0]  sink47_data,
    input [142-1: 0]  sink47_channel,
    input                       sink47_startofpacket,
    input                       sink47_endofpacket,
    output                      sink47_ready,

    input                       sink48_valid,
    input [126-1   : 0]  sink48_data,
    input [142-1: 0]  sink48_channel,
    input                       sink48_startofpacket,
    input                       sink48_endofpacket,
    output                      sink48_ready,

    input                       sink49_valid,
    input [126-1   : 0]  sink49_data,
    input [142-1: 0]  sink49_channel,
    input                       sink49_startofpacket,
    input                       sink49_endofpacket,
    output                      sink49_ready,

    input                       sink50_valid,
    input [126-1   : 0]  sink50_data,
    input [142-1: 0]  sink50_channel,
    input                       sink50_startofpacket,
    input                       sink50_endofpacket,
    output                      sink50_ready,

    input                       sink51_valid,
    input [126-1   : 0]  sink51_data,
    input [142-1: 0]  sink51_channel,
    input                       sink51_startofpacket,
    input                       sink51_endofpacket,
    output                      sink51_ready,

    input                       sink52_valid,
    input [126-1   : 0]  sink52_data,
    input [142-1: 0]  sink52_channel,
    input                       sink52_startofpacket,
    input                       sink52_endofpacket,
    output                      sink52_ready,

    input                       sink53_valid,
    input [126-1   : 0]  sink53_data,
    input [142-1: 0]  sink53_channel,
    input                       sink53_startofpacket,
    input                       sink53_endofpacket,
    output                      sink53_ready,

    input                       sink54_valid,
    input [126-1   : 0]  sink54_data,
    input [142-1: 0]  sink54_channel,
    input                       sink54_startofpacket,
    input                       sink54_endofpacket,
    output                      sink54_ready,

    input                       sink55_valid,
    input [126-1   : 0]  sink55_data,
    input [142-1: 0]  sink55_channel,
    input                       sink55_startofpacket,
    input                       sink55_endofpacket,
    output                      sink55_ready,

    input                       sink56_valid,
    input [126-1   : 0]  sink56_data,
    input [142-1: 0]  sink56_channel,
    input                       sink56_startofpacket,
    input                       sink56_endofpacket,
    output                      sink56_ready,

    input                       sink57_valid,
    input [126-1   : 0]  sink57_data,
    input [142-1: 0]  sink57_channel,
    input                       sink57_startofpacket,
    input                       sink57_endofpacket,
    output                      sink57_ready,

    input                       sink58_valid,
    input [126-1   : 0]  sink58_data,
    input [142-1: 0]  sink58_channel,
    input                       sink58_startofpacket,
    input                       sink58_endofpacket,
    output                      sink58_ready,

    input                       sink59_valid,
    input [126-1   : 0]  sink59_data,
    input [142-1: 0]  sink59_channel,
    input                       sink59_startofpacket,
    input                       sink59_endofpacket,
    output                      sink59_ready,

    input                       sink60_valid,
    input [126-1   : 0]  sink60_data,
    input [142-1: 0]  sink60_channel,
    input                       sink60_startofpacket,
    input                       sink60_endofpacket,
    output                      sink60_ready,

    input                       sink61_valid,
    input [126-1   : 0]  sink61_data,
    input [142-1: 0]  sink61_channel,
    input                       sink61_startofpacket,
    input                       sink61_endofpacket,
    output                      sink61_ready,

    input                       sink62_valid,
    input [126-1   : 0]  sink62_data,
    input [142-1: 0]  sink62_channel,
    input                       sink62_startofpacket,
    input                       sink62_endofpacket,
    output                      sink62_ready,

    input                       sink63_valid,
    input [126-1   : 0]  sink63_data,
    input [142-1: 0]  sink63_channel,
    input                       sink63_startofpacket,
    input                       sink63_endofpacket,
    output                      sink63_ready,

    input                       sink64_valid,
    input [126-1   : 0]  sink64_data,
    input [142-1: 0]  sink64_channel,
    input                       sink64_startofpacket,
    input                       sink64_endofpacket,
    output                      sink64_ready,

    input                       sink65_valid,
    input [126-1   : 0]  sink65_data,
    input [142-1: 0]  sink65_channel,
    input                       sink65_startofpacket,
    input                       sink65_endofpacket,
    output                      sink65_ready,

    input                       sink66_valid,
    input [126-1   : 0]  sink66_data,
    input [142-1: 0]  sink66_channel,
    input                       sink66_startofpacket,
    input                       sink66_endofpacket,
    output                      sink66_ready,

    input                       sink67_valid,
    input [126-1   : 0]  sink67_data,
    input [142-1: 0]  sink67_channel,
    input                       sink67_startofpacket,
    input                       sink67_endofpacket,
    output                      sink67_ready,

    input                       sink68_valid,
    input [126-1   : 0]  sink68_data,
    input [142-1: 0]  sink68_channel,
    input                       sink68_startofpacket,
    input                       sink68_endofpacket,
    output                      sink68_ready,

    input                       sink69_valid,
    input [126-1   : 0]  sink69_data,
    input [142-1: 0]  sink69_channel,
    input                       sink69_startofpacket,
    input                       sink69_endofpacket,
    output                      sink69_ready,

    input                       sink70_valid,
    input [126-1   : 0]  sink70_data,
    input [142-1: 0]  sink70_channel,
    input                       sink70_startofpacket,
    input                       sink70_endofpacket,
    output                      sink70_ready,

    input                       sink71_valid,
    input [126-1   : 0]  sink71_data,
    input [142-1: 0]  sink71_channel,
    input                       sink71_startofpacket,
    input                       sink71_endofpacket,
    output                      sink71_ready,

    input                       sink72_valid,
    input [126-1   : 0]  sink72_data,
    input [142-1: 0]  sink72_channel,
    input                       sink72_startofpacket,
    input                       sink72_endofpacket,
    output                      sink72_ready,

    input                       sink73_valid,
    input [126-1   : 0]  sink73_data,
    input [142-1: 0]  sink73_channel,
    input                       sink73_startofpacket,
    input                       sink73_endofpacket,
    output                      sink73_ready,

    input                       sink74_valid,
    input [126-1   : 0]  sink74_data,
    input [142-1: 0]  sink74_channel,
    input                       sink74_startofpacket,
    input                       sink74_endofpacket,
    output                      sink74_ready,

    input                       sink75_valid,
    input [126-1   : 0]  sink75_data,
    input [142-1: 0]  sink75_channel,
    input                       sink75_startofpacket,
    input                       sink75_endofpacket,
    output                      sink75_ready,

    input                       sink76_valid,
    input [126-1   : 0]  sink76_data,
    input [142-1: 0]  sink76_channel,
    input                       sink76_startofpacket,
    input                       sink76_endofpacket,
    output                      sink76_ready,

    input                       sink77_valid,
    input [126-1   : 0]  sink77_data,
    input [142-1: 0]  sink77_channel,
    input                       sink77_startofpacket,
    input                       sink77_endofpacket,
    output                      sink77_ready,

    input                       sink78_valid,
    input [126-1   : 0]  sink78_data,
    input [142-1: 0]  sink78_channel,
    input                       sink78_startofpacket,
    input                       sink78_endofpacket,
    output                      sink78_ready,

    input                       sink79_valid,
    input [126-1   : 0]  sink79_data,
    input [142-1: 0]  sink79_channel,
    input                       sink79_startofpacket,
    input                       sink79_endofpacket,
    output                      sink79_ready,

    input                       sink80_valid,
    input [126-1   : 0]  sink80_data,
    input [142-1: 0]  sink80_channel,
    input                       sink80_startofpacket,
    input                       sink80_endofpacket,
    output                      sink80_ready,

    input                       sink81_valid,
    input [126-1   : 0]  sink81_data,
    input [142-1: 0]  sink81_channel,
    input                       sink81_startofpacket,
    input                       sink81_endofpacket,
    output                      sink81_ready,

    input                       sink82_valid,
    input [126-1   : 0]  sink82_data,
    input [142-1: 0]  sink82_channel,
    input                       sink82_startofpacket,
    input                       sink82_endofpacket,
    output                      sink82_ready,

    input                       sink83_valid,
    input [126-1   : 0]  sink83_data,
    input [142-1: 0]  sink83_channel,
    input                       sink83_startofpacket,
    input                       sink83_endofpacket,
    output                      sink83_ready,

    input                       sink84_valid,
    input [126-1   : 0]  sink84_data,
    input [142-1: 0]  sink84_channel,
    input                       sink84_startofpacket,
    input                       sink84_endofpacket,
    output                      sink84_ready,

    input                       sink85_valid,
    input [126-1   : 0]  sink85_data,
    input [142-1: 0]  sink85_channel,
    input                       sink85_startofpacket,
    input                       sink85_endofpacket,
    output                      sink85_ready,

    input                       sink86_valid,
    input [126-1   : 0]  sink86_data,
    input [142-1: 0]  sink86_channel,
    input                       sink86_startofpacket,
    input                       sink86_endofpacket,
    output                      sink86_ready,

    input                       sink87_valid,
    input [126-1   : 0]  sink87_data,
    input [142-1: 0]  sink87_channel,
    input                       sink87_startofpacket,
    input                       sink87_endofpacket,
    output                      sink87_ready,

    input                       sink88_valid,
    input [126-1   : 0]  sink88_data,
    input [142-1: 0]  sink88_channel,
    input                       sink88_startofpacket,
    input                       sink88_endofpacket,
    output                      sink88_ready,

    input                       sink89_valid,
    input [126-1   : 0]  sink89_data,
    input [142-1: 0]  sink89_channel,
    input                       sink89_startofpacket,
    input                       sink89_endofpacket,
    output                      sink89_ready,

    input                       sink90_valid,
    input [126-1   : 0]  sink90_data,
    input [142-1: 0]  sink90_channel,
    input                       sink90_startofpacket,
    input                       sink90_endofpacket,
    output                      sink90_ready,

    input                       sink91_valid,
    input [126-1   : 0]  sink91_data,
    input [142-1: 0]  sink91_channel,
    input                       sink91_startofpacket,
    input                       sink91_endofpacket,
    output                      sink91_ready,

    input                       sink92_valid,
    input [126-1   : 0]  sink92_data,
    input [142-1: 0]  sink92_channel,
    input                       sink92_startofpacket,
    input                       sink92_endofpacket,
    output                      sink92_ready,

    input                       sink93_valid,
    input [126-1   : 0]  sink93_data,
    input [142-1: 0]  sink93_channel,
    input                       sink93_startofpacket,
    input                       sink93_endofpacket,
    output                      sink93_ready,

    input                       sink94_valid,
    input [126-1   : 0]  sink94_data,
    input [142-1: 0]  sink94_channel,
    input                       sink94_startofpacket,
    input                       sink94_endofpacket,
    output                      sink94_ready,

    input                       sink95_valid,
    input [126-1   : 0]  sink95_data,
    input [142-1: 0]  sink95_channel,
    input                       sink95_startofpacket,
    input                       sink95_endofpacket,
    output                      sink95_ready,

    input                       sink96_valid,
    input [126-1   : 0]  sink96_data,
    input [142-1: 0]  sink96_channel,
    input                       sink96_startofpacket,
    input                       sink96_endofpacket,
    output                      sink96_ready,

    input                       sink97_valid,
    input [126-1   : 0]  sink97_data,
    input [142-1: 0]  sink97_channel,
    input                       sink97_startofpacket,
    input                       sink97_endofpacket,
    output                      sink97_ready,

    input                       sink98_valid,
    input [126-1   : 0]  sink98_data,
    input [142-1: 0]  sink98_channel,
    input                       sink98_startofpacket,
    input                       sink98_endofpacket,
    output                      sink98_ready,

    input                       sink99_valid,
    input [126-1   : 0]  sink99_data,
    input [142-1: 0]  sink99_channel,
    input                       sink99_startofpacket,
    input                       sink99_endofpacket,
    output                      sink99_ready,

    input                       sink100_valid,
    input [126-1   : 0]  sink100_data,
    input [142-1: 0]  sink100_channel,
    input                       sink100_startofpacket,
    input                       sink100_endofpacket,
    output                      sink100_ready,

    input                       sink101_valid,
    input [126-1   : 0]  sink101_data,
    input [142-1: 0]  sink101_channel,
    input                       sink101_startofpacket,
    input                       sink101_endofpacket,
    output                      sink101_ready,

    input                       sink102_valid,
    input [126-1   : 0]  sink102_data,
    input [142-1: 0]  sink102_channel,
    input                       sink102_startofpacket,
    input                       sink102_endofpacket,
    output                      sink102_ready,

    input                       sink103_valid,
    input [126-1   : 0]  sink103_data,
    input [142-1: 0]  sink103_channel,
    input                       sink103_startofpacket,
    input                       sink103_endofpacket,
    output                      sink103_ready,

    input                       sink104_valid,
    input [126-1   : 0]  sink104_data,
    input [142-1: 0]  sink104_channel,
    input                       sink104_startofpacket,
    input                       sink104_endofpacket,
    output                      sink104_ready,

    input                       sink105_valid,
    input [126-1   : 0]  sink105_data,
    input [142-1: 0]  sink105_channel,
    input                       sink105_startofpacket,
    input                       sink105_endofpacket,
    output                      sink105_ready,

    input                       sink106_valid,
    input [126-1   : 0]  sink106_data,
    input [142-1: 0]  sink106_channel,
    input                       sink106_startofpacket,
    input                       sink106_endofpacket,
    output                      sink106_ready,

    input                       sink107_valid,
    input [126-1   : 0]  sink107_data,
    input [142-1: 0]  sink107_channel,
    input                       sink107_startofpacket,
    input                       sink107_endofpacket,
    output                      sink107_ready,

    input                       sink108_valid,
    input [126-1   : 0]  sink108_data,
    input [142-1: 0]  sink108_channel,
    input                       sink108_startofpacket,
    input                       sink108_endofpacket,
    output                      sink108_ready,

    input                       sink109_valid,
    input [126-1   : 0]  sink109_data,
    input [142-1: 0]  sink109_channel,
    input                       sink109_startofpacket,
    input                       sink109_endofpacket,
    output                      sink109_ready,

    input                       sink110_valid,
    input [126-1   : 0]  sink110_data,
    input [142-1: 0]  sink110_channel,
    input                       sink110_startofpacket,
    input                       sink110_endofpacket,
    output                      sink110_ready,

    input                       sink111_valid,
    input [126-1   : 0]  sink111_data,
    input [142-1: 0]  sink111_channel,
    input                       sink111_startofpacket,
    input                       sink111_endofpacket,
    output                      sink111_ready,

    input                       sink112_valid,
    input [126-1   : 0]  sink112_data,
    input [142-1: 0]  sink112_channel,
    input                       sink112_startofpacket,
    input                       sink112_endofpacket,
    output                      sink112_ready,

    input                       sink113_valid,
    input [126-1   : 0]  sink113_data,
    input [142-1: 0]  sink113_channel,
    input                       sink113_startofpacket,
    input                       sink113_endofpacket,
    output                      sink113_ready,

    input                       sink114_valid,
    input [126-1   : 0]  sink114_data,
    input [142-1: 0]  sink114_channel,
    input                       sink114_startofpacket,
    input                       sink114_endofpacket,
    output                      sink114_ready,

    input                       sink115_valid,
    input [126-1   : 0]  sink115_data,
    input [142-1: 0]  sink115_channel,
    input                       sink115_startofpacket,
    input                       sink115_endofpacket,
    output                      sink115_ready,

    input                       sink116_valid,
    input [126-1   : 0]  sink116_data,
    input [142-1: 0]  sink116_channel,
    input                       sink116_startofpacket,
    input                       sink116_endofpacket,
    output                      sink116_ready,

    input                       sink117_valid,
    input [126-1   : 0]  sink117_data,
    input [142-1: 0]  sink117_channel,
    input                       sink117_startofpacket,
    input                       sink117_endofpacket,
    output                      sink117_ready,

    input                       sink118_valid,
    input [126-1   : 0]  sink118_data,
    input [142-1: 0]  sink118_channel,
    input                       sink118_startofpacket,
    input                       sink118_endofpacket,
    output                      sink118_ready,

    input                       sink119_valid,
    input [126-1   : 0]  sink119_data,
    input [142-1: 0]  sink119_channel,
    input                       sink119_startofpacket,
    input                       sink119_endofpacket,
    output                      sink119_ready,

    input                       sink120_valid,
    input [126-1   : 0]  sink120_data,
    input [142-1: 0]  sink120_channel,
    input                       sink120_startofpacket,
    input                       sink120_endofpacket,
    output                      sink120_ready,

    input                       sink121_valid,
    input [126-1   : 0]  sink121_data,
    input [142-1: 0]  sink121_channel,
    input                       sink121_startofpacket,
    input                       sink121_endofpacket,
    output                      sink121_ready,

    input                       sink122_valid,
    input [126-1   : 0]  sink122_data,
    input [142-1: 0]  sink122_channel,
    input                       sink122_startofpacket,
    input                       sink122_endofpacket,
    output                      sink122_ready,

    input                       sink123_valid,
    input [126-1   : 0]  sink123_data,
    input [142-1: 0]  sink123_channel,
    input                       sink123_startofpacket,
    input                       sink123_endofpacket,
    output                      sink123_ready,

    input                       sink124_valid,
    input [126-1   : 0]  sink124_data,
    input [142-1: 0]  sink124_channel,
    input                       sink124_startofpacket,
    input                       sink124_endofpacket,
    output                      sink124_ready,

    input                       sink125_valid,
    input [126-1   : 0]  sink125_data,
    input [142-1: 0]  sink125_channel,
    input                       sink125_startofpacket,
    input                       sink125_endofpacket,
    output                      sink125_ready,

    input                       sink126_valid,
    input [126-1   : 0]  sink126_data,
    input [142-1: 0]  sink126_channel,
    input                       sink126_startofpacket,
    input                       sink126_endofpacket,
    output                      sink126_ready,

    input                       sink127_valid,
    input [126-1   : 0]  sink127_data,
    input [142-1: 0]  sink127_channel,
    input                       sink127_startofpacket,
    input                       sink127_endofpacket,
    output                      sink127_ready,

    input                       sink128_valid,
    input [126-1   : 0]  sink128_data,
    input [142-1: 0]  sink128_channel,
    input                       sink128_startofpacket,
    input                       sink128_endofpacket,
    output                      sink128_ready,

    input                       sink129_valid,
    input [126-1   : 0]  sink129_data,
    input [142-1: 0]  sink129_channel,
    input                       sink129_startofpacket,
    input                       sink129_endofpacket,
    output                      sink129_ready,

    input                       sink130_valid,
    input [126-1   : 0]  sink130_data,
    input [142-1: 0]  sink130_channel,
    input                       sink130_startofpacket,
    input                       sink130_endofpacket,
    output                      sink130_ready,

    input                       sink131_valid,
    input [126-1   : 0]  sink131_data,
    input [142-1: 0]  sink131_channel,
    input                       sink131_startofpacket,
    input                       sink131_endofpacket,
    output                      sink131_ready,

    input                       sink132_valid,
    input [126-1   : 0]  sink132_data,
    input [142-1: 0]  sink132_channel,
    input                       sink132_startofpacket,
    input                       sink132_endofpacket,
    output                      sink132_ready,

    input                       sink133_valid,
    input [126-1   : 0]  sink133_data,
    input [142-1: 0]  sink133_channel,
    input                       sink133_startofpacket,
    input                       sink133_endofpacket,
    output                      sink133_ready,

    input                       sink134_valid,
    input [126-1   : 0]  sink134_data,
    input [142-1: 0]  sink134_channel,
    input                       sink134_startofpacket,
    input                       sink134_endofpacket,
    output                      sink134_ready,

    input                       sink135_valid,
    input [126-1   : 0]  sink135_data,
    input [142-1: 0]  sink135_channel,
    input                       sink135_startofpacket,
    input                       sink135_endofpacket,
    output                      sink135_ready,

    input                       sink136_valid,
    input [126-1   : 0]  sink136_data,
    input [142-1: 0]  sink136_channel,
    input                       sink136_startofpacket,
    input                       sink136_endofpacket,
    output                      sink136_ready,

    input                       sink137_valid,
    input [126-1   : 0]  sink137_data,
    input [142-1: 0]  sink137_channel,
    input                       sink137_startofpacket,
    input                       sink137_endofpacket,
    output                      sink137_ready,

    input                       sink138_valid,
    input [126-1   : 0]  sink138_data,
    input [142-1: 0]  sink138_channel,
    input                       sink138_startofpacket,
    input                       sink138_endofpacket,
    output                      sink138_ready,

    input                       sink139_valid,
    input [126-1   : 0]  sink139_data,
    input [142-1: 0]  sink139_channel,
    input                       sink139_startofpacket,
    input                       sink139_endofpacket,
    output                      sink139_ready,

    input                       sink140_valid,
    input [126-1   : 0]  sink140_data,
    input [142-1: 0]  sink140_channel,
    input                       sink140_startofpacket,
    input                       sink140_endofpacket,
    output                      sink140_ready,

    input                       sink141_valid,
    input [126-1   : 0]  sink141_data,
    input [142-1: 0]  sink141_channel,
    input                       sink141_startofpacket,
    input                       sink141_endofpacket,
    output                      sink141_ready,


    // ----------------------
    // Source
    // ----------------------
    output                      src_valid,
    output [126-1    : 0] src_data,
    output [142-1 : 0] src_channel,
    output                      src_startofpacket,
    output                      src_endofpacket,
    input                       src_ready,

    // ----------------------
    // Clock & Reset
    // ----------------------
    input clk,
    input reset
);
    localparam PAYLOAD_W        = 126 + 142 + 2;
    localparam NUM_INPUTS       = 142;
    localparam SHARE_COUNTER_W  = 1;
    localparam PIPELINE_ARB     = 0;
    localparam ST_DATA_W        = 126;
    localparam ST_CHANNEL_W     = 142;
    localparam PKT_TRANS_LOCK   = 61;

    // ------------------------------------------
    // Signals
    // ------------------------------------------
    wire [NUM_INPUTS - 1 : 0]      request;
    wire [NUM_INPUTS - 1 : 0]      valid;
    wire [NUM_INPUTS - 1 : 0]      grant;
    wire [NUM_INPUTS - 1 : 0]      next_grant;
    reg [NUM_INPUTS - 1 : 0]       saved_grant;
    reg [PAYLOAD_W - 1 : 0]        src_payload;
    wire                           last_cycle;
    reg                            packet_in_progress;
    reg                            update_grant;

    wire [PAYLOAD_W - 1 : 0] sink0_payload;
    wire [PAYLOAD_W - 1 : 0] sink1_payload;
    wire [PAYLOAD_W - 1 : 0] sink2_payload;
    wire [PAYLOAD_W - 1 : 0] sink3_payload;
    wire [PAYLOAD_W - 1 : 0] sink4_payload;
    wire [PAYLOAD_W - 1 : 0] sink5_payload;
    wire [PAYLOAD_W - 1 : 0] sink6_payload;
    wire [PAYLOAD_W - 1 : 0] sink7_payload;
    wire [PAYLOAD_W - 1 : 0] sink8_payload;
    wire [PAYLOAD_W - 1 : 0] sink9_payload;
    wire [PAYLOAD_W - 1 : 0] sink10_payload;
    wire [PAYLOAD_W - 1 : 0] sink11_payload;
    wire [PAYLOAD_W - 1 : 0] sink12_payload;
    wire [PAYLOAD_W - 1 : 0] sink13_payload;
    wire [PAYLOAD_W - 1 : 0] sink14_payload;
    wire [PAYLOAD_W - 1 : 0] sink15_payload;
    wire [PAYLOAD_W - 1 : 0] sink16_payload;
    wire [PAYLOAD_W - 1 : 0] sink17_payload;
    wire [PAYLOAD_W - 1 : 0] sink18_payload;
    wire [PAYLOAD_W - 1 : 0] sink19_payload;
    wire [PAYLOAD_W - 1 : 0] sink20_payload;
    wire [PAYLOAD_W - 1 : 0] sink21_payload;
    wire [PAYLOAD_W - 1 : 0] sink22_payload;
    wire [PAYLOAD_W - 1 : 0] sink23_payload;
    wire [PAYLOAD_W - 1 : 0] sink24_payload;
    wire [PAYLOAD_W - 1 : 0] sink25_payload;
    wire [PAYLOAD_W - 1 : 0] sink26_payload;
    wire [PAYLOAD_W - 1 : 0] sink27_payload;
    wire [PAYLOAD_W - 1 : 0] sink28_payload;
    wire [PAYLOAD_W - 1 : 0] sink29_payload;
    wire [PAYLOAD_W - 1 : 0] sink30_payload;
    wire [PAYLOAD_W - 1 : 0] sink31_payload;
    wire [PAYLOAD_W - 1 : 0] sink32_payload;
    wire [PAYLOAD_W - 1 : 0] sink33_payload;
    wire [PAYLOAD_W - 1 : 0] sink34_payload;
    wire [PAYLOAD_W - 1 : 0] sink35_payload;
    wire [PAYLOAD_W - 1 : 0] sink36_payload;
    wire [PAYLOAD_W - 1 : 0] sink37_payload;
    wire [PAYLOAD_W - 1 : 0] sink38_payload;
    wire [PAYLOAD_W - 1 : 0] sink39_payload;
    wire [PAYLOAD_W - 1 : 0] sink40_payload;
    wire [PAYLOAD_W - 1 : 0] sink41_payload;
    wire [PAYLOAD_W - 1 : 0] sink42_payload;
    wire [PAYLOAD_W - 1 : 0] sink43_payload;
    wire [PAYLOAD_W - 1 : 0] sink44_payload;
    wire [PAYLOAD_W - 1 : 0] sink45_payload;
    wire [PAYLOAD_W - 1 : 0] sink46_payload;
    wire [PAYLOAD_W - 1 : 0] sink47_payload;
    wire [PAYLOAD_W - 1 : 0] sink48_payload;
    wire [PAYLOAD_W - 1 : 0] sink49_payload;
    wire [PAYLOAD_W - 1 : 0] sink50_payload;
    wire [PAYLOAD_W - 1 : 0] sink51_payload;
    wire [PAYLOAD_W - 1 : 0] sink52_payload;
    wire [PAYLOAD_W - 1 : 0] sink53_payload;
    wire [PAYLOAD_W - 1 : 0] sink54_payload;
    wire [PAYLOAD_W - 1 : 0] sink55_payload;
    wire [PAYLOAD_W - 1 : 0] sink56_payload;
    wire [PAYLOAD_W - 1 : 0] sink57_payload;
    wire [PAYLOAD_W - 1 : 0] sink58_payload;
    wire [PAYLOAD_W - 1 : 0] sink59_payload;
    wire [PAYLOAD_W - 1 : 0] sink60_payload;
    wire [PAYLOAD_W - 1 : 0] sink61_payload;
    wire [PAYLOAD_W - 1 : 0] sink62_payload;
    wire [PAYLOAD_W - 1 : 0] sink63_payload;
    wire [PAYLOAD_W - 1 : 0] sink64_payload;
    wire [PAYLOAD_W - 1 : 0] sink65_payload;
    wire [PAYLOAD_W - 1 : 0] sink66_payload;
    wire [PAYLOAD_W - 1 : 0] sink67_payload;
    wire [PAYLOAD_W - 1 : 0] sink68_payload;
    wire [PAYLOAD_W - 1 : 0] sink69_payload;
    wire [PAYLOAD_W - 1 : 0] sink70_payload;
    wire [PAYLOAD_W - 1 : 0] sink71_payload;
    wire [PAYLOAD_W - 1 : 0] sink72_payload;
    wire [PAYLOAD_W - 1 : 0] sink73_payload;
    wire [PAYLOAD_W - 1 : 0] sink74_payload;
    wire [PAYLOAD_W - 1 : 0] sink75_payload;
    wire [PAYLOAD_W - 1 : 0] sink76_payload;
    wire [PAYLOAD_W - 1 : 0] sink77_payload;
    wire [PAYLOAD_W - 1 : 0] sink78_payload;
    wire [PAYLOAD_W - 1 : 0] sink79_payload;
    wire [PAYLOAD_W - 1 : 0] sink80_payload;
    wire [PAYLOAD_W - 1 : 0] sink81_payload;
    wire [PAYLOAD_W - 1 : 0] sink82_payload;
    wire [PAYLOAD_W - 1 : 0] sink83_payload;
    wire [PAYLOAD_W - 1 : 0] sink84_payload;
    wire [PAYLOAD_W - 1 : 0] sink85_payload;
    wire [PAYLOAD_W - 1 : 0] sink86_payload;
    wire [PAYLOAD_W - 1 : 0] sink87_payload;
    wire [PAYLOAD_W - 1 : 0] sink88_payload;
    wire [PAYLOAD_W - 1 : 0] sink89_payload;
    wire [PAYLOAD_W - 1 : 0] sink90_payload;
    wire [PAYLOAD_W - 1 : 0] sink91_payload;
    wire [PAYLOAD_W - 1 : 0] sink92_payload;
    wire [PAYLOAD_W - 1 : 0] sink93_payload;
    wire [PAYLOAD_W - 1 : 0] sink94_payload;
    wire [PAYLOAD_W - 1 : 0] sink95_payload;
    wire [PAYLOAD_W - 1 : 0] sink96_payload;
    wire [PAYLOAD_W - 1 : 0] sink97_payload;
    wire [PAYLOAD_W - 1 : 0] sink98_payload;
    wire [PAYLOAD_W - 1 : 0] sink99_payload;
    wire [PAYLOAD_W - 1 : 0] sink100_payload;
    wire [PAYLOAD_W - 1 : 0] sink101_payload;
    wire [PAYLOAD_W - 1 : 0] sink102_payload;
    wire [PAYLOAD_W - 1 : 0] sink103_payload;
    wire [PAYLOAD_W - 1 : 0] sink104_payload;
    wire [PAYLOAD_W - 1 : 0] sink105_payload;
    wire [PAYLOAD_W - 1 : 0] sink106_payload;
    wire [PAYLOAD_W - 1 : 0] sink107_payload;
    wire [PAYLOAD_W - 1 : 0] sink108_payload;
    wire [PAYLOAD_W - 1 : 0] sink109_payload;
    wire [PAYLOAD_W - 1 : 0] sink110_payload;
    wire [PAYLOAD_W - 1 : 0] sink111_payload;
    wire [PAYLOAD_W - 1 : 0] sink112_payload;
    wire [PAYLOAD_W - 1 : 0] sink113_payload;
    wire [PAYLOAD_W - 1 : 0] sink114_payload;
    wire [PAYLOAD_W - 1 : 0] sink115_payload;
    wire [PAYLOAD_W - 1 : 0] sink116_payload;
    wire [PAYLOAD_W - 1 : 0] sink117_payload;
    wire [PAYLOAD_W - 1 : 0] sink118_payload;
    wire [PAYLOAD_W - 1 : 0] sink119_payload;
    wire [PAYLOAD_W - 1 : 0] sink120_payload;
    wire [PAYLOAD_W - 1 : 0] sink121_payload;
    wire [PAYLOAD_W - 1 : 0] sink122_payload;
    wire [PAYLOAD_W - 1 : 0] sink123_payload;
    wire [PAYLOAD_W - 1 : 0] sink124_payload;
    wire [PAYLOAD_W - 1 : 0] sink125_payload;
    wire [PAYLOAD_W - 1 : 0] sink126_payload;
    wire [PAYLOAD_W - 1 : 0] sink127_payload;
    wire [PAYLOAD_W - 1 : 0] sink128_payload;
    wire [PAYLOAD_W - 1 : 0] sink129_payload;
    wire [PAYLOAD_W - 1 : 0] sink130_payload;
    wire [PAYLOAD_W - 1 : 0] sink131_payload;
    wire [PAYLOAD_W - 1 : 0] sink132_payload;
    wire [PAYLOAD_W - 1 : 0] sink133_payload;
    wire [PAYLOAD_W - 1 : 0] sink134_payload;
    wire [PAYLOAD_W - 1 : 0] sink135_payload;
    wire [PAYLOAD_W - 1 : 0] sink136_payload;
    wire [PAYLOAD_W - 1 : 0] sink137_payload;
    wire [PAYLOAD_W - 1 : 0] sink138_payload;
    wire [PAYLOAD_W - 1 : 0] sink139_payload;
    wire [PAYLOAD_W - 1 : 0] sink140_payload;
    wire [PAYLOAD_W - 1 : 0] sink141_payload;

    assign valid[0] = sink0_valid;
    assign valid[1] = sink1_valid;
    assign valid[2] = sink2_valid;
    assign valid[3] = sink3_valid;
    assign valid[4] = sink4_valid;
    assign valid[5] = sink5_valid;
    assign valid[6] = sink6_valid;
    assign valid[7] = sink7_valid;
    assign valid[8] = sink8_valid;
    assign valid[9] = sink9_valid;
    assign valid[10] = sink10_valid;
    assign valid[11] = sink11_valid;
    assign valid[12] = sink12_valid;
    assign valid[13] = sink13_valid;
    assign valid[14] = sink14_valid;
    assign valid[15] = sink15_valid;
    assign valid[16] = sink16_valid;
    assign valid[17] = sink17_valid;
    assign valid[18] = sink18_valid;
    assign valid[19] = sink19_valid;
    assign valid[20] = sink20_valid;
    assign valid[21] = sink21_valid;
    assign valid[22] = sink22_valid;
    assign valid[23] = sink23_valid;
    assign valid[24] = sink24_valid;
    assign valid[25] = sink25_valid;
    assign valid[26] = sink26_valid;
    assign valid[27] = sink27_valid;
    assign valid[28] = sink28_valid;
    assign valid[29] = sink29_valid;
    assign valid[30] = sink30_valid;
    assign valid[31] = sink31_valid;
    assign valid[32] = sink32_valid;
    assign valid[33] = sink33_valid;
    assign valid[34] = sink34_valid;
    assign valid[35] = sink35_valid;
    assign valid[36] = sink36_valid;
    assign valid[37] = sink37_valid;
    assign valid[38] = sink38_valid;
    assign valid[39] = sink39_valid;
    assign valid[40] = sink40_valid;
    assign valid[41] = sink41_valid;
    assign valid[42] = sink42_valid;
    assign valid[43] = sink43_valid;
    assign valid[44] = sink44_valid;
    assign valid[45] = sink45_valid;
    assign valid[46] = sink46_valid;
    assign valid[47] = sink47_valid;
    assign valid[48] = sink48_valid;
    assign valid[49] = sink49_valid;
    assign valid[50] = sink50_valid;
    assign valid[51] = sink51_valid;
    assign valid[52] = sink52_valid;
    assign valid[53] = sink53_valid;
    assign valid[54] = sink54_valid;
    assign valid[55] = sink55_valid;
    assign valid[56] = sink56_valid;
    assign valid[57] = sink57_valid;
    assign valid[58] = sink58_valid;
    assign valid[59] = sink59_valid;
    assign valid[60] = sink60_valid;
    assign valid[61] = sink61_valid;
    assign valid[62] = sink62_valid;
    assign valid[63] = sink63_valid;
    assign valid[64] = sink64_valid;
    assign valid[65] = sink65_valid;
    assign valid[66] = sink66_valid;
    assign valid[67] = sink67_valid;
    assign valid[68] = sink68_valid;
    assign valid[69] = sink69_valid;
    assign valid[70] = sink70_valid;
    assign valid[71] = sink71_valid;
    assign valid[72] = sink72_valid;
    assign valid[73] = sink73_valid;
    assign valid[74] = sink74_valid;
    assign valid[75] = sink75_valid;
    assign valid[76] = sink76_valid;
    assign valid[77] = sink77_valid;
    assign valid[78] = sink78_valid;
    assign valid[79] = sink79_valid;
    assign valid[80] = sink80_valid;
    assign valid[81] = sink81_valid;
    assign valid[82] = sink82_valid;
    assign valid[83] = sink83_valid;
    assign valid[84] = sink84_valid;
    assign valid[85] = sink85_valid;
    assign valid[86] = sink86_valid;
    assign valid[87] = sink87_valid;
    assign valid[88] = sink88_valid;
    assign valid[89] = sink89_valid;
    assign valid[90] = sink90_valid;
    assign valid[91] = sink91_valid;
    assign valid[92] = sink92_valid;
    assign valid[93] = sink93_valid;
    assign valid[94] = sink94_valid;
    assign valid[95] = sink95_valid;
    assign valid[96] = sink96_valid;
    assign valid[97] = sink97_valid;
    assign valid[98] = sink98_valid;
    assign valid[99] = sink99_valid;
    assign valid[100] = sink100_valid;
    assign valid[101] = sink101_valid;
    assign valid[102] = sink102_valid;
    assign valid[103] = sink103_valid;
    assign valid[104] = sink104_valid;
    assign valid[105] = sink105_valid;
    assign valid[106] = sink106_valid;
    assign valid[107] = sink107_valid;
    assign valid[108] = sink108_valid;
    assign valid[109] = sink109_valid;
    assign valid[110] = sink110_valid;
    assign valid[111] = sink111_valid;
    assign valid[112] = sink112_valid;
    assign valid[113] = sink113_valid;
    assign valid[114] = sink114_valid;
    assign valid[115] = sink115_valid;
    assign valid[116] = sink116_valid;
    assign valid[117] = sink117_valid;
    assign valid[118] = sink118_valid;
    assign valid[119] = sink119_valid;
    assign valid[120] = sink120_valid;
    assign valid[121] = sink121_valid;
    assign valid[122] = sink122_valid;
    assign valid[123] = sink123_valid;
    assign valid[124] = sink124_valid;
    assign valid[125] = sink125_valid;
    assign valid[126] = sink126_valid;
    assign valid[127] = sink127_valid;
    assign valid[128] = sink128_valid;
    assign valid[129] = sink129_valid;
    assign valid[130] = sink130_valid;
    assign valid[131] = sink131_valid;
    assign valid[132] = sink132_valid;
    assign valid[133] = sink133_valid;
    assign valid[134] = sink134_valid;
    assign valid[135] = sink135_valid;
    assign valid[136] = sink136_valid;
    assign valid[137] = sink137_valid;
    assign valid[138] = sink138_valid;
    assign valid[139] = sink139_valid;
    assign valid[140] = sink140_valid;
    assign valid[141] = sink141_valid;


    // ------------------------------------------
    // ------------------------------------------
    // Grant Logic & Updates
    // ------------------------------------------
    // ------------------------------------------
    reg [NUM_INPUTS - 1 : 0] lock;
    always @* begin
      lock[0] = sink0_data[61];
      lock[1] = sink1_data[61];
      lock[2] = sink2_data[61];
      lock[3] = sink3_data[61];
      lock[4] = sink4_data[61];
      lock[5] = sink5_data[61];
      lock[6] = sink6_data[61];
      lock[7] = sink7_data[61];
      lock[8] = sink8_data[61];
      lock[9] = sink9_data[61];
      lock[10] = sink10_data[61];
      lock[11] = sink11_data[61];
      lock[12] = sink12_data[61];
      lock[13] = sink13_data[61];
      lock[14] = sink14_data[61];
      lock[15] = sink15_data[61];
      lock[16] = sink16_data[61];
      lock[17] = sink17_data[61];
      lock[18] = sink18_data[61];
      lock[19] = sink19_data[61];
      lock[20] = sink20_data[61];
      lock[21] = sink21_data[61];
      lock[22] = sink22_data[61];
      lock[23] = sink23_data[61];
      lock[24] = sink24_data[61];
      lock[25] = sink25_data[61];
      lock[26] = sink26_data[61];
      lock[27] = sink27_data[61];
      lock[28] = sink28_data[61];
      lock[29] = sink29_data[61];
      lock[30] = sink30_data[61];
      lock[31] = sink31_data[61];
      lock[32] = sink32_data[61];
      lock[33] = sink33_data[61];
      lock[34] = sink34_data[61];
      lock[35] = sink35_data[61];
      lock[36] = sink36_data[61];
      lock[37] = sink37_data[61];
      lock[38] = sink38_data[61];
      lock[39] = sink39_data[61];
      lock[40] = sink40_data[61];
      lock[41] = sink41_data[61];
      lock[42] = sink42_data[61];
      lock[43] = sink43_data[61];
      lock[44] = sink44_data[61];
      lock[45] = sink45_data[61];
      lock[46] = sink46_data[61];
      lock[47] = sink47_data[61];
      lock[48] = sink48_data[61];
      lock[49] = sink49_data[61];
      lock[50] = sink50_data[61];
      lock[51] = sink51_data[61];
      lock[52] = sink52_data[61];
      lock[53] = sink53_data[61];
      lock[54] = sink54_data[61];
      lock[55] = sink55_data[61];
      lock[56] = sink56_data[61];
      lock[57] = sink57_data[61];
      lock[58] = sink58_data[61];
      lock[59] = sink59_data[61];
      lock[60] = sink60_data[61];
      lock[61] = sink61_data[61];
      lock[62] = sink62_data[61];
      lock[63] = sink63_data[61];
      lock[64] = sink64_data[61];
      lock[65] = sink65_data[61];
      lock[66] = sink66_data[61];
      lock[67] = sink67_data[61];
      lock[68] = sink68_data[61];
      lock[69] = sink69_data[61];
      lock[70] = sink70_data[61];
      lock[71] = sink71_data[61];
      lock[72] = sink72_data[61];
      lock[73] = sink73_data[61];
      lock[74] = sink74_data[61];
      lock[75] = sink75_data[61];
      lock[76] = sink76_data[61];
      lock[77] = sink77_data[61];
      lock[78] = sink78_data[61];
      lock[79] = sink79_data[61];
      lock[80] = sink80_data[61];
      lock[81] = sink81_data[61];
      lock[82] = sink82_data[61];
      lock[83] = sink83_data[61];
      lock[84] = sink84_data[61];
      lock[85] = sink85_data[61];
      lock[86] = sink86_data[61];
      lock[87] = sink87_data[61];
      lock[88] = sink88_data[61];
      lock[89] = sink89_data[61];
      lock[90] = sink90_data[61];
      lock[91] = sink91_data[61];
      lock[92] = sink92_data[61];
      lock[93] = sink93_data[61];
      lock[94] = sink94_data[61];
      lock[95] = sink95_data[61];
      lock[96] = sink96_data[61];
      lock[97] = sink97_data[61];
      lock[98] = sink98_data[61];
      lock[99] = sink99_data[61];
      lock[100] = sink100_data[61];
      lock[101] = sink101_data[61];
      lock[102] = sink102_data[61];
      lock[103] = sink103_data[61];
      lock[104] = sink104_data[61];
      lock[105] = sink105_data[61];
      lock[106] = sink106_data[61];
      lock[107] = sink107_data[61];
      lock[108] = sink108_data[61];
      lock[109] = sink109_data[61];
      lock[110] = sink110_data[61];
      lock[111] = sink111_data[61];
      lock[112] = sink112_data[61];
      lock[113] = sink113_data[61];
      lock[114] = sink114_data[61];
      lock[115] = sink115_data[61];
      lock[116] = sink116_data[61];
      lock[117] = sink117_data[61];
      lock[118] = sink118_data[61];
      lock[119] = sink119_data[61];
      lock[120] = sink120_data[61];
      lock[121] = sink121_data[61];
      lock[122] = sink122_data[61];
      lock[123] = sink123_data[61];
      lock[124] = sink124_data[61];
      lock[125] = sink125_data[61];
      lock[126] = sink126_data[61];
      lock[127] = sink127_data[61];
      lock[128] = sink128_data[61];
      lock[129] = sink129_data[61];
      lock[130] = sink130_data[61];
      lock[131] = sink131_data[61];
      lock[132] = sink132_data[61];
      lock[133] = sink133_data[61];
      lock[134] = sink134_data[61];
      lock[135] = sink135_data[61];
      lock[136] = sink136_data[61];
      lock[137] = sink137_data[61];
      lock[138] = sink138_data[61];
      lock[139] = sink139_data[61];
      lock[140] = sink140_data[61];
      lock[141] = sink141_data[61];
    end

    assign last_cycle = src_valid & src_ready & src_endofpacket & ~(|(lock & grant));

    // ------------------------------------------
    // We're working on a packet at any time valid is high, except
    // when this is the endofpacket.
    // ------------------------------------------
    always @(posedge clk or posedge reset) begin
      if (reset) begin
        packet_in_progress <= 1'b0;
      end
      else begin
        if (last_cycle)
          packet_in_progress <= 1'b0; 
        else if (src_valid)
          packet_in_progress <= 1'b1;
      end
    end


    // ------------------------------------------
    // Shares
    //
    // Special case: all-equal shares _should_ be optimized into assigning a
    // constant to next_grant_share.
    // Special case: all-1's shares _should_ result in the share counter
    // being optimized away.
    // ------------------------------------------
    // Input  |  arb shares  |  counter load value
    // 0      |      1       |  0
    // 1      |      1       |  0
    // 2      |      1       |  0
    // 3      |      1       |  0
    // 4      |      1       |  0
    // 5      |      1       |  0
    // 6      |      1       |  0
    // 7      |      1       |  0
    // 8      |      1       |  0
    // 9      |      1       |  0
    // 10      |      1       |  0
    // 11      |      1       |  0
    // 12      |      1       |  0
    // 13      |      1       |  0
    // 14      |      1       |  0
    // 15      |      1       |  0
    // 16      |      1       |  0
    // 17      |      1       |  0
    // 18      |      1       |  0
    // 19      |      1       |  0
    // 20      |      1       |  0
    // 21      |      1       |  0
    // 22      |      1       |  0
    // 23      |      1       |  0
    // 24      |      1       |  0
    // 25      |      1       |  0
    // 26      |      1       |  0
    // 27      |      1       |  0
    // 28      |      1       |  0
    // 29      |      1       |  0
    // 30      |      1       |  0
    // 31      |      1       |  0
    // 32      |      1       |  0
    // 33      |      1       |  0
    // 34      |      1       |  0
    // 35      |      1       |  0
    // 36      |      1       |  0
    // 37      |      1       |  0
    // 38      |      1       |  0
    // 39      |      1       |  0
    // 40      |      1       |  0
    // 41      |      1       |  0
    // 42      |      1       |  0
    // 43      |      1       |  0
    // 44      |      1       |  0
    // 45      |      1       |  0
    // 46      |      1       |  0
    // 47      |      1       |  0
    // 48      |      1       |  0
    // 49      |      1       |  0
    // 50      |      1       |  0
    // 51      |      1       |  0
    // 52      |      1       |  0
    // 53      |      1       |  0
    // 54      |      1       |  0
    // 55      |      1       |  0
    // 56      |      1       |  0
    // 57      |      1       |  0
    // 58      |      1       |  0
    // 59      |      1       |  0
    // 60      |      1       |  0
    // 61      |      1       |  0
    // 62      |      1       |  0
    // 63      |      1       |  0
    // 64      |      1       |  0
    // 65      |      1       |  0
    // 66      |      1       |  0
    // 67      |      1       |  0
    // 68      |      1       |  0
    // 69      |      1       |  0
    // 70      |      1       |  0
    // 71      |      1       |  0
    // 72      |      1       |  0
    // 73      |      1       |  0
    // 74      |      1       |  0
    // 75      |      1       |  0
    // 76      |      1       |  0
    // 77      |      1       |  0
    // 78      |      1       |  0
    // 79      |      1       |  0
    // 80      |      1       |  0
    // 81      |      1       |  0
    // 82      |      1       |  0
    // 83      |      1       |  0
    // 84      |      1       |  0
    // 85      |      1       |  0
    // 86      |      1       |  0
    // 87      |      1       |  0
    // 88      |      1       |  0
    // 89      |      1       |  0
    // 90      |      1       |  0
    // 91      |      1       |  0
    // 92      |      1       |  0
    // 93      |      1       |  0
    // 94      |      1       |  0
    // 95      |      1       |  0
    // 96      |      1       |  0
    // 97      |      1       |  0
    // 98      |      1       |  0
    // 99      |      1       |  0
    // 100      |      1       |  0
    // 101      |      1       |  0
    // 102      |      1       |  0
    // 103      |      1       |  0
    // 104      |      1       |  0
    // 105      |      1       |  0
    // 106      |      1       |  0
    // 107      |      1       |  0
    // 108      |      1       |  0
    // 109      |      1       |  0
    // 110      |      1       |  0
    // 111      |      1       |  0
    // 112      |      1       |  0
    // 113      |      1       |  0
    // 114      |      1       |  0
    // 115      |      1       |  0
    // 116      |      1       |  0
    // 117      |      1       |  0
    // 118      |      1       |  0
    // 119      |      1       |  0
    // 120      |      1       |  0
    // 121      |      1       |  0
    // 122      |      1       |  0
    // 123      |      1       |  0
    // 124      |      1       |  0
    // 125      |      1       |  0
    // 126      |      1       |  0
    // 127      |      1       |  0
    // 128      |      1       |  0
    // 129      |      1       |  0
    // 130      |      1       |  0
    // 131      |      1       |  0
    // 132      |      1       |  0
    // 133      |      1       |  0
    // 134      |      1       |  0
    // 135      |      1       |  0
    // 136      |      1       |  0
    // 137      |      1       |  0
    // 138      |      1       |  0
    // 139      |      1       |  0
    // 140      |      1       |  0
    // 141      |      1       |  0
     wire [SHARE_COUNTER_W - 1 : 0] share_0 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_1 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_2 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_3 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_4 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_5 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_6 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_7 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_8 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_9 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_10 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_11 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_12 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_13 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_14 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_15 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_16 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_17 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_18 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_19 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_20 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_21 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_22 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_23 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_24 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_25 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_26 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_27 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_28 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_29 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_30 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_31 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_32 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_33 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_34 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_35 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_36 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_37 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_38 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_39 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_40 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_41 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_42 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_43 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_44 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_45 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_46 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_47 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_48 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_49 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_50 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_51 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_52 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_53 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_54 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_55 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_56 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_57 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_58 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_59 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_60 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_61 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_62 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_63 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_64 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_65 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_66 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_67 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_68 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_69 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_70 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_71 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_72 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_73 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_74 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_75 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_76 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_77 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_78 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_79 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_80 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_81 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_82 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_83 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_84 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_85 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_86 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_87 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_88 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_89 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_90 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_91 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_92 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_93 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_94 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_95 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_96 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_97 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_98 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_99 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_100 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_101 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_102 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_103 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_104 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_105 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_106 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_107 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_108 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_109 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_110 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_111 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_112 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_113 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_114 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_115 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_116 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_117 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_118 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_119 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_120 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_121 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_122 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_123 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_124 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_125 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_126 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_127 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_128 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_129 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_130 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_131 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_132 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_133 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_134 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_135 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_136 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_137 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_138 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_139 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_140 = 1'd0;
     wire [SHARE_COUNTER_W - 1 : 0] share_141 = 1'd0;

    // ------------------------------------------
    // Choose the share value corresponding to the grant.
    // ------------------------------------------
    reg [SHARE_COUNTER_W - 1 : 0] next_grant_share;
    always @* begin
      next_grant_share =
    share_0 & { SHARE_COUNTER_W {next_grant[0]} } |
    share_1 & { SHARE_COUNTER_W {next_grant[1]} } |
    share_2 & { SHARE_COUNTER_W {next_grant[2]} } |
    share_3 & { SHARE_COUNTER_W {next_grant[3]} } |
    share_4 & { SHARE_COUNTER_W {next_grant[4]} } |
    share_5 & { SHARE_COUNTER_W {next_grant[5]} } |
    share_6 & { SHARE_COUNTER_W {next_grant[6]} } |
    share_7 & { SHARE_COUNTER_W {next_grant[7]} } |
    share_8 & { SHARE_COUNTER_W {next_grant[8]} } |
    share_9 & { SHARE_COUNTER_W {next_grant[9]} } |
    share_10 & { SHARE_COUNTER_W {next_grant[10]} } |
    share_11 & { SHARE_COUNTER_W {next_grant[11]} } |
    share_12 & { SHARE_COUNTER_W {next_grant[12]} } |
    share_13 & { SHARE_COUNTER_W {next_grant[13]} } |
    share_14 & { SHARE_COUNTER_W {next_grant[14]} } |
    share_15 & { SHARE_COUNTER_W {next_grant[15]} } |
    share_16 & { SHARE_COUNTER_W {next_grant[16]} } |
    share_17 & { SHARE_COUNTER_W {next_grant[17]} } |
    share_18 & { SHARE_COUNTER_W {next_grant[18]} } |
    share_19 & { SHARE_COUNTER_W {next_grant[19]} } |
    share_20 & { SHARE_COUNTER_W {next_grant[20]} } |
    share_21 & { SHARE_COUNTER_W {next_grant[21]} } |
    share_22 & { SHARE_COUNTER_W {next_grant[22]} } |
    share_23 & { SHARE_COUNTER_W {next_grant[23]} } |
    share_24 & { SHARE_COUNTER_W {next_grant[24]} } |
    share_25 & { SHARE_COUNTER_W {next_grant[25]} } |
    share_26 & { SHARE_COUNTER_W {next_grant[26]} } |
    share_27 & { SHARE_COUNTER_W {next_grant[27]} } |
    share_28 & { SHARE_COUNTER_W {next_grant[28]} } |
    share_29 & { SHARE_COUNTER_W {next_grant[29]} } |
    share_30 & { SHARE_COUNTER_W {next_grant[30]} } |
    share_31 & { SHARE_COUNTER_W {next_grant[31]} } |
    share_32 & { SHARE_COUNTER_W {next_grant[32]} } |
    share_33 & { SHARE_COUNTER_W {next_grant[33]} } |
    share_34 & { SHARE_COUNTER_W {next_grant[34]} } |
    share_35 & { SHARE_COUNTER_W {next_grant[35]} } |
    share_36 & { SHARE_COUNTER_W {next_grant[36]} } |
    share_37 & { SHARE_COUNTER_W {next_grant[37]} } |
    share_38 & { SHARE_COUNTER_W {next_grant[38]} } |
    share_39 & { SHARE_COUNTER_W {next_grant[39]} } |
    share_40 & { SHARE_COUNTER_W {next_grant[40]} } |
    share_41 & { SHARE_COUNTER_W {next_grant[41]} } |
    share_42 & { SHARE_COUNTER_W {next_grant[42]} } |
    share_43 & { SHARE_COUNTER_W {next_grant[43]} } |
    share_44 & { SHARE_COUNTER_W {next_grant[44]} } |
    share_45 & { SHARE_COUNTER_W {next_grant[45]} } |
    share_46 & { SHARE_COUNTER_W {next_grant[46]} } |
    share_47 & { SHARE_COUNTER_W {next_grant[47]} } |
    share_48 & { SHARE_COUNTER_W {next_grant[48]} } |
    share_49 & { SHARE_COUNTER_W {next_grant[49]} } |
    share_50 & { SHARE_COUNTER_W {next_grant[50]} } |
    share_51 & { SHARE_COUNTER_W {next_grant[51]} } |
    share_52 & { SHARE_COUNTER_W {next_grant[52]} } |
    share_53 & { SHARE_COUNTER_W {next_grant[53]} } |
    share_54 & { SHARE_COUNTER_W {next_grant[54]} } |
    share_55 & { SHARE_COUNTER_W {next_grant[55]} } |
    share_56 & { SHARE_COUNTER_W {next_grant[56]} } |
    share_57 & { SHARE_COUNTER_W {next_grant[57]} } |
    share_58 & { SHARE_COUNTER_W {next_grant[58]} } |
    share_59 & { SHARE_COUNTER_W {next_grant[59]} } |
    share_60 & { SHARE_COUNTER_W {next_grant[60]} } |
    share_61 & { SHARE_COUNTER_W {next_grant[61]} } |
    share_62 & { SHARE_COUNTER_W {next_grant[62]} } |
    share_63 & { SHARE_COUNTER_W {next_grant[63]} } |
    share_64 & { SHARE_COUNTER_W {next_grant[64]} } |
    share_65 & { SHARE_COUNTER_W {next_grant[65]} } |
    share_66 & { SHARE_COUNTER_W {next_grant[66]} } |
    share_67 & { SHARE_COUNTER_W {next_grant[67]} } |
    share_68 & { SHARE_COUNTER_W {next_grant[68]} } |
    share_69 & { SHARE_COUNTER_W {next_grant[69]} } |
    share_70 & { SHARE_COUNTER_W {next_grant[70]} } |
    share_71 & { SHARE_COUNTER_W {next_grant[71]} } |
    share_72 & { SHARE_COUNTER_W {next_grant[72]} } |
    share_73 & { SHARE_COUNTER_W {next_grant[73]} } |
    share_74 & { SHARE_COUNTER_W {next_grant[74]} } |
    share_75 & { SHARE_COUNTER_W {next_grant[75]} } |
    share_76 & { SHARE_COUNTER_W {next_grant[76]} } |
    share_77 & { SHARE_COUNTER_W {next_grant[77]} } |
    share_78 & { SHARE_COUNTER_W {next_grant[78]} } |
    share_79 & { SHARE_COUNTER_W {next_grant[79]} } |
    share_80 & { SHARE_COUNTER_W {next_grant[80]} } |
    share_81 & { SHARE_COUNTER_W {next_grant[81]} } |
    share_82 & { SHARE_COUNTER_W {next_grant[82]} } |
    share_83 & { SHARE_COUNTER_W {next_grant[83]} } |
    share_84 & { SHARE_COUNTER_W {next_grant[84]} } |
    share_85 & { SHARE_COUNTER_W {next_grant[85]} } |
    share_86 & { SHARE_COUNTER_W {next_grant[86]} } |
    share_87 & { SHARE_COUNTER_W {next_grant[87]} } |
    share_88 & { SHARE_COUNTER_W {next_grant[88]} } |
    share_89 & { SHARE_COUNTER_W {next_grant[89]} } |
    share_90 & { SHARE_COUNTER_W {next_grant[90]} } |
    share_91 & { SHARE_COUNTER_W {next_grant[91]} } |
    share_92 & { SHARE_COUNTER_W {next_grant[92]} } |
    share_93 & { SHARE_COUNTER_W {next_grant[93]} } |
    share_94 & { SHARE_COUNTER_W {next_grant[94]} } |
    share_95 & { SHARE_COUNTER_W {next_grant[95]} } |
    share_96 & { SHARE_COUNTER_W {next_grant[96]} } |
    share_97 & { SHARE_COUNTER_W {next_grant[97]} } |
    share_98 & { SHARE_COUNTER_W {next_grant[98]} } |
    share_99 & { SHARE_COUNTER_W {next_grant[99]} } |
    share_100 & { SHARE_COUNTER_W {next_grant[100]} } |
    share_101 & { SHARE_COUNTER_W {next_grant[101]} } |
    share_102 & { SHARE_COUNTER_W {next_grant[102]} } |
    share_103 & { SHARE_COUNTER_W {next_grant[103]} } |
    share_104 & { SHARE_COUNTER_W {next_grant[104]} } |
    share_105 & { SHARE_COUNTER_W {next_grant[105]} } |
    share_106 & { SHARE_COUNTER_W {next_grant[106]} } |
    share_107 & { SHARE_COUNTER_W {next_grant[107]} } |
    share_108 & { SHARE_COUNTER_W {next_grant[108]} } |
    share_109 & { SHARE_COUNTER_W {next_grant[109]} } |
    share_110 & { SHARE_COUNTER_W {next_grant[110]} } |
    share_111 & { SHARE_COUNTER_W {next_grant[111]} } |
    share_112 & { SHARE_COUNTER_W {next_grant[112]} } |
    share_113 & { SHARE_COUNTER_W {next_grant[113]} } |
    share_114 & { SHARE_COUNTER_W {next_grant[114]} } |
    share_115 & { SHARE_COUNTER_W {next_grant[115]} } |
    share_116 & { SHARE_COUNTER_W {next_grant[116]} } |
    share_117 & { SHARE_COUNTER_W {next_grant[117]} } |
    share_118 & { SHARE_COUNTER_W {next_grant[118]} } |
    share_119 & { SHARE_COUNTER_W {next_grant[119]} } |
    share_120 & { SHARE_COUNTER_W {next_grant[120]} } |
    share_121 & { SHARE_COUNTER_W {next_grant[121]} } |
    share_122 & { SHARE_COUNTER_W {next_grant[122]} } |
    share_123 & { SHARE_COUNTER_W {next_grant[123]} } |
    share_124 & { SHARE_COUNTER_W {next_grant[124]} } |
    share_125 & { SHARE_COUNTER_W {next_grant[125]} } |
    share_126 & { SHARE_COUNTER_W {next_grant[126]} } |
    share_127 & { SHARE_COUNTER_W {next_grant[127]} } |
    share_128 & { SHARE_COUNTER_W {next_grant[128]} } |
    share_129 & { SHARE_COUNTER_W {next_grant[129]} } |
    share_130 & { SHARE_COUNTER_W {next_grant[130]} } |
    share_131 & { SHARE_COUNTER_W {next_grant[131]} } |
    share_132 & { SHARE_COUNTER_W {next_grant[132]} } |
    share_133 & { SHARE_COUNTER_W {next_grant[133]} } |
    share_134 & { SHARE_COUNTER_W {next_grant[134]} } |
    share_135 & { SHARE_COUNTER_W {next_grant[135]} } |
    share_136 & { SHARE_COUNTER_W {next_grant[136]} } |
    share_137 & { SHARE_COUNTER_W {next_grant[137]} } |
    share_138 & { SHARE_COUNTER_W {next_grant[138]} } |
    share_139 & { SHARE_COUNTER_W {next_grant[139]} } |
    share_140 & { SHARE_COUNTER_W {next_grant[140]} } |
    share_141 & { SHARE_COUNTER_W {next_grant[141]} };
    end

    // ------------------------------------------
    // Flag to indicate first packet of an arb sequence.
    // ------------------------------------------
    wire grant_changed = ~packet_in_progress && ~(|(saved_grant & valid));
    reg first_packet_r;
    wire first_packet = grant_changed | first_packet_r;
    always @(posedge clk or posedge reset) begin
      if (reset) begin
        first_packet_r <= 1'b0;
      end
      else begin 
        if (update_grant)
          first_packet_r <= 1'b1;
        else if (last_cycle)
          first_packet_r <= 1'b0;
        else if (grant_changed)
          first_packet_r <= 1'b1;
      end
    end

    // ------------------------------------------
    // Compute the next share-count value.
    // ------------------------------------------
    reg [SHARE_COUNTER_W - 1 : 0] p1_share_count;
    reg [SHARE_COUNTER_W - 1 : 0] share_count;
    reg share_count_zero_flag;

    always @* begin
      if (first_packet) begin
        p1_share_count = next_grant_share;
      end
      else begin
            // Update the counter, but don't decrement below 0.
        p1_share_count = share_count_zero_flag ? '0 : share_count - 1'b1;
      end
     end

    // ------------------------------------------
    // Update the share counter and share-counter=zero flag.
    // ------------------------------------------
    always @(posedge clk or posedge reset) begin
      if (reset) begin
        share_count <= '0;
        share_count_zero_flag <= 1'b1;
      end
      else begin
        if (last_cycle) begin
          share_count <= p1_share_count;
          share_count_zero_flag <= (p1_share_count == '0);
        end
      end
    end

    // ------------------------------------------
    // For each input, maintain a final_packet signal which goes active for the
    // last packet of a full-share packet sequence.  Example: if I have 4
    // shares and I'm continuously requesting, final_packet is active in the
    // 4th packet.
    // ------------------------------------------
    wire final_packet_0 = 1'b1;

    wire final_packet_1 = 1'b1;

    wire final_packet_2 = 1'b1;

    wire final_packet_3 = 1'b1;

    wire final_packet_4 = 1'b1;

    wire final_packet_5 = 1'b1;

    wire final_packet_6 = 1'b1;

    wire final_packet_7 = 1'b1;

    wire final_packet_8 = 1'b1;

    wire final_packet_9 = 1'b1;

    wire final_packet_10 = 1'b1;

    wire final_packet_11 = 1'b1;

    wire final_packet_12 = 1'b1;

    wire final_packet_13 = 1'b1;

    wire final_packet_14 = 1'b1;

    wire final_packet_15 = 1'b1;

    wire final_packet_16 = 1'b1;

    wire final_packet_17 = 1'b1;

    wire final_packet_18 = 1'b1;

    wire final_packet_19 = 1'b1;

    wire final_packet_20 = 1'b1;

    wire final_packet_21 = 1'b1;

    wire final_packet_22 = 1'b1;

    wire final_packet_23 = 1'b1;

    wire final_packet_24 = 1'b1;

    wire final_packet_25 = 1'b1;

    wire final_packet_26 = 1'b1;

    wire final_packet_27 = 1'b1;

    wire final_packet_28 = 1'b1;

    wire final_packet_29 = 1'b1;

    wire final_packet_30 = 1'b1;

    wire final_packet_31 = 1'b1;

    wire final_packet_32 = 1'b1;

    wire final_packet_33 = 1'b1;

    wire final_packet_34 = 1'b1;

    wire final_packet_35 = 1'b1;

    wire final_packet_36 = 1'b1;

    wire final_packet_37 = 1'b1;

    wire final_packet_38 = 1'b1;

    wire final_packet_39 = 1'b1;

    wire final_packet_40 = 1'b1;

    wire final_packet_41 = 1'b1;

    wire final_packet_42 = 1'b1;

    wire final_packet_43 = 1'b1;

    wire final_packet_44 = 1'b1;

    wire final_packet_45 = 1'b1;

    wire final_packet_46 = 1'b1;

    wire final_packet_47 = 1'b1;

    wire final_packet_48 = 1'b1;

    wire final_packet_49 = 1'b1;

    wire final_packet_50 = 1'b1;

    wire final_packet_51 = 1'b1;

    wire final_packet_52 = 1'b1;

    wire final_packet_53 = 1'b1;

    wire final_packet_54 = 1'b1;

    wire final_packet_55 = 1'b1;

    wire final_packet_56 = 1'b1;

    wire final_packet_57 = 1'b1;

    wire final_packet_58 = 1'b1;

    wire final_packet_59 = 1'b1;

    wire final_packet_60 = 1'b1;

    wire final_packet_61 = 1'b1;

    wire final_packet_62 = 1'b1;

    wire final_packet_63 = 1'b1;

    wire final_packet_64 = 1'b1;

    wire final_packet_65 = 1'b1;

    wire final_packet_66 = 1'b1;

    wire final_packet_67 = 1'b1;

    wire final_packet_68 = 1'b1;

    wire final_packet_69 = 1'b1;

    wire final_packet_70 = 1'b1;

    wire final_packet_71 = 1'b1;

    wire final_packet_72 = 1'b1;

    wire final_packet_73 = 1'b1;

    wire final_packet_74 = 1'b1;

    wire final_packet_75 = 1'b1;

    wire final_packet_76 = 1'b1;

    wire final_packet_77 = 1'b1;

    wire final_packet_78 = 1'b1;

    wire final_packet_79 = 1'b1;

    wire final_packet_80 = 1'b1;

    wire final_packet_81 = 1'b1;

    wire final_packet_82 = 1'b1;

    wire final_packet_83 = 1'b1;

    wire final_packet_84 = 1'b1;

    wire final_packet_85 = 1'b1;

    wire final_packet_86 = 1'b1;

    wire final_packet_87 = 1'b1;

    wire final_packet_88 = 1'b1;

    wire final_packet_89 = 1'b1;

    wire final_packet_90 = 1'b1;

    wire final_packet_91 = 1'b1;

    wire final_packet_92 = 1'b1;

    wire final_packet_93 = 1'b1;

    wire final_packet_94 = 1'b1;

    wire final_packet_95 = 1'b1;

    wire final_packet_96 = 1'b1;

    wire final_packet_97 = 1'b1;

    wire final_packet_98 = 1'b1;

    wire final_packet_99 = 1'b1;

    wire final_packet_100 = 1'b1;

    wire final_packet_101 = 1'b1;

    wire final_packet_102 = 1'b1;

    wire final_packet_103 = 1'b1;

    wire final_packet_104 = 1'b1;

    wire final_packet_105 = 1'b1;

    wire final_packet_106 = 1'b1;

    wire final_packet_107 = 1'b1;

    wire final_packet_108 = 1'b1;

    wire final_packet_109 = 1'b1;

    wire final_packet_110 = 1'b1;

    wire final_packet_111 = 1'b1;

    wire final_packet_112 = 1'b1;

    wire final_packet_113 = 1'b1;

    wire final_packet_114 = 1'b1;

    wire final_packet_115 = 1'b1;

    wire final_packet_116 = 1'b1;

    wire final_packet_117 = 1'b1;

    wire final_packet_118 = 1'b1;

    wire final_packet_119 = 1'b1;

    wire final_packet_120 = 1'b1;

    wire final_packet_121 = 1'b1;

    wire final_packet_122 = 1'b1;

    wire final_packet_123 = 1'b1;

    wire final_packet_124 = 1'b1;

    wire final_packet_125 = 1'b1;

    wire final_packet_126 = 1'b1;

    wire final_packet_127 = 1'b1;

    wire final_packet_128 = 1'b1;

    wire final_packet_129 = 1'b1;

    wire final_packet_130 = 1'b1;

    wire final_packet_131 = 1'b1;

    wire final_packet_132 = 1'b1;

    wire final_packet_133 = 1'b1;

    wire final_packet_134 = 1'b1;

    wire final_packet_135 = 1'b1;

    wire final_packet_136 = 1'b1;

    wire final_packet_137 = 1'b1;

    wire final_packet_138 = 1'b1;

    wire final_packet_139 = 1'b1;

    wire final_packet_140 = 1'b1;

    wire final_packet_141 = 1'b1;


    // ------------------------------------------
    // Concatenate all final_packet signals (wire or reg) into a handy vector.
    // ------------------------------------------
    wire [NUM_INPUTS - 1 : 0] final_packet = {
    final_packet_141,
    final_packet_140,
    final_packet_139,
    final_packet_138,
    final_packet_137,
    final_packet_136,
    final_packet_135,
    final_packet_134,
    final_packet_133,
    final_packet_132,
    final_packet_131,
    final_packet_130,
    final_packet_129,
    final_packet_128,
    final_packet_127,
    final_packet_126,
    final_packet_125,
    final_packet_124,
    final_packet_123,
    final_packet_122,
    final_packet_121,
    final_packet_120,
    final_packet_119,
    final_packet_118,
    final_packet_117,
    final_packet_116,
    final_packet_115,
    final_packet_114,
    final_packet_113,
    final_packet_112,
    final_packet_111,
    final_packet_110,
    final_packet_109,
    final_packet_108,
    final_packet_107,
    final_packet_106,
    final_packet_105,
    final_packet_104,
    final_packet_103,
    final_packet_102,
    final_packet_101,
    final_packet_100,
    final_packet_99,
    final_packet_98,
    final_packet_97,
    final_packet_96,
    final_packet_95,
    final_packet_94,
    final_packet_93,
    final_packet_92,
    final_packet_91,
    final_packet_90,
    final_packet_89,
    final_packet_88,
    final_packet_87,
    final_packet_86,
    final_packet_85,
    final_packet_84,
    final_packet_83,
    final_packet_82,
    final_packet_81,
    final_packet_80,
    final_packet_79,
    final_packet_78,
    final_packet_77,
    final_packet_76,
    final_packet_75,
    final_packet_74,
    final_packet_73,
    final_packet_72,
    final_packet_71,
    final_packet_70,
    final_packet_69,
    final_packet_68,
    final_packet_67,
    final_packet_66,
    final_packet_65,
    final_packet_64,
    final_packet_63,
    final_packet_62,
    final_packet_61,
    final_packet_60,
    final_packet_59,
    final_packet_58,
    final_packet_57,
    final_packet_56,
    final_packet_55,
    final_packet_54,
    final_packet_53,
    final_packet_52,
    final_packet_51,
    final_packet_50,
    final_packet_49,
    final_packet_48,
    final_packet_47,
    final_packet_46,
    final_packet_45,
    final_packet_44,
    final_packet_43,
    final_packet_42,
    final_packet_41,
    final_packet_40,
    final_packet_39,
    final_packet_38,
    final_packet_37,
    final_packet_36,
    final_packet_35,
    final_packet_34,
    final_packet_33,
    final_packet_32,
    final_packet_31,
    final_packet_30,
    final_packet_29,
    final_packet_28,
    final_packet_27,
    final_packet_26,
    final_packet_25,
    final_packet_24,
    final_packet_23,
    final_packet_22,
    final_packet_21,
    final_packet_20,
    final_packet_19,
    final_packet_18,
    final_packet_17,
    final_packet_16,
    final_packet_15,
    final_packet_14,
    final_packet_13,
    final_packet_12,
    final_packet_11,
    final_packet_10,
    final_packet_9,
    final_packet_8,
    final_packet_7,
    final_packet_6,
    final_packet_5,
    final_packet_4,
    final_packet_3,
    final_packet_2,
    final_packet_1,
    final_packet_0
    };

    // ------------------------------------------
    // ------------------------------------------
    wire p1_done = |(final_packet & grant);

    // ------------------------------------------
    // Flag for the first cycle of packets within an 
    // arb sequence
    // ------------------------------------------
    reg first_cycle;
    always @(posedge clk, posedge reset) begin
      if (reset)
        first_cycle <= 0;
      else
        first_cycle <= last_cycle && ~p1_done;
    end


    always @* begin
      update_grant = 0;

        // ------------------------------------------
        // No arbitration pipeline, update grant whenever
        // the current arb winner has consumed all shares,
        // or all requests are low
        // ------------------------------------------
  update_grant = (last_cycle && p1_done) || (first_cycle && ~(|valid));
  update_grant = last_cycle;
    end

    wire save_grant;
    assign save_grant = 1;
    assign grant = next_grant;

    always @(posedge clk, posedge reset) begin
      if (reset)
        saved_grant <= '0;
      else if (save_grant)
        saved_grant <= next_grant;
    end

    // ------------------------------------------
    // ------------------------------------------
    // Arbitrator
    // ------------------------------------------
    // ------------------------------------------

    // ------------------------------------------
    // Create a request vector that stays high during
    // the packet for unpipelined arbitration.
    //
    // The pipelined arbitration scheme does not require
    // request to be held high during the packet.
    // ------------------------------------------
    assign request = valid;

    wire [NUM_INPUTS - 1 : 0] next_grant_from_arb;
                               
    altera_merlin_arbitrator
    #(
    .NUM_REQUESTERS(NUM_INPUTS),
    .SCHEME ("no-arb"),
    .PIPELINE (0)
    ) arb (
    .clk (clk),
    .reset (reset),
    .request (request),
    .grant (next_grant_from_arb),
    .save_top_priority (src_valid),
    .increment_top_priority (update_grant)
    );

   assign next_grant = next_grant_from_arb;
                         
    // ------------------------------------------
    // ------------------------------------------
    // Mux
    //
    // Implemented as a sum of products.
    // ------------------------------------------
    // ------------------------------------------

    assign sink0_ready = src_ready && grant[0];
    assign sink1_ready = src_ready && grant[1];
    assign sink2_ready = src_ready && grant[2];
    assign sink3_ready = src_ready && grant[3];
    assign sink4_ready = src_ready && grant[4];
    assign sink5_ready = src_ready && grant[5];
    assign sink6_ready = src_ready && grant[6];
    assign sink7_ready = src_ready && grant[7];
    assign sink8_ready = src_ready && grant[8];
    assign sink9_ready = src_ready && grant[9];
    assign sink10_ready = src_ready && grant[10];
    assign sink11_ready = src_ready && grant[11];
    assign sink12_ready = src_ready && grant[12];
    assign sink13_ready = src_ready && grant[13];
    assign sink14_ready = src_ready && grant[14];
    assign sink15_ready = src_ready && grant[15];
    assign sink16_ready = src_ready && grant[16];
    assign sink17_ready = src_ready && grant[17];
    assign sink18_ready = src_ready && grant[18];
    assign sink19_ready = src_ready && grant[19];
    assign sink20_ready = src_ready && grant[20];
    assign sink21_ready = src_ready && grant[21];
    assign sink22_ready = src_ready && grant[22];
    assign sink23_ready = src_ready && grant[23];
    assign sink24_ready = src_ready && grant[24];
    assign sink25_ready = src_ready && grant[25];
    assign sink26_ready = src_ready && grant[26];
    assign sink27_ready = src_ready && grant[27];
    assign sink28_ready = src_ready && grant[28];
    assign sink29_ready = src_ready && grant[29];
    assign sink30_ready = src_ready && grant[30];
    assign sink31_ready = src_ready && grant[31];
    assign sink32_ready = src_ready && grant[32];
    assign sink33_ready = src_ready && grant[33];
    assign sink34_ready = src_ready && grant[34];
    assign sink35_ready = src_ready && grant[35];
    assign sink36_ready = src_ready && grant[36];
    assign sink37_ready = src_ready && grant[37];
    assign sink38_ready = src_ready && grant[38];
    assign sink39_ready = src_ready && grant[39];
    assign sink40_ready = src_ready && grant[40];
    assign sink41_ready = src_ready && grant[41];
    assign sink42_ready = src_ready && grant[42];
    assign sink43_ready = src_ready && grant[43];
    assign sink44_ready = src_ready && grant[44];
    assign sink45_ready = src_ready && grant[45];
    assign sink46_ready = src_ready && grant[46];
    assign sink47_ready = src_ready && grant[47];
    assign sink48_ready = src_ready && grant[48];
    assign sink49_ready = src_ready && grant[49];
    assign sink50_ready = src_ready && grant[50];
    assign sink51_ready = src_ready && grant[51];
    assign sink52_ready = src_ready && grant[52];
    assign sink53_ready = src_ready && grant[53];
    assign sink54_ready = src_ready && grant[54];
    assign sink55_ready = src_ready && grant[55];
    assign sink56_ready = src_ready && grant[56];
    assign sink57_ready = src_ready && grant[57];
    assign sink58_ready = src_ready && grant[58];
    assign sink59_ready = src_ready && grant[59];
    assign sink60_ready = src_ready && grant[60];
    assign sink61_ready = src_ready && grant[61];
    assign sink62_ready = src_ready && grant[62];
    assign sink63_ready = src_ready && grant[63];
    assign sink64_ready = src_ready && grant[64];
    assign sink65_ready = src_ready && grant[65];
    assign sink66_ready = src_ready && grant[66];
    assign sink67_ready = src_ready && grant[67];
    assign sink68_ready = src_ready && grant[68];
    assign sink69_ready = src_ready && grant[69];
    assign sink70_ready = src_ready && grant[70];
    assign sink71_ready = src_ready && grant[71];
    assign sink72_ready = src_ready && grant[72];
    assign sink73_ready = src_ready && grant[73];
    assign sink74_ready = src_ready && grant[74];
    assign sink75_ready = src_ready && grant[75];
    assign sink76_ready = src_ready && grant[76];
    assign sink77_ready = src_ready && grant[77];
    assign sink78_ready = src_ready && grant[78];
    assign sink79_ready = src_ready && grant[79];
    assign sink80_ready = src_ready && grant[80];
    assign sink81_ready = src_ready && grant[81];
    assign sink82_ready = src_ready && grant[82];
    assign sink83_ready = src_ready && grant[83];
    assign sink84_ready = src_ready && grant[84];
    assign sink85_ready = src_ready && grant[85];
    assign sink86_ready = src_ready && grant[86];
    assign sink87_ready = src_ready && grant[87];
    assign sink88_ready = src_ready && grant[88];
    assign sink89_ready = src_ready && grant[89];
    assign sink90_ready = src_ready && grant[90];
    assign sink91_ready = src_ready && grant[91];
    assign sink92_ready = src_ready && grant[92];
    assign sink93_ready = src_ready && grant[93];
    assign sink94_ready = src_ready && grant[94];
    assign sink95_ready = src_ready && grant[95];
    assign sink96_ready = src_ready && grant[96];
    assign sink97_ready = src_ready && grant[97];
    assign sink98_ready = src_ready && grant[98];
    assign sink99_ready = src_ready && grant[99];
    assign sink100_ready = src_ready && grant[100];
    assign sink101_ready = src_ready && grant[101];
    assign sink102_ready = src_ready && grant[102];
    assign sink103_ready = src_ready && grant[103];
    assign sink104_ready = src_ready && grant[104];
    assign sink105_ready = src_ready && grant[105];
    assign sink106_ready = src_ready && grant[106];
    assign sink107_ready = src_ready && grant[107];
    assign sink108_ready = src_ready && grant[108];
    assign sink109_ready = src_ready && grant[109];
    assign sink110_ready = src_ready && grant[110];
    assign sink111_ready = src_ready && grant[111];
    assign sink112_ready = src_ready && grant[112];
    assign sink113_ready = src_ready && grant[113];
    assign sink114_ready = src_ready && grant[114];
    assign sink115_ready = src_ready && grant[115];
    assign sink116_ready = src_ready && grant[116];
    assign sink117_ready = src_ready && grant[117];
    assign sink118_ready = src_ready && grant[118];
    assign sink119_ready = src_ready && grant[119];
    assign sink120_ready = src_ready && grant[120];
    assign sink121_ready = src_ready && grant[121];
    assign sink122_ready = src_ready && grant[122];
    assign sink123_ready = src_ready && grant[123];
    assign sink124_ready = src_ready && grant[124];
    assign sink125_ready = src_ready && grant[125];
    assign sink126_ready = src_ready && grant[126];
    assign sink127_ready = src_ready && grant[127];
    assign sink128_ready = src_ready && grant[128];
    assign sink129_ready = src_ready && grant[129];
    assign sink130_ready = src_ready && grant[130];
    assign sink131_ready = src_ready && grant[131];
    assign sink132_ready = src_ready && grant[132];
    assign sink133_ready = src_ready && grant[133];
    assign sink134_ready = src_ready && grant[134];
    assign sink135_ready = src_ready && grant[135];
    assign sink136_ready = src_ready && grant[136];
    assign sink137_ready = src_ready && grant[137];
    assign sink138_ready = src_ready && grant[138];
    assign sink139_ready = src_ready && grant[139];
    assign sink140_ready = src_ready && grant[140];
    assign sink141_ready = src_ready && grant[141];

    assign src_valid = |(grant & valid);

    always @* begin
      src_payload =
      sink0_payload & {PAYLOAD_W {grant[0]} } |
      sink1_payload & {PAYLOAD_W {grant[1]} } |
      sink2_payload & {PAYLOAD_W {grant[2]} } |
      sink3_payload & {PAYLOAD_W {grant[3]} } |
      sink4_payload & {PAYLOAD_W {grant[4]} } |
      sink5_payload & {PAYLOAD_W {grant[5]} } |
      sink6_payload & {PAYLOAD_W {grant[6]} } |
      sink7_payload & {PAYLOAD_W {grant[7]} } |
      sink8_payload & {PAYLOAD_W {grant[8]} } |
      sink9_payload & {PAYLOAD_W {grant[9]} } |
      sink10_payload & {PAYLOAD_W {grant[10]} } |
      sink11_payload & {PAYLOAD_W {grant[11]} } |
      sink12_payload & {PAYLOAD_W {grant[12]} } |
      sink13_payload & {PAYLOAD_W {grant[13]} } |
      sink14_payload & {PAYLOAD_W {grant[14]} } |
      sink15_payload & {PAYLOAD_W {grant[15]} } |
      sink16_payload & {PAYLOAD_W {grant[16]} } |
      sink17_payload & {PAYLOAD_W {grant[17]} } |
      sink18_payload & {PAYLOAD_W {grant[18]} } |
      sink19_payload & {PAYLOAD_W {grant[19]} } |
      sink20_payload & {PAYLOAD_W {grant[20]} } |
      sink21_payload & {PAYLOAD_W {grant[21]} } |
      sink22_payload & {PAYLOAD_W {grant[22]} } |
      sink23_payload & {PAYLOAD_W {grant[23]} } |
      sink24_payload & {PAYLOAD_W {grant[24]} } |
      sink25_payload & {PAYLOAD_W {grant[25]} } |
      sink26_payload & {PAYLOAD_W {grant[26]} } |
      sink27_payload & {PAYLOAD_W {grant[27]} } |
      sink28_payload & {PAYLOAD_W {grant[28]} } |
      sink29_payload & {PAYLOAD_W {grant[29]} } |
      sink30_payload & {PAYLOAD_W {grant[30]} } |
      sink31_payload & {PAYLOAD_W {grant[31]} } |
      sink32_payload & {PAYLOAD_W {grant[32]} } |
      sink33_payload & {PAYLOAD_W {grant[33]} } |
      sink34_payload & {PAYLOAD_W {grant[34]} } |
      sink35_payload & {PAYLOAD_W {grant[35]} } |
      sink36_payload & {PAYLOAD_W {grant[36]} } |
      sink37_payload & {PAYLOAD_W {grant[37]} } |
      sink38_payload & {PAYLOAD_W {grant[38]} } |
      sink39_payload & {PAYLOAD_W {grant[39]} } |
      sink40_payload & {PAYLOAD_W {grant[40]} } |
      sink41_payload & {PAYLOAD_W {grant[41]} } |
      sink42_payload & {PAYLOAD_W {grant[42]} } |
      sink43_payload & {PAYLOAD_W {grant[43]} } |
      sink44_payload & {PAYLOAD_W {grant[44]} } |
      sink45_payload & {PAYLOAD_W {grant[45]} } |
      sink46_payload & {PAYLOAD_W {grant[46]} } |
      sink47_payload & {PAYLOAD_W {grant[47]} } |
      sink48_payload & {PAYLOAD_W {grant[48]} } |
      sink49_payload & {PAYLOAD_W {grant[49]} } |
      sink50_payload & {PAYLOAD_W {grant[50]} } |
      sink51_payload & {PAYLOAD_W {grant[51]} } |
      sink52_payload & {PAYLOAD_W {grant[52]} } |
      sink53_payload & {PAYLOAD_W {grant[53]} } |
      sink54_payload & {PAYLOAD_W {grant[54]} } |
      sink55_payload & {PAYLOAD_W {grant[55]} } |
      sink56_payload & {PAYLOAD_W {grant[56]} } |
      sink57_payload & {PAYLOAD_W {grant[57]} } |
      sink58_payload & {PAYLOAD_W {grant[58]} } |
      sink59_payload & {PAYLOAD_W {grant[59]} } |
      sink60_payload & {PAYLOAD_W {grant[60]} } |
      sink61_payload & {PAYLOAD_W {grant[61]} } |
      sink62_payload & {PAYLOAD_W {grant[62]} } |
      sink63_payload & {PAYLOAD_W {grant[63]} } |
      sink64_payload & {PAYLOAD_W {grant[64]} } |
      sink65_payload & {PAYLOAD_W {grant[65]} } |
      sink66_payload & {PAYLOAD_W {grant[66]} } |
      sink67_payload & {PAYLOAD_W {grant[67]} } |
      sink68_payload & {PAYLOAD_W {grant[68]} } |
      sink69_payload & {PAYLOAD_W {grant[69]} } |
      sink70_payload & {PAYLOAD_W {grant[70]} } |
      sink71_payload & {PAYLOAD_W {grant[71]} } |
      sink72_payload & {PAYLOAD_W {grant[72]} } |
      sink73_payload & {PAYLOAD_W {grant[73]} } |
      sink74_payload & {PAYLOAD_W {grant[74]} } |
      sink75_payload & {PAYLOAD_W {grant[75]} } |
      sink76_payload & {PAYLOAD_W {grant[76]} } |
      sink77_payload & {PAYLOAD_W {grant[77]} } |
      sink78_payload & {PAYLOAD_W {grant[78]} } |
      sink79_payload & {PAYLOAD_W {grant[79]} } |
      sink80_payload & {PAYLOAD_W {grant[80]} } |
      sink81_payload & {PAYLOAD_W {grant[81]} } |
      sink82_payload & {PAYLOAD_W {grant[82]} } |
      sink83_payload & {PAYLOAD_W {grant[83]} } |
      sink84_payload & {PAYLOAD_W {grant[84]} } |
      sink85_payload & {PAYLOAD_W {grant[85]} } |
      sink86_payload & {PAYLOAD_W {grant[86]} } |
      sink87_payload & {PAYLOAD_W {grant[87]} } |
      sink88_payload & {PAYLOAD_W {grant[88]} } |
      sink89_payload & {PAYLOAD_W {grant[89]} } |
      sink90_payload & {PAYLOAD_W {grant[90]} } |
      sink91_payload & {PAYLOAD_W {grant[91]} } |
      sink92_payload & {PAYLOAD_W {grant[92]} } |
      sink93_payload & {PAYLOAD_W {grant[93]} } |
      sink94_payload & {PAYLOAD_W {grant[94]} } |
      sink95_payload & {PAYLOAD_W {grant[95]} } |
      sink96_payload & {PAYLOAD_W {grant[96]} } |
      sink97_payload & {PAYLOAD_W {grant[97]} } |
      sink98_payload & {PAYLOAD_W {grant[98]} } |
      sink99_payload & {PAYLOAD_W {grant[99]} } |
      sink100_payload & {PAYLOAD_W {grant[100]} } |
      sink101_payload & {PAYLOAD_W {grant[101]} } |
      sink102_payload & {PAYLOAD_W {grant[102]} } |
      sink103_payload & {PAYLOAD_W {grant[103]} } |
      sink104_payload & {PAYLOAD_W {grant[104]} } |
      sink105_payload & {PAYLOAD_W {grant[105]} } |
      sink106_payload & {PAYLOAD_W {grant[106]} } |
      sink107_payload & {PAYLOAD_W {grant[107]} } |
      sink108_payload & {PAYLOAD_W {grant[108]} } |
      sink109_payload & {PAYLOAD_W {grant[109]} } |
      sink110_payload & {PAYLOAD_W {grant[110]} } |
      sink111_payload & {PAYLOAD_W {grant[111]} } |
      sink112_payload & {PAYLOAD_W {grant[112]} } |
      sink113_payload & {PAYLOAD_W {grant[113]} } |
      sink114_payload & {PAYLOAD_W {grant[114]} } |
      sink115_payload & {PAYLOAD_W {grant[115]} } |
      sink116_payload & {PAYLOAD_W {grant[116]} } |
      sink117_payload & {PAYLOAD_W {grant[117]} } |
      sink118_payload & {PAYLOAD_W {grant[118]} } |
      sink119_payload & {PAYLOAD_W {grant[119]} } |
      sink120_payload & {PAYLOAD_W {grant[120]} } |
      sink121_payload & {PAYLOAD_W {grant[121]} } |
      sink122_payload & {PAYLOAD_W {grant[122]} } |
      sink123_payload & {PAYLOAD_W {grant[123]} } |
      sink124_payload & {PAYLOAD_W {grant[124]} } |
      sink125_payload & {PAYLOAD_W {grant[125]} } |
      sink126_payload & {PAYLOAD_W {grant[126]} } |
      sink127_payload & {PAYLOAD_W {grant[127]} } |
      sink128_payload & {PAYLOAD_W {grant[128]} } |
      sink129_payload & {PAYLOAD_W {grant[129]} } |
      sink130_payload & {PAYLOAD_W {grant[130]} } |
      sink131_payload & {PAYLOAD_W {grant[131]} } |
      sink132_payload & {PAYLOAD_W {grant[132]} } |
      sink133_payload & {PAYLOAD_W {grant[133]} } |
      sink134_payload & {PAYLOAD_W {grant[134]} } |
      sink135_payload & {PAYLOAD_W {grant[135]} } |
      sink136_payload & {PAYLOAD_W {grant[136]} } |
      sink137_payload & {PAYLOAD_W {grant[137]} } |
      sink138_payload & {PAYLOAD_W {grant[138]} } |
      sink139_payload & {PAYLOAD_W {grant[139]} } |
      sink140_payload & {PAYLOAD_W {grant[140]} } |
      sink141_payload & {PAYLOAD_W {grant[141]} };
    end

    // ------------------------------------------
    // Mux Payload Mapping
    // ------------------------------------------

    assign sink0_payload = {sink0_channel,sink0_data,
    sink0_startofpacket,sink0_endofpacket};
    assign sink1_payload = {sink1_channel,sink1_data,
    sink1_startofpacket,sink1_endofpacket};
    assign sink2_payload = {sink2_channel,sink2_data,
    sink2_startofpacket,sink2_endofpacket};
    assign sink3_payload = {sink3_channel,sink3_data,
    sink3_startofpacket,sink3_endofpacket};
    assign sink4_payload = {sink4_channel,sink4_data,
    sink4_startofpacket,sink4_endofpacket};
    assign sink5_payload = {sink5_channel,sink5_data,
    sink5_startofpacket,sink5_endofpacket};
    assign sink6_payload = {sink6_channel,sink6_data,
    sink6_startofpacket,sink6_endofpacket};
    assign sink7_payload = {sink7_channel,sink7_data,
    sink7_startofpacket,sink7_endofpacket};
    assign sink8_payload = {sink8_channel,sink8_data,
    sink8_startofpacket,sink8_endofpacket};
    assign sink9_payload = {sink9_channel,sink9_data,
    sink9_startofpacket,sink9_endofpacket};
    assign sink10_payload = {sink10_channel,sink10_data,
    sink10_startofpacket,sink10_endofpacket};
    assign sink11_payload = {sink11_channel,sink11_data,
    sink11_startofpacket,sink11_endofpacket};
    assign sink12_payload = {sink12_channel,sink12_data,
    sink12_startofpacket,sink12_endofpacket};
    assign sink13_payload = {sink13_channel,sink13_data,
    sink13_startofpacket,sink13_endofpacket};
    assign sink14_payload = {sink14_channel,sink14_data,
    sink14_startofpacket,sink14_endofpacket};
    assign sink15_payload = {sink15_channel,sink15_data,
    sink15_startofpacket,sink15_endofpacket};
    assign sink16_payload = {sink16_channel,sink16_data,
    sink16_startofpacket,sink16_endofpacket};
    assign sink17_payload = {sink17_channel,sink17_data,
    sink17_startofpacket,sink17_endofpacket};
    assign sink18_payload = {sink18_channel,sink18_data,
    sink18_startofpacket,sink18_endofpacket};
    assign sink19_payload = {sink19_channel,sink19_data,
    sink19_startofpacket,sink19_endofpacket};
    assign sink20_payload = {sink20_channel,sink20_data,
    sink20_startofpacket,sink20_endofpacket};
    assign sink21_payload = {sink21_channel,sink21_data,
    sink21_startofpacket,sink21_endofpacket};
    assign sink22_payload = {sink22_channel,sink22_data,
    sink22_startofpacket,sink22_endofpacket};
    assign sink23_payload = {sink23_channel,sink23_data,
    sink23_startofpacket,sink23_endofpacket};
    assign sink24_payload = {sink24_channel,sink24_data,
    sink24_startofpacket,sink24_endofpacket};
    assign sink25_payload = {sink25_channel,sink25_data,
    sink25_startofpacket,sink25_endofpacket};
    assign sink26_payload = {sink26_channel,sink26_data,
    sink26_startofpacket,sink26_endofpacket};
    assign sink27_payload = {sink27_channel,sink27_data,
    sink27_startofpacket,sink27_endofpacket};
    assign sink28_payload = {sink28_channel,sink28_data,
    sink28_startofpacket,sink28_endofpacket};
    assign sink29_payload = {sink29_channel,sink29_data,
    sink29_startofpacket,sink29_endofpacket};
    assign sink30_payload = {sink30_channel,sink30_data,
    sink30_startofpacket,sink30_endofpacket};
    assign sink31_payload = {sink31_channel,sink31_data,
    sink31_startofpacket,sink31_endofpacket};
    assign sink32_payload = {sink32_channel,sink32_data,
    sink32_startofpacket,sink32_endofpacket};
    assign sink33_payload = {sink33_channel,sink33_data,
    sink33_startofpacket,sink33_endofpacket};
    assign sink34_payload = {sink34_channel,sink34_data,
    sink34_startofpacket,sink34_endofpacket};
    assign sink35_payload = {sink35_channel,sink35_data,
    sink35_startofpacket,sink35_endofpacket};
    assign sink36_payload = {sink36_channel,sink36_data,
    sink36_startofpacket,sink36_endofpacket};
    assign sink37_payload = {sink37_channel,sink37_data,
    sink37_startofpacket,sink37_endofpacket};
    assign sink38_payload = {sink38_channel,sink38_data,
    sink38_startofpacket,sink38_endofpacket};
    assign sink39_payload = {sink39_channel,sink39_data,
    sink39_startofpacket,sink39_endofpacket};
    assign sink40_payload = {sink40_channel,sink40_data,
    sink40_startofpacket,sink40_endofpacket};
    assign sink41_payload = {sink41_channel,sink41_data,
    sink41_startofpacket,sink41_endofpacket};
    assign sink42_payload = {sink42_channel,sink42_data,
    sink42_startofpacket,sink42_endofpacket};
    assign sink43_payload = {sink43_channel,sink43_data,
    sink43_startofpacket,sink43_endofpacket};
    assign sink44_payload = {sink44_channel,sink44_data,
    sink44_startofpacket,sink44_endofpacket};
    assign sink45_payload = {sink45_channel,sink45_data,
    sink45_startofpacket,sink45_endofpacket};
    assign sink46_payload = {sink46_channel,sink46_data,
    sink46_startofpacket,sink46_endofpacket};
    assign sink47_payload = {sink47_channel,sink47_data,
    sink47_startofpacket,sink47_endofpacket};
    assign sink48_payload = {sink48_channel,sink48_data,
    sink48_startofpacket,sink48_endofpacket};
    assign sink49_payload = {sink49_channel,sink49_data,
    sink49_startofpacket,sink49_endofpacket};
    assign sink50_payload = {sink50_channel,sink50_data,
    sink50_startofpacket,sink50_endofpacket};
    assign sink51_payload = {sink51_channel,sink51_data,
    sink51_startofpacket,sink51_endofpacket};
    assign sink52_payload = {sink52_channel,sink52_data,
    sink52_startofpacket,sink52_endofpacket};
    assign sink53_payload = {sink53_channel,sink53_data,
    sink53_startofpacket,sink53_endofpacket};
    assign sink54_payload = {sink54_channel,sink54_data,
    sink54_startofpacket,sink54_endofpacket};
    assign sink55_payload = {sink55_channel,sink55_data,
    sink55_startofpacket,sink55_endofpacket};
    assign sink56_payload = {sink56_channel,sink56_data,
    sink56_startofpacket,sink56_endofpacket};
    assign sink57_payload = {sink57_channel,sink57_data,
    sink57_startofpacket,sink57_endofpacket};
    assign sink58_payload = {sink58_channel,sink58_data,
    sink58_startofpacket,sink58_endofpacket};
    assign sink59_payload = {sink59_channel,sink59_data,
    sink59_startofpacket,sink59_endofpacket};
    assign sink60_payload = {sink60_channel,sink60_data,
    sink60_startofpacket,sink60_endofpacket};
    assign sink61_payload = {sink61_channel,sink61_data,
    sink61_startofpacket,sink61_endofpacket};
    assign sink62_payload = {sink62_channel,sink62_data,
    sink62_startofpacket,sink62_endofpacket};
    assign sink63_payload = {sink63_channel,sink63_data,
    sink63_startofpacket,sink63_endofpacket};
    assign sink64_payload = {sink64_channel,sink64_data,
    sink64_startofpacket,sink64_endofpacket};
    assign sink65_payload = {sink65_channel,sink65_data,
    sink65_startofpacket,sink65_endofpacket};
    assign sink66_payload = {sink66_channel,sink66_data,
    sink66_startofpacket,sink66_endofpacket};
    assign sink67_payload = {sink67_channel,sink67_data,
    sink67_startofpacket,sink67_endofpacket};
    assign sink68_payload = {sink68_channel,sink68_data,
    sink68_startofpacket,sink68_endofpacket};
    assign sink69_payload = {sink69_channel,sink69_data,
    sink69_startofpacket,sink69_endofpacket};
    assign sink70_payload = {sink70_channel,sink70_data,
    sink70_startofpacket,sink70_endofpacket};
    assign sink71_payload = {sink71_channel,sink71_data,
    sink71_startofpacket,sink71_endofpacket};
    assign sink72_payload = {sink72_channel,sink72_data,
    sink72_startofpacket,sink72_endofpacket};
    assign sink73_payload = {sink73_channel,sink73_data,
    sink73_startofpacket,sink73_endofpacket};
    assign sink74_payload = {sink74_channel,sink74_data,
    sink74_startofpacket,sink74_endofpacket};
    assign sink75_payload = {sink75_channel,sink75_data,
    sink75_startofpacket,sink75_endofpacket};
    assign sink76_payload = {sink76_channel,sink76_data,
    sink76_startofpacket,sink76_endofpacket};
    assign sink77_payload = {sink77_channel,sink77_data,
    sink77_startofpacket,sink77_endofpacket};
    assign sink78_payload = {sink78_channel,sink78_data,
    sink78_startofpacket,sink78_endofpacket};
    assign sink79_payload = {sink79_channel,sink79_data,
    sink79_startofpacket,sink79_endofpacket};
    assign sink80_payload = {sink80_channel,sink80_data,
    sink80_startofpacket,sink80_endofpacket};
    assign sink81_payload = {sink81_channel,sink81_data,
    sink81_startofpacket,sink81_endofpacket};
    assign sink82_payload = {sink82_channel,sink82_data,
    sink82_startofpacket,sink82_endofpacket};
    assign sink83_payload = {sink83_channel,sink83_data,
    sink83_startofpacket,sink83_endofpacket};
    assign sink84_payload = {sink84_channel,sink84_data,
    sink84_startofpacket,sink84_endofpacket};
    assign sink85_payload = {sink85_channel,sink85_data,
    sink85_startofpacket,sink85_endofpacket};
    assign sink86_payload = {sink86_channel,sink86_data,
    sink86_startofpacket,sink86_endofpacket};
    assign sink87_payload = {sink87_channel,sink87_data,
    sink87_startofpacket,sink87_endofpacket};
    assign sink88_payload = {sink88_channel,sink88_data,
    sink88_startofpacket,sink88_endofpacket};
    assign sink89_payload = {sink89_channel,sink89_data,
    sink89_startofpacket,sink89_endofpacket};
    assign sink90_payload = {sink90_channel,sink90_data,
    sink90_startofpacket,sink90_endofpacket};
    assign sink91_payload = {sink91_channel,sink91_data,
    sink91_startofpacket,sink91_endofpacket};
    assign sink92_payload = {sink92_channel,sink92_data,
    sink92_startofpacket,sink92_endofpacket};
    assign sink93_payload = {sink93_channel,sink93_data,
    sink93_startofpacket,sink93_endofpacket};
    assign sink94_payload = {sink94_channel,sink94_data,
    sink94_startofpacket,sink94_endofpacket};
    assign sink95_payload = {sink95_channel,sink95_data,
    sink95_startofpacket,sink95_endofpacket};
    assign sink96_payload = {sink96_channel,sink96_data,
    sink96_startofpacket,sink96_endofpacket};
    assign sink97_payload = {sink97_channel,sink97_data,
    sink97_startofpacket,sink97_endofpacket};
    assign sink98_payload = {sink98_channel,sink98_data,
    sink98_startofpacket,sink98_endofpacket};
    assign sink99_payload = {sink99_channel,sink99_data,
    sink99_startofpacket,sink99_endofpacket};
    assign sink100_payload = {sink100_channel,sink100_data,
    sink100_startofpacket,sink100_endofpacket};
    assign sink101_payload = {sink101_channel,sink101_data,
    sink101_startofpacket,sink101_endofpacket};
    assign sink102_payload = {sink102_channel,sink102_data,
    sink102_startofpacket,sink102_endofpacket};
    assign sink103_payload = {sink103_channel,sink103_data,
    sink103_startofpacket,sink103_endofpacket};
    assign sink104_payload = {sink104_channel,sink104_data,
    sink104_startofpacket,sink104_endofpacket};
    assign sink105_payload = {sink105_channel,sink105_data,
    sink105_startofpacket,sink105_endofpacket};
    assign sink106_payload = {sink106_channel,sink106_data,
    sink106_startofpacket,sink106_endofpacket};
    assign sink107_payload = {sink107_channel,sink107_data,
    sink107_startofpacket,sink107_endofpacket};
    assign sink108_payload = {sink108_channel,sink108_data,
    sink108_startofpacket,sink108_endofpacket};
    assign sink109_payload = {sink109_channel,sink109_data,
    sink109_startofpacket,sink109_endofpacket};
    assign sink110_payload = {sink110_channel,sink110_data,
    sink110_startofpacket,sink110_endofpacket};
    assign sink111_payload = {sink111_channel,sink111_data,
    sink111_startofpacket,sink111_endofpacket};
    assign sink112_payload = {sink112_channel,sink112_data,
    sink112_startofpacket,sink112_endofpacket};
    assign sink113_payload = {sink113_channel,sink113_data,
    sink113_startofpacket,sink113_endofpacket};
    assign sink114_payload = {sink114_channel,sink114_data,
    sink114_startofpacket,sink114_endofpacket};
    assign sink115_payload = {sink115_channel,sink115_data,
    sink115_startofpacket,sink115_endofpacket};
    assign sink116_payload = {sink116_channel,sink116_data,
    sink116_startofpacket,sink116_endofpacket};
    assign sink117_payload = {sink117_channel,sink117_data,
    sink117_startofpacket,sink117_endofpacket};
    assign sink118_payload = {sink118_channel,sink118_data,
    sink118_startofpacket,sink118_endofpacket};
    assign sink119_payload = {sink119_channel,sink119_data,
    sink119_startofpacket,sink119_endofpacket};
    assign sink120_payload = {sink120_channel,sink120_data,
    sink120_startofpacket,sink120_endofpacket};
    assign sink121_payload = {sink121_channel,sink121_data,
    sink121_startofpacket,sink121_endofpacket};
    assign sink122_payload = {sink122_channel,sink122_data,
    sink122_startofpacket,sink122_endofpacket};
    assign sink123_payload = {sink123_channel,sink123_data,
    sink123_startofpacket,sink123_endofpacket};
    assign sink124_payload = {sink124_channel,sink124_data,
    sink124_startofpacket,sink124_endofpacket};
    assign sink125_payload = {sink125_channel,sink125_data,
    sink125_startofpacket,sink125_endofpacket};
    assign sink126_payload = {sink126_channel,sink126_data,
    sink126_startofpacket,sink126_endofpacket};
    assign sink127_payload = {sink127_channel,sink127_data,
    sink127_startofpacket,sink127_endofpacket};
    assign sink128_payload = {sink128_channel,sink128_data,
    sink128_startofpacket,sink128_endofpacket};
    assign sink129_payload = {sink129_channel,sink129_data,
    sink129_startofpacket,sink129_endofpacket};
    assign sink130_payload = {sink130_channel,sink130_data,
    sink130_startofpacket,sink130_endofpacket};
    assign sink131_payload = {sink131_channel,sink131_data,
    sink131_startofpacket,sink131_endofpacket};
    assign sink132_payload = {sink132_channel,sink132_data,
    sink132_startofpacket,sink132_endofpacket};
    assign sink133_payload = {sink133_channel,sink133_data,
    sink133_startofpacket,sink133_endofpacket};
    assign sink134_payload = {sink134_channel,sink134_data,
    sink134_startofpacket,sink134_endofpacket};
    assign sink135_payload = {sink135_channel,sink135_data,
    sink135_startofpacket,sink135_endofpacket};
    assign sink136_payload = {sink136_channel,sink136_data,
    sink136_startofpacket,sink136_endofpacket};
    assign sink137_payload = {sink137_channel,sink137_data,
    sink137_startofpacket,sink137_endofpacket};
    assign sink138_payload = {sink138_channel,sink138_data,
    sink138_startofpacket,sink138_endofpacket};
    assign sink139_payload = {sink139_channel,sink139_data,
    sink139_startofpacket,sink139_endofpacket};
    assign sink140_payload = {sink140_channel,sink140_data,
    sink140_startofpacket,sink140_endofpacket};
    assign sink141_payload = {sink141_channel,sink141_data,
    sink141_startofpacket,sink141_endofpacket};

    assign {src_channel,src_data,src_startofpacket,src_endofpacket} = src_payload;
endmodule


