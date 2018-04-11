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


// $Id: //acds/rel/16.1/ip/merlin/altera_merlin_demultiplexer/altera_merlin_demultiplexer.sv.terp#1 $
// $Revision: #1 $
// $Date: 2016/08/07 $
// $Author: swbranch $

// -------------------------------------
// Merlin Demultiplexer
//
// Asserts valid on the appropriate output
// given a one-hot channel signal.
// -------------------------------------

`timescale 1 ns / 1 ns

// ------------------------------------------
// Generation parameters:
//   output_name:         testeio_mm_interconnect_0_cmd_demux
//   ST_DATA_W:           126
//   ST_CHANNEL_W:        141
//   NUM_OUTPUTS:         141
//   VALID_WIDTH:         141
// ------------------------------------------

//------------------------------------------
// Message Supression Used
// QIS Warnings
// 15610 - Warning: Design contains x input pin(s) that do not drive logic
//------------------------------------------

module testeio_mm_interconnect_0_cmd_demux
(
    // -------------------
    // Sink
    // -------------------
    input  [141-1      : 0]   sink_valid,
    input  [126-1    : 0]   sink_data, // ST_DATA_W=126
    input  [141-1 : 0]   sink_channel, // ST_CHANNEL_W=141
    input                         sink_startofpacket,
    input                         sink_endofpacket,
    output                        sink_ready,

    // -------------------
    // Sources 
    // -------------------
    output reg                      src0_valid,
    output reg [126-1    : 0] src0_data, // ST_DATA_W=126
    output reg [141-1 : 0] src0_channel, // ST_CHANNEL_W=141
    output reg                      src0_startofpacket,
    output reg                      src0_endofpacket,
    input                           src0_ready,

    output reg                      src1_valid,
    output reg [126-1    : 0] src1_data, // ST_DATA_W=126
    output reg [141-1 : 0] src1_channel, // ST_CHANNEL_W=141
    output reg                      src1_startofpacket,
    output reg                      src1_endofpacket,
    input                           src1_ready,

    output reg                      src2_valid,
    output reg [126-1    : 0] src2_data, // ST_DATA_W=126
    output reg [141-1 : 0] src2_channel, // ST_CHANNEL_W=141
    output reg                      src2_startofpacket,
    output reg                      src2_endofpacket,
    input                           src2_ready,

    output reg                      src3_valid,
    output reg [126-1    : 0] src3_data, // ST_DATA_W=126
    output reg [141-1 : 0] src3_channel, // ST_CHANNEL_W=141
    output reg                      src3_startofpacket,
    output reg                      src3_endofpacket,
    input                           src3_ready,

    output reg                      src4_valid,
    output reg [126-1    : 0] src4_data, // ST_DATA_W=126
    output reg [141-1 : 0] src4_channel, // ST_CHANNEL_W=141
    output reg                      src4_startofpacket,
    output reg                      src4_endofpacket,
    input                           src4_ready,

    output reg                      src5_valid,
    output reg [126-1    : 0] src5_data, // ST_DATA_W=126
    output reg [141-1 : 0] src5_channel, // ST_CHANNEL_W=141
    output reg                      src5_startofpacket,
    output reg                      src5_endofpacket,
    input                           src5_ready,

    output reg                      src6_valid,
    output reg [126-1    : 0] src6_data, // ST_DATA_W=126
    output reg [141-1 : 0] src6_channel, // ST_CHANNEL_W=141
    output reg                      src6_startofpacket,
    output reg                      src6_endofpacket,
    input                           src6_ready,

    output reg                      src7_valid,
    output reg [126-1    : 0] src7_data, // ST_DATA_W=126
    output reg [141-1 : 0] src7_channel, // ST_CHANNEL_W=141
    output reg                      src7_startofpacket,
    output reg                      src7_endofpacket,
    input                           src7_ready,

    output reg                      src8_valid,
    output reg [126-1    : 0] src8_data, // ST_DATA_W=126
    output reg [141-1 : 0] src8_channel, // ST_CHANNEL_W=141
    output reg                      src8_startofpacket,
    output reg                      src8_endofpacket,
    input                           src8_ready,

    output reg                      src9_valid,
    output reg [126-1    : 0] src9_data, // ST_DATA_W=126
    output reg [141-1 : 0] src9_channel, // ST_CHANNEL_W=141
    output reg                      src9_startofpacket,
    output reg                      src9_endofpacket,
    input                           src9_ready,

    output reg                      src10_valid,
    output reg [126-1    : 0] src10_data, // ST_DATA_W=126
    output reg [141-1 : 0] src10_channel, // ST_CHANNEL_W=141
    output reg                      src10_startofpacket,
    output reg                      src10_endofpacket,
    input                           src10_ready,

    output reg                      src11_valid,
    output reg [126-1    : 0] src11_data, // ST_DATA_W=126
    output reg [141-1 : 0] src11_channel, // ST_CHANNEL_W=141
    output reg                      src11_startofpacket,
    output reg                      src11_endofpacket,
    input                           src11_ready,

    output reg                      src12_valid,
    output reg [126-1    : 0] src12_data, // ST_DATA_W=126
    output reg [141-1 : 0] src12_channel, // ST_CHANNEL_W=141
    output reg                      src12_startofpacket,
    output reg                      src12_endofpacket,
    input                           src12_ready,

    output reg                      src13_valid,
    output reg [126-1    : 0] src13_data, // ST_DATA_W=126
    output reg [141-1 : 0] src13_channel, // ST_CHANNEL_W=141
    output reg                      src13_startofpacket,
    output reg                      src13_endofpacket,
    input                           src13_ready,

    output reg                      src14_valid,
    output reg [126-1    : 0] src14_data, // ST_DATA_W=126
    output reg [141-1 : 0] src14_channel, // ST_CHANNEL_W=141
    output reg                      src14_startofpacket,
    output reg                      src14_endofpacket,
    input                           src14_ready,

    output reg                      src15_valid,
    output reg [126-1    : 0] src15_data, // ST_DATA_W=126
    output reg [141-1 : 0] src15_channel, // ST_CHANNEL_W=141
    output reg                      src15_startofpacket,
    output reg                      src15_endofpacket,
    input                           src15_ready,

    output reg                      src16_valid,
    output reg [126-1    : 0] src16_data, // ST_DATA_W=126
    output reg [141-1 : 0] src16_channel, // ST_CHANNEL_W=141
    output reg                      src16_startofpacket,
    output reg                      src16_endofpacket,
    input                           src16_ready,

    output reg                      src17_valid,
    output reg [126-1    : 0] src17_data, // ST_DATA_W=126
    output reg [141-1 : 0] src17_channel, // ST_CHANNEL_W=141
    output reg                      src17_startofpacket,
    output reg                      src17_endofpacket,
    input                           src17_ready,

    output reg                      src18_valid,
    output reg [126-1    : 0] src18_data, // ST_DATA_W=126
    output reg [141-1 : 0] src18_channel, // ST_CHANNEL_W=141
    output reg                      src18_startofpacket,
    output reg                      src18_endofpacket,
    input                           src18_ready,

    output reg                      src19_valid,
    output reg [126-1    : 0] src19_data, // ST_DATA_W=126
    output reg [141-1 : 0] src19_channel, // ST_CHANNEL_W=141
    output reg                      src19_startofpacket,
    output reg                      src19_endofpacket,
    input                           src19_ready,

    output reg                      src20_valid,
    output reg [126-1    : 0] src20_data, // ST_DATA_W=126
    output reg [141-1 : 0] src20_channel, // ST_CHANNEL_W=141
    output reg                      src20_startofpacket,
    output reg                      src20_endofpacket,
    input                           src20_ready,

    output reg                      src21_valid,
    output reg [126-1    : 0] src21_data, // ST_DATA_W=126
    output reg [141-1 : 0] src21_channel, // ST_CHANNEL_W=141
    output reg                      src21_startofpacket,
    output reg                      src21_endofpacket,
    input                           src21_ready,

    output reg                      src22_valid,
    output reg [126-1    : 0] src22_data, // ST_DATA_W=126
    output reg [141-1 : 0] src22_channel, // ST_CHANNEL_W=141
    output reg                      src22_startofpacket,
    output reg                      src22_endofpacket,
    input                           src22_ready,

    output reg                      src23_valid,
    output reg [126-1    : 0] src23_data, // ST_DATA_W=126
    output reg [141-1 : 0] src23_channel, // ST_CHANNEL_W=141
    output reg                      src23_startofpacket,
    output reg                      src23_endofpacket,
    input                           src23_ready,

    output reg                      src24_valid,
    output reg [126-1    : 0] src24_data, // ST_DATA_W=126
    output reg [141-1 : 0] src24_channel, // ST_CHANNEL_W=141
    output reg                      src24_startofpacket,
    output reg                      src24_endofpacket,
    input                           src24_ready,

    output reg                      src25_valid,
    output reg [126-1    : 0] src25_data, // ST_DATA_W=126
    output reg [141-1 : 0] src25_channel, // ST_CHANNEL_W=141
    output reg                      src25_startofpacket,
    output reg                      src25_endofpacket,
    input                           src25_ready,

    output reg                      src26_valid,
    output reg [126-1    : 0] src26_data, // ST_DATA_W=126
    output reg [141-1 : 0] src26_channel, // ST_CHANNEL_W=141
    output reg                      src26_startofpacket,
    output reg                      src26_endofpacket,
    input                           src26_ready,

    output reg                      src27_valid,
    output reg [126-1    : 0] src27_data, // ST_DATA_W=126
    output reg [141-1 : 0] src27_channel, // ST_CHANNEL_W=141
    output reg                      src27_startofpacket,
    output reg                      src27_endofpacket,
    input                           src27_ready,

    output reg                      src28_valid,
    output reg [126-1    : 0] src28_data, // ST_DATA_W=126
    output reg [141-1 : 0] src28_channel, // ST_CHANNEL_W=141
    output reg                      src28_startofpacket,
    output reg                      src28_endofpacket,
    input                           src28_ready,

    output reg                      src29_valid,
    output reg [126-1    : 0] src29_data, // ST_DATA_W=126
    output reg [141-1 : 0] src29_channel, // ST_CHANNEL_W=141
    output reg                      src29_startofpacket,
    output reg                      src29_endofpacket,
    input                           src29_ready,

    output reg                      src30_valid,
    output reg [126-1    : 0] src30_data, // ST_DATA_W=126
    output reg [141-1 : 0] src30_channel, // ST_CHANNEL_W=141
    output reg                      src30_startofpacket,
    output reg                      src30_endofpacket,
    input                           src30_ready,

    output reg                      src31_valid,
    output reg [126-1    : 0] src31_data, // ST_DATA_W=126
    output reg [141-1 : 0] src31_channel, // ST_CHANNEL_W=141
    output reg                      src31_startofpacket,
    output reg                      src31_endofpacket,
    input                           src31_ready,

    output reg                      src32_valid,
    output reg [126-1    : 0] src32_data, // ST_DATA_W=126
    output reg [141-1 : 0] src32_channel, // ST_CHANNEL_W=141
    output reg                      src32_startofpacket,
    output reg                      src32_endofpacket,
    input                           src32_ready,

    output reg                      src33_valid,
    output reg [126-1    : 0] src33_data, // ST_DATA_W=126
    output reg [141-1 : 0] src33_channel, // ST_CHANNEL_W=141
    output reg                      src33_startofpacket,
    output reg                      src33_endofpacket,
    input                           src33_ready,

    output reg                      src34_valid,
    output reg [126-1    : 0] src34_data, // ST_DATA_W=126
    output reg [141-1 : 0] src34_channel, // ST_CHANNEL_W=141
    output reg                      src34_startofpacket,
    output reg                      src34_endofpacket,
    input                           src34_ready,

    output reg                      src35_valid,
    output reg [126-1    : 0] src35_data, // ST_DATA_W=126
    output reg [141-1 : 0] src35_channel, // ST_CHANNEL_W=141
    output reg                      src35_startofpacket,
    output reg                      src35_endofpacket,
    input                           src35_ready,

    output reg                      src36_valid,
    output reg [126-1    : 0] src36_data, // ST_DATA_W=126
    output reg [141-1 : 0] src36_channel, // ST_CHANNEL_W=141
    output reg                      src36_startofpacket,
    output reg                      src36_endofpacket,
    input                           src36_ready,

    output reg                      src37_valid,
    output reg [126-1    : 0] src37_data, // ST_DATA_W=126
    output reg [141-1 : 0] src37_channel, // ST_CHANNEL_W=141
    output reg                      src37_startofpacket,
    output reg                      src37_endofpacket,
    input                           src37_ready,

    output reg                      src38_valid,
    output reg [126-1    : 0] src38_data, // ST_DATA_W=126
    output reg [141-1 : 0] src38_channel, // ST_CHANNEL_W=141
    output reg                      src38_startofpacket,
    output reg                      src38_endofpacket,
    input                           src38_ready,

    output reg                      src39_valid,
    output reg [126-1    : 0] src39_data, // ST_DATA_W=126
    output reg [141-1 : 0] src39_channel, // ST_CHANNEL_W=141
    output reg                      src39_startofpacket,
    output reg                      src39_endofpacket,
    input                           src39_ready,

    output reg                      src40_valid,
    output reg [126-1    : 0] src40_data, // ST_DATA_W=126
    output reg [141-1 : 0] src40_channel, // ST_CHANNEL_W=141
    output reg                      src40_startofpacket,
    output reg                      src40_endofpacket,
    input                           src40_ready,

    output reg                      src41_valid,
    output reg [126-1    : 0] src41_data, // ST_DATA_W=126
    output reg [141-1 : 0] src41_channel, // ST_CHANNEL_W=141
    output reg                      src41_startofpacket,
    output reg                      src41_endofpacket,
    input                           src41_ready,

    output reg                      src42_valid,
    output reg [126-1    : 0] src42_data, // ST_DATA_W=126
    output reg [141-1 : 0] src42_channel, // ST_CHANNEL_W=141
    output reg                      src42_startofpacket,
    output reg                      src42_endofpacket,
    input                           src42_ready,

    output reg                      src43_valid,
    output reg [126-1    : 0] src43_data, // ST_DATA_W=126
    output reg [141-1 : 0] src43_channel, // ST_CHANNEL_W=141
    output reg                      src43_startofpacket,
    output reg                      src43_endofpacket,
    input                           src43_ready,

    output reg                      src44_valid,
    output reg [126-1    : 0] src44_data, // ST_DATA_W=126
    output reg [141-1 : 0] src44_channel, // ST_CHANNEL_W=141
    output reg                      src44_startofpacket,
    output reg                      src44_endofpacket,
    input                           src44_ready,

    output reg                      src45_valid,
    output reg [126-1    : 0] src45_data, // ST_DATA_W=126
    output reg [141-1 : 0] src45_channel, // ST_CHANNEL_W=141
    output reg                      src45_startofpacket,
    output reg                      src45_endofpacket,
    input                           src45_ready,

    output reg                      src46_valid,
    output reg [126-1    : 0] src46_data, // ST_DATA_W=126
    output reg [141-1 : 0] src46_channel, // ST_CHANNEL_W=141
    output reg                      src46_startofpacket,
    output reg                      src46_endofpacket,
    input                           src46_ready,

    output reg                      src47_valid,
    output reg [126-1    : 0] src47_data, // ST_DATA_W=126
    output reg [141-1 : 0] src47_channel, // ST_CHANNEL_W=141
    output reg                      src47_startofpacket,
    output reg                      src47_endofpacket,
    input                           src47_ready,

    output reg                      src48_valid,
    output reg [126-1    : 0] src48_data, // ST_DATA_W=126
    output reg [141-1 : 0] src48_channel, // ST_CHANNEL_W=141
    output reg                      src48_startofpacket,
    output reg                      src48_endofpacket,
    input                           src48_ready,

    output reg                      src49_valid,
    output reg [126-1    : 0] src49_data, // ST_DATA_W=126
    output reg [141-1 : 0] src49_channel, // ST_CHANNEL_W=141
    output reg                      src49_startofpacket,
    output reg                      src49_endofpacket,
    input                           src49_ready,

    output reg                      src50_valid,
    output reg [126-1    : 0] src50_data, // ST_DATA_W=126
    output reg [141-1 : 0] src50_channel, // ST_CHANNEL_W=141
    output reg                      src50_startofpacket,
    output reg                      src50_endofpacket,
    input                           src50_ready,

    output reg                      src51_valid,
    output reg [126-1    : 0] src51_data, // ST_DATA_W=126
    output reg [141-1 : 0] src51_channel, // ST_CHANNEL_W=141
    output reg                      src51_startofpacket,
    output reg                      src51_endofpacket,
    input                           src51_ready,

    output reg                      src52_valid,
    output reg [126-1    : 0] src52_data, // ST_DATA_W=126
    output reg [141-1 : 0] src52_channel, // ST_CHANNEL_W=141
    output reg                      src52_startofpacket,
    output reg                      src52_endofpacket,
    input                           src52_ready,

    output reg                      src53_valid,
    output reg [126-1    : 0] src53_data, // ST_DATA_W=126
    output reg [141-1 : 0] src53_channel, // ST_CHANNEL_W=141
    output reg                      src53_startofpacket,
    output reg                      src53_endofpacket,
    input                           src53_ready,

    output reg                      src54_valid,
    output reg [126-1    : 0] src54_data, // ST_DATA_W=126
    output reg [141-1 : 0] src54_channel, // ST_CHANNEL_W=141
    output reg                      src54_startofpacket,
    output reg                      src54_endofpacket,
    input                           src54_ready,

    output reg                      src55_valid,
    output reg [126-1    : 0] src55_data, // ST_DATA_W=126
    output reg [141-1 : 0] src55_channel, // ST_CHANNEL_W=141
    output reg                      src55_startofpacket,
    output reg                      src55_endofpacket,
    input                           src55_ready,

    output reg                      src56_valid,
    output reg [126-1    : 0] src56_data, // ST_DATA_W=126
    output reg [141-1 : 0] src56_channel, // ST_CHANNEL_W=141
    output reg                      src56_startofpacket,
    output reg                      src56_endofpacket,
    input                           src56_ready,

    output reg                      src57_valid,
    output reg [126-1    : 0] src57_data, // ST_DATA_W=126
    output reg [141-1 : 0] src57_channel, // ST_CHANNEL_W=141
    output reg                      src57_startofpacket,
    output reg                      src57_endofpacket,
    input                           src57_ready,

    output reg                      src58_valid,
    output reg [126-1    : 0] src58_data, // ST_DATA_W=126
    output reg [141-1 : 0] src58_channel, // ST_CHANNEL_W=141
    output reg                      src58_startofpacket,
    output reg                      src58_endofpacket,
    input                           src58_ready,

    output reg                      src59_valid,
    output reg [126-1    : 0] src59_data, // ST_DATA_W=126
    output reg [141-1 : 0] src59_channel, // ST_CHANNEL_W=141
    output reg                      src59_startofpacket,
    output reg                      src59_endofpacket,
    input                           src59_ready,

    output reg                      src60_valid,
    output reg [126-1    : 0] src60_data, // ST_DATA_W=126
    output reg [141-1 : 0] src60_channel, // ST_CHANNEL_W=141
    output reg                      src60_startofpacket,
    output reg                      src60_endofpacket,
    input                           src60_ready,

    output reg                      src61_valid,
    output reg [126-1    : 0] src61_data, // ST_DATA_W=126
    output reg [141-1 : 0] src61_channel, // ST_CHANNEL_W=141
    output reg                      src61_startofpacket,
    output reg                      src61_endofpacket,
    input                           src61_ready,

    output reg                      src62_valid,
    output reg [126-1    : 0] src62_data, // ST_DATA_W=126
    output reg [141-1 : 0] src62_channel, // ST_CHANNEL_W=141
    output reg                      src62_startofpacket,
    output reg                      src62_endofpacket,
    input                           src62_ready,

    output reg                      src63_valid,
    output reg [126-1    : 0] src63_data, // ST_DATA_W=126
    output reg [141-1 : 0] src63_channel, // ST_CHANNEL_W=141
    output reg                      src63_startofpacket,
    output reg                      src63_endofpacket,
    input                           src63_ready,

    output reg                      src64_valid,
    output reg [126-1    : 0] src64_data, // ST_DATA_W=126
    output reg [141-1 : 0] src64_channel, // ST_CHANNEL_W=141
    output reg                      src64_startofpacket,
    output reg                      src64_endofpacket,
    input                           src64_ready,

    output reg                      src65_valid,
    output reg [126-1    : 0] src65_data, // ST_DATA_W=126
    output reg [141-1 : 0] src65_channel, // ST_CHANNEL_W=141
    output reg                      src65_startofpacket,
    output reg                      src65_endofpacket,
    input                           src65_ready,

    output reg                      src66_valid,
    output reg [126-1    : 0] src66_data, // ST_DATA_W=126
    output reg [141-1 : 0] src66_channel, // ST_CHANNEL_W=141
    output reg                      src66_startofpacket,
    output reg                      src66_endofpacket,
    input                           src66_ready,

    output reg                      src67_valid,
    output reg [126-1    : 0] src67_data, // ST_DATA_W=126
    output reg [141-1 : 0] src67_channel, // ST_CHANNEL_W=141
    output reg                      src67_startofpacket,
    output reg                      src67_endofpacket,
    input                           src67_ready,

    output reg                      src68_valid,
    output reg [126-1    : 0] src68_data, // ST_DATA_W=126
    output reg [141-1 : 0] src68_channel, // ST_CHANNEL_W=141
    output reg                      src68_startofpacket,
    output reg                      src68_endofpacket,
    input                           src68_ready,

    output reg                      src69_valid,
    output reg [126-1    : 0] src69_data, // ST_DATA_W=126
    output reg [141-1 : 0] src69_channel, // ST_CHANNEL_W=141
    output reg                      src69_startofpacket,
    output reg                      src69_endofpacket,
    input                           src69_ready,

    output reg                      src70_valid,
    output reg [126-1    : 0] src70_data, // ST_DATA_W=126
    output reg [141-1 : 0] src70_channel, // ST_CHANNEL_W=141
    output reg                      src70_startofpacket,
    output reg                      src70_endofpacket,
    input                           src70_ready,

    output reg                      src71_valid,
    output reg [126-1    : 0] src71_data, // ST_DATA_W=126
    output reg [141-1 : 0] src71_channel, // ST_CHANNEL_W=141
    output reg                      src71_startofpacket,
    output reg                      src71_endofpacket,
    input                           src71_ready,

    output reg                      src72_valid,
    output reg [126-1    : 0] src72_data, // ST_DATA_W=126
    output reg [141-1 : 0] src72_channel, // ST_CHANNEL_W=141
    output reg                      src72_startofpacket,
    output reg                      src72_endofpacket,
    input                           src72_ready,

    output reg                      src73_valid,
    output reg [126-1    : 0] src73_data, // ST_DATA_W=126
    output reg [141-1 : 0] src73_channel, // ST_CHANNEL_W=141
    output reg                      src73_startofpacket,
    output reg                      src73_endofpacket,
    input                           src73_ready,

    output reg                      src74_valid,
    output reg [126-1    : 0] src74_data, // ST_DATA_W=126
    output reg [141-1 : 0] src74_channel, // ST_CHANNEL_W=141
    output reg                      src74_startofpacket,
    output reg                      src74_endofpacket,
    input                           src74_ready,

    output reg                      src75_valid,
    output reg [126-1    : 0] src75_data, // ST_DATA_W=126
    output reg [141-1 : 0] src75_channel, // ST_CHANNEL_W=141
    output reg                      src75_startofpacket,
    output reg                      src75_endofpacket,
    input                           src75_ready,

    output reg                      src76_valid,
    output reg [126-1    : 0] src76_data, // ST_DATA_W=126
    output reg [141-1 : 0] src76_channel, // ST_CHANNEL_W=141
    output reg                      src76_startofpacket,
    output reg                      src76_endofpacket,
    input                           src76_ready,

    output reg                      src77_valid,
    output reg [126-1    : 0] src77_data, // ST_DATA_W=126
    output reg [141-1 : 0] src77_channel, // ST_CHANNEL_W=141
    output reg                      src77_startofpacket,
    output reg                      src77_endofpacket,
    input                           src77_ready,

    output reg                      src78_valid,
    output reg [126-1    : 0] src78_data, // ST_DATA_W=126
    output reg [141-1 : 0] src78_channel, // ST_CHANNEL_W=141
    output reg                      src78_startofpacket,
    output reg                      src78_endofpacket,
    input                           src78_ready,

    output reg                      src79_valid,
    output reg [126-1    : 0] src79_data, // ST_DATA_W=126
    output reg [141-1 : 0] src79_channel, // ST_CHANNEL_W=141
    output reg                      src79_startofpacket,
    output reg                      src79_endofpacket,
    input                           src79_ready,

    output reg                      src80_valid,
    output reg [126-1    : 0] src80_data, // ST_DATA_W=126
    output reg [141-1 : 0] src80_channel, // ST_CHANNEL_W=141
    output reg                      src80_startofpacket,
    output reg                      src80_endofpacket,
    input                           src80_ready,

    output reg                      src81_valid,
    output reg [126-1    : 0] src81_data, // ST_DATA_W=126
    output reg [141-1 : 0] src81_channel, // ST_CHANNEL_W=141
    output reg                      src81_startofpacket,
    output reg                      src81_endofpacket,
    input                           src81_ready,

    output reg                      src82_valid,
    output reg [126-1    : 0] src82_data, // ST_DATA_W=126
    output reg [141-1 : 0] src82_channel, // ST_CHANNEL_W=141
    output reg                      src82_startofpacket,
    output reg                      src82_endofpacket,
    input                           src82_ready,

    output reg                      src83_valid,
    output reg [126-1    : 0] src83_data, // ST_DATA_W=126
    output reg [141-1 : 0] src83_channel, // ST_CHANNEL_W=141
    output reg                      src83_startofpacket,
    output reg                      src83_endofpacket,
    input                           src83_ready,

    output reg                      src84_valid,
    output reg [126-1    : 0] src84_data, // ST_DATA_W=126
    output reg [141-1 : 0] src84_channel, // ST_CHANNEL_W=141
    output reg                      src84_startofpacket,
    output reg                      src84_endofpacket,
    input                           src84_ready,

    output reg                      src85_valid,
    output reg [126-1    : 0] src85_data, // ST_DATA_W=126
    output reg [141-1 : 0] src85_channel, // ST_CHANNEL_W=141
    output reg                      src85_startofpacket,
    output reg                      src85_endofpacket,
    input                           src85_ready,

    output reg                      src86_valid,
    output reg [126-1    : 0] src86_data, // ST_DATA_W=126
    output reg [141-1 : 0] src86_channel, // ST_CHANNEL_W=141
    output reg                      src86_startofpacket,
    output reg                      src86_endofpacket,
    input                           src86_ready,

    output reg                      src87_valid,
    output reg [126-1    : 0] src87_data, // ST_DATA_W=126
    output reg [141-1 : 0] src87_channel, // ST_CHANNEL_W=141
    output reg                      src87_startofpacket,
    output reg                      src87_endofpacket,
    input                           src87_ready,

    output reg                      src88_valid,
    output reg [126-1    : 0] src88_data, // ST_DATA_W=126
    output reg [141-1 : 0] src88_channel, // ST_CHANNEL_W=141
    output reg                      src88_startofpacket,
    output reg                      src88_endofpacket,
    input                           src88_ready,

    output reg                      src89_valid,
    output reg [126-1    : 0] src89_data, // ST_DATA_W=126
    output reg [141-1 : 0] src89_channel, // ST_CHANNEL_W=141
    output reg                      src89_startofpacket,
    output reg                      src89_endofpacket,
    input                           src89_ready,

    output reg                      src90_valid,
    output reg [126-1    : 0] src90_data, // ST_DATA_W=126
    output reg [141-1 : 0] src90_channel, // ST_CHANNEL_W=141
    output reg                      src90_startofpacket,
    output reg                      src90_endofpacket,
    input                           src90_ready,

    output reg                      src91_valid,
    output reg [126-1    : 0] src91_data, // ST_DATA_W=126
    output reg [141-1 : 0] src91_channel, // ST_CHANNEL_W=141
    output reg                      src91_startofpacket,
    output reg                      src91_endofpacket,
    input                           src91_ready,

    output reg                      src92_valid,
    output reg [126-1    : 0] src92_data, // ST_DATA_W=126
    output reg [141-1 : 0] src92_channel, // ST_CHANNEL_W=141
    output reg                      src92_startofpacket,
    output reg                      src92_endofpacket,
    input                           src92_ready,

    output reg                      src93_valid,
    output reg [126-1    : 0] src93_data, // ST_DATA_W=126
    output reg [141-1 : 0] src93_channel, // ST_CHANNEL_W=141
    output reg                      src93_startofpacket,
    output reg                      src93_endofpacket,
    input                           src93_ready,

    output reg                      src94_valid,
    output reg [126-1    : 0] src94_data, // ST_DATA_W=126
    output reg [141-1 : 0] src94_channel, // ST_CHANNEL_W=141
    output reg                      src94_startofpacket,
    output reg                      src94_endofpacket,
    input                           src94_ready,

    output reg                      src95_valid,
    output reg [126-1    : 0] src95_data, // ST_DATA_W=126
    output reg [141-1 : 0] src95_channel, // ST_CHANNEL_W=141
    output reg                      src95_startofpacket,
    output reg                      src95_endofpacket,
    input                           src95_ready,

    output reg                      src96_valid,
    output reg [126-1    : 0] src96_data, // ST_DATA_W=126
    output reg [141-1 : 0] src96_channel, // ST_CHANNEL_W=141
    output reg                      src96_startofpacket,
    output reg                      src96_endofpacket,
    input                           src96_ready,

    output reg                      src97_valid,
    output reg [126-1    : 0] src97_data, // ST_DATA_W=126
    output reg [141-1 : 0] src97_channel, // ST_CHANNEL_W=141
    output reg                      src97_startofpacket,
    output reg                      src97_endofpacket,
    input                           src97_ready,

    output reg                      src98_valid,
    output reg [126-1    : 0] src98_data, // ST_DATA_W=126
    output reg [141-1 : 0] src98_channel, // ST_CHANNEL_W=141
    output reg                      src98_startofpacket,
    output reg                      src98_endofpacket,
    input                           src98_ready,

    output reg                      src99_valid,
    output reg [126-1    : 0] src99_data, // ST_DATA_W=126
    output reg [141-1 : 0] src99_channel, // ST_CHANNEL_W=141
    output reg                      src99_startofpacket,
    output reg                      src99_endofpacket,
    input                           src99_ready,

    output reg                      src100_valid,
    output reg [126-1    : 0] src100_data, // ST_DATA_W=126
    output reg [141-1 : 0] src100_channel, // ST_CHANNEL_W=141
    output reg                      src100_startofpacket,
    output reg                      src100_endofpacket,
    input                           src100_ready,

    output reg                      src101_valid,
    output reg [126-1    : 0] src101_data, // ST_DATA_W=126
    output reg [141-1 : 0] src101_channel, // ST_CHANNEL_W=141
    output reg                      src101_startofpacket,
    output reg                      src101_endofpacket,
    input                           src101_ready,

    output reg                      src102_valid,
    output reg [126-1    : 0] src102_data, // ST_DATA_W=126
    output reg [141-1 : 0] src102_channel, // ST_CHANNEL_W=141
    output reg                      src102_startofpacket,
    output reg                      src102_endofpacket,
    input                           src102_ready,

    output reg                      src103_valid,
    output reg [126-1    : 0] src103_data, // ST_DATA_W=126
    output reg [141-1 : 0] src103_channel, // ST_CHANNEL_W=141
    output reg                      src103_startofpacket,
    output reg                      src103_endofpacket,
    input                           src103_ready,

    output reg                      src104_valid,
    output reg [126-1    : 0] src104_data, // ST_DATA_W=126
    output reg [141-1 : 0] src104_channel, // ST_CHANNEL_W=141
    output reg                      src104_startofpacket,
    output reg                      src104_endofpacket,
    input                           src104_ready,

    output reg                      src105_valid,
    output reg [126-1    : 0] src105_data, // ST_DATA_W=126
    output reg [141-1 : 0] src105_channel, // ST_CHANNEL_W=141
    output reg                      src105_startofpacket,
    output reg                      src105_endofpacket,
    input                           src105_ready,

    output reg                      src106_valid,
    output reg [126-1    : 0] src106_data, // ST_DATA_W=126
    output reg [141-1 : 0] src106_channel, // ST_CHANNEL_W=141
    output reg                      src106_startofpacket,
    output reg                      src106_endofpacket,
    input                           src106_ready,

    output reg                      src107_valid,
    output reg [126-1    : 0] src107_data, // ST_DATA_W=126
    output reg [141-1 : 0] src107_channel, // ST_CHANNEL_W=141
    output reg                      src107_startofpacket,
    output reg                      src107_endofpacket,
    input                           src107_ready,

    output reg                      src108_valid,
    output reg [126-1    : 0] src108_data, // ST_DATA_W=126
    output reg [141-1 : 0] src108_channel, // ST_CHANNEL_W=141
    output reg                      src108_startofpacket,
    output reg                      src108_endofpacket,
    input                           src108_ready,

    output reg                      src109_valid,
    output reg [126-1    : 0] src109_data, // ST_DATA_W=126
    output reg [141-1 : 0] src109_channel, // ST_CHANNEL_W=141
    output reg                      src109_startofpacket,
    output reg                      src109_endofpacket,
    input                           src109_ready,

    output reg                      src110_valid,
    output reg [126-1    : 0] src110_data, // ST_DATA_W=126
    output reg [141-1 : 0] src110_channel, // ST_CHANNEL_W=141
    output reg                      src110_startofpacket,
    output reg                      src110_endofpacket,
    input                           src110_ready,

    output reg                      src111_valid,
    output reg [126-1    : 0] src111_data, // ST_DATA_W=126
    output reg [141-1 : 0] src111_channel, // ST_CHANNEL_W=141
    output reg                      src111_startofpacket,
    output reg                      src111_endofpacket,
    input                           src111_ready,

    output reg                      src112_valid,
    output reg [126-1    : 0] src112_data, // ST_DATA_W=126
    output reg [141-1 : 0] src112_channel, // ST_CHANNEL_W=141
    output reg                      src112_startofpacket,
    output reg                      src112_endofpacket,
    input                           src112_ready,

    output reg                      src113_valid,
    output reg [126-1    : 0] src113_data, // ST_DATA_W=126
    output reg [141-1 : 0] src113_channel, // ST_CHANNEL_W=141
    output reg                      src113_startofpacket,
    output reg                      src113_endofpacket,
    input                           src113_ready,

    output reg                      src114_valid,
    output reg [126-1    : 0] src114_data, // ST_DATA_W=126
    output reg [141-1 : 0] src114_channel, // ST_CHANNEL_W=141
    output reg                      src114_startofpacket,
    output reg                      src114_endofpacket,
    input                           src114_ready,

    output reg                      src115_valid,
    output reg [126-1    : 0] src115_data, // ST_DATA_W=126
    output reg [141-1 : 0] src115_channel, // ST_CHANNEL_W=141
    output reg                      src115_startofpacket,
    output reg                      src115_endofpacket,
    input                           src115_ready,

    output reg                      src116_valid,
    output reg [126-1    : 0] src116_data, // ST_DATA_W=126
    output reg [141-1 : 0] src116_channel, // ST_CHANNEL_W=141
    output reg                      src116_startofpacket,
    output reg                      src116_endofpacket,
    input                           src116_ready,

    output reg                      src117_valid,
    output reg [126-1    : 0] src117_data, // ST_DATA_W=126
    output reg [141-1 : 0] src117_channel, // ST_CHANNEL_W=141
    output reg                      src117_startofpacket,
    output reg                      src117_endofpacket,
    input                           src117_ready,

    output reg                      src118_valid,
    output reg [126-1    : 0] src118_data, // ST_DATA_W=126
    output reg [141-1 : 0] src118_channel, // ST_CHANNEL_W=141
    output reg                      src118_startofpacket,
    output reg                      src118_endofpacket,
    input                           src118_ready,

    output reg                      src119_valid,
    output reg [126-1    : 0] src119_data, // ST_DATA_W=126
    output reg [141-1 : 0] src119_channel, // ST_CHANNEL_W=141
    output reg                      src119_startofpacket,
    output reg                      src119_endofpacket,
    input                           src119_ready,

    output reg                      src120_valid,
    output reg [126-1    : 0] src120_data, // ST_DATA_W=126
    output reg [141-1 : 0] src120_channel, // ST_CHANNEL_W=141
    output reg                      src120_startofpacket,
    output reg                      src120_endofpacket,
    input                           src120_ready,

    output reg                      src121_valid,
    output reg [126-1    : 0] src121_data, // ST_DATA_W=126
    output reg [141-1 : 0] src121_channel, // ST_CHANNEL_W=141
    output reg                      src121_startofpacket,
    output reg                      src121_endofpacket,
    input                           src121_ready,

    output reg                      src122_valid,
    output reg [126-1    : 0] src122_data, // ST_DATA_W=126
    output reg [141-1 : 0] src122_channel, // ST_CHANNEL_W=141
    output reg                      src122_startofpacket,
    output reg                      src122_endofpacket,
    input                           src122_ready,

    output reg                      src123_valid,
    output reg [126-1    : 0] src123_data, // ST_DATA_W=126
    output reg [141-1 : 0] src123_channel, // ST_CHANNEL_W=141
    output reg                      src123_startofpacket,
    output reg                      src123_endofpacket,
    input                           src123_ready,

    output reg                      src124_valid,
    output reg [126-1    : 0] src124_data, // ST_DATA_W=126
    output reg [141-1 : 0] src124_channel, // ST_CHANNEL_W=141
    output reg                      src124_startofpacket,
    output reg                      src124_endofpacket,
    input                           src124_ready,

    output reg                      src125_valid,
    output reg [126-1    : 0] src125_data, // ST_DATA_W=126
    output reg [141-1 : 0] src125_channel, // ST_CHANNEL_W=141
    output reg                      src125_startofpacket,
    output reg                      src125_endofpacket,
    input                           src125_ready,

    output reg                      src126_valid,
    output reg [126-1    : 0] src126_data, // ST_DATA_W=126
    output reg [141-1 : 0] src126_channel, // ST_CHANNEL_W=141
    output reg                      src126_startofpacket,
    output reg                      src126_endofpacket,
    input                           src126_ready,

    output reg                      src127_valid,
    output reg [126-1    : 0] src127_data, // ST_DATA_W=126
    output reg [141-1 : 0] src127_channel, // ST_CHANNEL_W=141
    output reg                      src127_startofpacket,
    output reg                      src127_endofpacket,
    input                           src127_ready,

    output reg                      src128_valid,
    output reg [126-1    : 0] src128_data, // ST_DATA_W=126
    output reg [141-1 : 0] src128_channel, // ST_CHANNEL_W=141
    output reg                      src128_startofpacket,
    output reg                      src128_endofpacket,
    input                           src128_ready,

    output reg                      src129_valid,
    output reg [126-1    : 0] src129_data, // ST_DATA_W=126
    output reg [141-1 : 0] src129_channel, // ST_CHANNEL_W=141
    output reg                      src129_startofpacket,
    output reg                      src129_endofpacket,
    input                           src129_ready,

    output reg                      src130_valid,
    output reg [126-1    : 0] src130_data, // ST_DATA_W=126
    output reg [141-1 : 0] src130_channel, // ST_CHANNEL_W=141
    output reg                      src130_startofpacket,
    output reg                      src130_endofpacket,
    input                           src130_ready,

    output reg                      src131_valid,
    output reg [126-1    : 0] src131_data, // ST_DATA_W=126
    output reg [141-1 : 0] src131_channel, // ST_CHANNEL_W=141
    output reg                      src131_startofpacket,
    output reg                      src131_endofpacket,
    input                           src131_ready,

    output reg                      src132_valid,
    output reg [126-1    : 0] src132_data, // ST_DATA_W=126
    output reg [141-1 : 0] src132_channel, // ST_CHANNEL_W=141
    output reg                      src132_startofpacket,
    output reg                      src132_endofpacket,
    input                           src132_ready,

    output reg                      src133_valid,
    output reg [126-1    : 0] src133_data, // ST_DATA_W=126
    output reg [141-1 : 0] src133_channel, // ST_CHANNEL_W=141
    output reg                      src133_startofpacket,
    output reg                      src133_endofpacket,
    input                           src133_ready,

    output reg                      src134_valid,
    output reg [126-1    : 0] src134_data, // ST_DATA_W=126
    output reg [141-1 : 0] src134_channel, // ST_CHANNEL_W=141
    output reg                      src134_startofpacket,
    output reg                      src134_endofpacket,
    input                           src134_ready,

    output reg                      src135_valid,
    output reg [126-1    : 0] src135_data, // ST_DATA_W=126
    output reg [141-1 : 0] src135_channel, // ST_CHANNEL_W=141
    output reg                      src135_startofpacket,
    output reg                      src135_endofpacket,
    input                           src135_ready,

    output reg                      src136_valid,
    output reg [126-1    : 0] src136_data, // ST_DATA_W=126
    output reg [141-1 : 0] src136_channel, // ST_CHANNEL_W=141
    output reg                      src136_startofpacket,
    output reg                      src136_endofpacket,
    input                           src136_ready,

    output reg                      src137_valid,
    output reg [126-1    : 0] src137_data, // ST_DATA_W=126
    output reg [141-1 : 0] src137_channel, // ST_CHANNEL_W=141
    output reg                      src137_startofpacket,
    output reg                      src137_endofpacket,
    input                           src137_ready,

    output reg                      src138_valid,
    output reg [126-1    : 0] src138_data, // ST_DATA_W=126
    output reg [141-1 : 0] src138_channel, // ST_CHANNEL_W=141
    output reg                      src138_startofpacket,
    output reg                      src138_endofpacket,
    input                           src138_ready,

    output reg                      src139_valid,
    output reg [126-1    : 0] src139_data, // ST_DATA_W=126
    output reg [141-1 : 0] src139_channel, // ST_CHANNEL_W=141
    output reg                      src139_startofpacket,
    output reg                      src139_endofpacket,
    input                           src139_ready,

    output reg                      src140_valid,
    output reg [126-1    : 0] src140_data, // ST_DATA_W=126
    output reg [141-1 : 0] src140_channel, // ST_CHANNEL_W=141
    output reg                      src140_startofpacket,
    output reg                      src140_endofpacket,
    input                           src140_ready,


    // -------------------
    // Clock & Reset
    // -------------------
    (*altera_attribute = "-name MESSAGE_DISABLE 15610" *) // setting message suppression on clk
    input clk,
    (*altera_attribute = "-name MESSAGE_DISABLE 15610" *) // setting message suppression on reset
    input reset

);

    localparam NUM_OUTPUTS = 141;
    wire [NUM_OUTPUTS - 1 : 0] ready_vector;

    // -------------------
    // Demux
    // -------------------
    always @* begin
        src0_data          = sink_data;
        src0_startofpacket = sink_startofpacket;
        src0_endofpacket   = sink_endofpacket;
        src0_channel       = sink_channel >> NUM_OUTPUTS;

        src0_valid         = sink_channel[0] && sink_valid[0];

        src1_data          = sink_data;
        src1_startofpacket = sink_startofpacket;
        src1_endofpacket   = sink_endofpacket;
        src1_channel       = sink_channel >> NUM_OUTPUTS;

        src1_valid         = sink_channel[1] && sink_valid[1];

        src2_data          = sink_data;
        src2_startofpacket = sink_startofpacket;
        src2_endofpacket   = sink_endofpacket;
        src2_channel       = sink_channel >> NUM_OUTPUTS;

        src2_valid         = sink_channel[2] && sink_valid[2];

        src3_data          = sink_data;
        src3_startofpacket = sink_startofpacket;
        src3_endofpacket   = sink_endofpacket;
        src3_channel       = sink_channel >> NUM_OUTPUTS;

        src3_valid         = sink_channel[3] && sink_valid[3];

        src4_data          = sink_data;
        src4_startofpacket = sink_startofpacket;
        src4_endofpacket   = sink_endofpacket;
        src4_channel       = sink_channel >> NUM_OUTPUTS;

        src4_valid         = sink_channel[4] && sink_valid[4];

        src5_data          = sink_data;
        src5_startofpacket = sink_startofpacket;
        src5_endofpacket   = sink_endofpacket;
        src5_channel       = sink_channel >> NUM_OUTPUTS;

        src5_valid         = sink_channel[5] && sink_valid[5];

        src6_data          = sink_data;
        src6_startofpacket = sink_startofpacket;
        src6_endofpacket   = sink_endofpacket;
        src6_channel       = sink_channel >> NUM_OUTPUTS;

        src6_valid         = sink_channel[6] && sink_valid[6];

        src7_data          = sink_data;
        src7_startofpacket = sink_startofpacket;
        src7_endofpacket   = sink_endofpacket;
        src7_channel       = sink_channel >> NUM_OUTPUTS;

        src7_valid         = sink_channel[7] && sink_valid[7];

        src8_data          = sink_data;
        src8_startofpacket = sink_startofpacket;
        src8_endofpacket   = sink_endofpacket;
        src8_channel       = sink_channel >> NUM_OUTPUTS;

        src8_valid         = sink_channel[8] && sink_valid[8];

        src9_data          = sink_data;
        src9_startofpacket = sink_startofpacket;
        src9_endofpacket   = sink_endofpacket;
        src9_channel       = sink_channel >> NUM_OUTPUTS;

        src9_valid         = sink_channel[9] && sink_valid[9];

        src10_data          = sink_data;
        src10_startofpacket = sink_startofpacket;
        src10_endofpacket   = sink_endofpacket;
        src10_channel       = sink_channel >> NUM_OUTPUTS;

        src10_valid         = sink_channel[10] && sink_valid[10];

        src11_data          = sink_data;
        src11_startofpacket = sink_startofpacket;
        src11_endofpacket   = sink_endofpacket;
        src11_channel       = sink_channel >> NUM_OUTPUTS;

        src11_valid         = sink_channel[11] && sink_valid[11];

        src12_data          = sink_data;
        src12_startofpacket = sink_startofpacket;
        src12_endofpacket   = sink_endofpacket;
        src12_channel       = sink_channel >> NUM_OUTPUTS;

        src12_valid         = sink_channel[12] && sink_valid[12];

        src13_data          = sink_data;
        src13_startofpacket = sink_startofpacket;
        src13_endofpacket   = sink_endofpacket;
        src13_channel       = sink_channel >> NUM_OUTPUTS;

        src13_valid         = sink_channel[13] && sink_valid[13];

        src14_data          = sink_data;
        src14_startofpacket = sink_startofpacket;
        src14_endofpacket   = sink_endofpacket;
        src14_channel       = sink_channel >> NUM_OUTPUTS;

        src14_valid         = sink_channel[14] && sink_valid[14];

        src15_data          = sink_data;
        src15_startofpacket = sink_startofpacket;
        src15_endofpacket   = sink_endofpacket;
        src15_channel       = sink_channel >> NUM_OUTPUTS;

        src15_valid         = sink_channel[15] && sink_valid[15];

        src16_data          = sink_data;
        src16_startofpacket = sink_startofpacket;
        src16_endofpacket   = sink_endofpacket;
        src16_channel       = sink_channel >> NUM_OUTPUTS;

        src16_valid         = sink_channel[16] && sink_valid[16];

        src17_data          = sink_data;
        src17_startofpacket = sink_startofpacket;
        src17_endofpacket   = sink_endofpacket;
        src17_channel       = sink_channel >> NUM_OUTPUTS;

        src17_valid         = sink_channel[17] && sink_valid[17];

        src18_data          = sink_data;
        src18_startofpacket = sink_startofpacket;
        src18_endofpacket   = sink_endofpacket;
        src18_channel       = sink_channel >> NUM_OUTPUTS;

        src18_valid         = sink_channel[18] && sink_valid[18];

        src19_data          = sink_data;
        src19_startofpacket = sink_startofpacket;
        src19_endofpacket   = sink_endofpacket;
        src19_channel       = sink_channel >> NUM_OUTPUTS;

        src19_valid         = sink_channel[19] && sink_valid[19];

        src20_data          = sink_data;
        src20_startofpacket = sink_startofpacket;
        src20_endofpacket   = sink_endofpacket;
        src20_channel       = sink_channel >> NUM_OUTPUTS;

        src20_valid         = sink_channel[20] && sink_valid[20];

        src21_data          = sink_data;
        src21_startofpacket = sink_startofpacket;
        src21_endofpacket   = sink_endofpacket;
        src21_channel       = sink_channel >> NUM_OUTPUTS;

        src21_valid         = sink_channel[21] && sink_valid[21];

        src22_data          = sink_data;
        src22_startofpacket = sink_startofpacket;
        src22_endofpacket   = sink_endofpacket;
        src22_channel       = sink_channel >> NUM_OUTPUTS;

        src22_valid         = sink_channel[22] && sink_valid[22];

        src23_data          = sink_data;
        src23_startofpacket = sink_startofpacket;
        src23_endofpacket   = sink_endofpacket;
        src23_channel       = sink_channel >> NUM_OUTPUTS;

        src23_valid         = sink_channel[23] && sink_valid[23];

        src24_data          = sink_data;
        src24_startofpacket = sink_startofpacket;
        src24_endofpacket   = sink_endofpacket;
        src24_channel       = sink_channel >> NUM_OUTPUTS;

        src24_valid         = sink_channel[24] && sink_valid[24];

        src25_data          = sink_data;
        src25_startofpacket = sink_startofpacket;
        src25_endofpacket   = sink_endofpacket;
        src25_channel       = sink_channel >> NUM_OUTPUTS;

        src25_valid         = sink_channel[25] && sink_valid[25];

        src26_data          = sink_data;
        src26_startofpacket = sink_startofpacket;
        src26_endofpacket   = sink_endofpacket;
        src26_channel       = sink_channel >> NUM_OUTPUTS;

        src26_valid         = sink_channel[26] && sink_valid[26];

        src27_data          = sink_data;
        src27_startofpacket = sink_startofpacket;
        src27_endofpacket   = sink_endofpacket;
        src27_channel       = sink_channel >> NUM_OUTPUTS;

        src27_valid         = sink_channel[27] && sink_valid[27];

        src28_data          = sink_data;
        src28_startofpacket = sink_startofpacket;
        src28_endofpacket   = sink_endofpacket;
        src28_channel       = sink_channel >> NUM_OUTPUTS;

        src28_valid         = sink_channel[28] && sink_valid[28];

        src29_data          = sink_data;
        src29_startofpacket = sink_startofpacket;
        src29_endofpacket   = sink_endofpacket;
        src29_channel       = sink_channel >> NUM_OUTPUTS;

        src29_valid         = sink_channel[29] && sink_valid[29];

        src30_data          = sink_data;
        src30_startofpacket = sink_startofpacket;
        src30_endofpacket   = sink_endofpacket;
        src30_channel       = sink_channel >> NUM_OUTPUTS;

        src30_valid         = sink_channel[30] && sink_valid[30];

        src31_data          = sink_data;
        src31_startofpacket = sink_startofpacket;
        src31_endofpacket   = sink_endofpacket;
        src31_channel       = sink_channel >> NUM_OUTPUTS;

        src31_valid         = sink_channel[31] && sink_valid[31];

        src32_data          = sink_data;
        src32_startofpacket = sink_startofpacket;
        src32_endofpacket   = sink_endofpacket;
        src32_channel       = sink_channel >> NUM_OUTPUTS;

        src32_valid         = sink_channel[32] && sink_valid[32];

        src33_data          = sink_data;
        src33_startofpacket = sink_startofpacket;
        src33_endofpacket   = sink_endofpacket;
        src33_channel       = sink_channel >> NUM_OUTPUTS;

        src33_valid         = sink_channel[33] && sink_valid[33];

        src34_data          = sink_data;
        src34_startofpacket = sink_startofpacket;
        src34_endofpacket   = sink_endofpacket;
        src34_channel       = sink_channel >> NUM_OUTPUTS;

        src34_valid         = sink_channel[34] && sink_valid[34];

        src35_data          = sink_data;
        src35_startofpacket = sink_startofpacket;
        src35_endofpacket   = sink_endofpacket;
        src35_channel       = sink_channel >> NUM_OUTPUTS;

        src35_valid         = sink_channel[35] && sink_valid[35];

        src36_data          = sink_data;
        src36_startofpacket = sink_startofpacket;
        src36_endofpacket   = sink_endofpacket;
        src36_channel       = sink_channel >> NUM_OUTPUTS;

        src36_valid         = sink_channel[36] && sink_valid[36];

        src37_data          = sink_data;
        src37_startofpacket = sink_startofpacket;
        src37_endofpacket   = sink_endofpacket;
        src37_channel       = sink_channel >> NUM_OUTPUTS;

        src37_valid         = sink_channel[37] && sink_valid[37];

        src38_data          = sink_data;
        src38_startofpacket = sink_startofpacket;
        src38_endofpacket   = sink_endofpacket;
        src38_channel       = sink_channel >> NUM_OUTPUTS;

        src38_valid         = sink_channel[38] && sink_valid[38];

        src39_data          = sink_data;
        src39_startofpacket = sink_startofpacket;
        src39_endofpacket   = sink_endofpacket;
        src39_channel       = sink_channel >> NUM_OUTPUTS;

        src39_valid         = sink_channel[39] && sink_valid[39];

        src40_data          = sink_data;
        src40_startofpacket = sink_startofpacket;
        src40_endofpacket   = sink_endofpacket;
        src40_channel       = sink_channel >> NUM_OUTPUTS;

        src40_valid         = sink_channel[40] && sink_valid[40];

        src41_data          = sink_data;
        src41_startofpacket = sink_startofpacket;
        src41_endofpacket   = sink_endofpacket;
        src41_channel       = sink_channel >> NUM_OUTPUTS;

        src41_valid         = sink_channel[41] && sink_valid[41];

        src42_data          = sink_data;
        src42_startofpacket = sink_startofpacket;
        src42_endofpacket   = sink_endofpacket;
        src42_channel       = sink_channel >> NUM_OUTPUTS;

        src42_valid         = sink_channel[42] && sink_valid[42];

        src43_data          = sink_data;
        src43_startofpacket = sink_startofpacket;
        src43_endofpacket   = sink_endofpacket;
        src43_channel       = sink_channel >> NUM_OUTPUTS;

        src43_valid         = sink_channel[43] && sink_valid[43];

        src44_data          = sink_data;
        src44_startofpacket = sink_startofpacket;
        src44_endofpacket   = sink_endofpacket;
        src44_channel       = sink_channel >> NUM_OUTPUTS;

        src44_valid         = sink_channel[44] && sink_valid[44];

        src45_data          = sink_data;
        src45_startofpacket = sink_startofpacket;
        src45_endofpacket   = sink_endofpacket;
        src45_channel       = sink_channel >> NUM_OUTPUTS;

        src45_valid         = sink_channel[45] && sink_valid[45];

        src46_data          = sink_data;
        src46_startofpacket = sink_startofpacket;
        src46_endofpacket   = sink_endofpacket;
        src46_channel       = sink_channel >> NUM_OUTPUTS;

        src46_valid         = sink_channel[46] && sink_valid[46];

        src47_data          = sink_data;
        src47_startofpacket = sink_startofpacket;
        src47_endofpacket   = sink_endofpacket;
        src47_channel       = sink_channel >> NUM_OUTPUTS;

        src47_valid         = sink_channel[47] && sink_valid[47];

        src48_data          = sink_data;
        src48_startofpacket = sink_startofpacket;
        src48_endofpacket   = sink_endofpacket;
        src48_channel       = sink_channel >> NUM_OUTPUTS;

        src48_valid         = sink_channel[48] && sink_valid[48];

        src49_data          = sink_data;
        src49_startofpacket = sink_startofpacket;
        src49_endofpacket   = sink_endofpacket;
        src49_channel       = sink_channel >> NUM_OUTPUTS;

        src49_valid         = sink_channel[49] && sink_valid[49];

        src50_data          = sink_data;
        src50_startofpacket = sink_startofpacket;
        src50_endofpacket   = sink_endofpacket;
        src50_channel       = sink_channel >> NUM_OUTPUTS;

        src50_valid         = sink_channel[50] && sink_valid[50];

        src51_data          = sink_data;
        src51_startofpacket = sink_startofpacket;
        src51_endofpacket   = sink_endofpacket;
        src51_channel       = sink_channel >> NUM_OUTPUTS;

        src51_valid         = sink_channel[51] && sink_valid[51];

        src52_data          = sink_data;
        src52_startofpacket = sink_startofpacket;
        src52_endofpacket   = sink_endofpacket;
        src52_channel       = sink_channel >> NUM_OUTPUTS;

        src52_valid         = sink_channel[52] && sink_valid[52];

        src53_data          = sink_data;
        src53_startofpacket = sink_startofpacket;
        src53_endofpacket   = sink_endofpacket;
        src53_channel       = sink_channel >> NUM_OUTPUTS;

        src53_valid         = sink_channel[53] && sink_valid[53];

        src54_data          = sink_data;
        src54_startofpacket = sink_startofpacket;
        src54_endofpacket   = sink_endofpacket;
        src54_channel       = sink_channel >> NUM_OUTPUTS;

        src54_valid         = sink_channel[54] && sink_valid[54];

        src55_data          = sink_data;
        src55_startofpacket = sink_startofpacket;
        src55_endofpacket   = sink_endofpacket;
        src55_channel       = sink_channel >> NUM_OUTPUTS;

        src55_valid         = sink_channel[55] && sink_valid[55];

        src56_data          = sink_data;
        src56_startofpacket = sink_startofpacket;
        src56_endofpacket   = sink_endofpacket;
        src56_channel       = sink_channel >> NUM_OUTPUTS;

        src56_valid         = sink_channel[56] && sink_valid[56];

        src57_data          = sink_data;
        src57_startofpacket = sink_startofpacket;
        src57_endofpacket   = sink_endofpacket;
        src57_channel       = sink_channel >> NUM_OUTPUTS;

        src57_valid         = sink_channel[57] && sink_valid[57];

        src58_data          = sink_data;
        src58_startofpacket = sink_startofpacket;
        src58_endofpacket   = sink_endofpacket;
        src58_channel       = sink_channel >> NUM_OUTPUTS;

        src58_valid         = sink_channel[58] && sink_valid[58];

        src59_data          = sink_data;
        src59_startofpacket = sink_startofpacket;
        src59_endofpacket   = sink_endofpacket;
        src59_channel       = sink_channel >> NUM_OUTPUTS;

        src59_valid         = sink_channel[59] && sink_valid[59];

        src60_data          = sink_data;
        src60_startofpacket = sink_startofpacket;
        src60_endofpacket   = sink_endofpacket;
        src60_channel       = sink_channel >> NUM_OUTPUTS;

        src60_valid         = sink_channel[60] && sink_valid[60];

        src61_data          = sink_data;
        src61_startofpacket = sink_startofpacket;
        src61_endofpacket   = sink_endofpacket;
        src61_channel       = sink_channel >> NUM_OUTPUTS;

        src61_valid         = sink_channel[61] && sink_valid[61];

        src62_data          = sink_data;
        src62_startofpacket = sink_startofpacket;
        src62_endofpacket   = sink_endofpacket;
        src62_channel       = sink_channel >> NUM_OUTPUTS;

        src62_valid         = sink_channel[62] && sink_valid[62];

        src63_data          = sink_data;
        src63_startofpacket = sink_startofpacket;
        src63_endofpacket   = sink_endofpacket;
        src63_channel       = sink_channel >> NUM_OUTPUTS;

        src63_valid         = sink_channel[63] && sink_valid[63];

        src64_data          = sink_data;
        src64_startofpacket = sink_startofpacket;
        src64_endofpacket   = sink_endofpacket;
        src64_channel       = sink_channel >> NUM_OUTPUTS;

        src64_valid         = sink_channel[64] && sink_valid[64];

        src65_data          = sink_data;
        src65_startofpacket = sink_startofpacket;
        src65_endofpacket   = sink_endofpacket;
        src65_channel       = sink_channel >> NUM_OUTPUTS;

        src65_valid         = sink_channel[65] && sink_valid[65];

        src66_data          = sink_data;
        src66_startofpacket = sink_startofpacket;
        src66_endofpacket   = sink_endofpacket;
        src66_channel       = sink_channel >> NUM_OUTPUTS;

        src66_valid         = sink_channel[66] && sink_valid[66];

        src67_data          = sink_data;
        src67_startofpacket = sink_startofpacket;
        src67_endofpacket   = sink_endofpacket;
        src67_channel       = sink_channel >> NUM_OUTPUTS;

        src67_valid         = sink_channel[67] && sink_valid[67];

        src68_data          = sink_data;
        src68_startofpacket = sink_startofpacket;
        src68_endofpacket   = sink_endofpacket;
        src68_channel       = sink_channel >> NUM_OUTPUTS;

        src68_valid         = sink_channel[68] && sink_valid[68];

        src69_data          = sink_data;
        src69_startofpacket = sink_startofpacket;
        src69_endofpacket   = sink_endofpacket;
        src69_channel       = sink_channel >> NUM_OUTPUTS;

        src69_valid         = sink_channel[69] && sink_valid[69];

        src70_data          = sink_data;
        src70_startofpacket = sink_startofpacket;
        src70_endofpacket   = sink_endofpacket;
        src70_channel       = sink_channel >> NUM_OUTPUTS;

        src70_valid         = sink_channel[70] && sink_valid[70];

        src71_data          = sink_data;
        src71_startofpacket = sink_startofpacket;
        src71_endofpacket   = sink_endofpacket;
        src71_channel       = sink_channel >> NUM_OUTPUTS;

        src71_valid         = sink_channel[71] && sink_valid[71];

        src72_data          = sink_data;
        src72_startofpacket = sink_startofpacket;
        src72_endofpacket   = sink_endofpacket;
        src72_channel       = sink_channel >> NUM_OUTPUTS;

        src72_valid         = sink_channel[72] && sink_valid[72];

        src73_data          = sink_data;
        src73_startofpacket = sink_startofpacket;
        src73_endofpacket   = sink_endofpacket;
        src73_channel       = sink_channel >> NUM_OUTPUTS;

        src73_valid         = sink_channel[73] && sink_valid[73];

        src74_data          = sink_data;
        src74_startofpacket = sink_startofpacket;
        src74_endofpacket   = sink_endofpacket;
        src74_channel       = sink_channel >> NUM_OUTPUTS;

        src74_valid         = sink_channel[74] && sink_valid[74];

        src75_data          = sink_data;
        src75_startofpacket = sink_startofpacket;
        src75_endofpacket   = sink_endofpacket;
        src75_channel       = sink_channel >> NUM_OUTPUTS;

        src75_valid         = sink_channel[75] && sink_valid[75];

        src76_data          = sink_data;
        src76_startofpacket = sink_startofpacket;
        src76_endofpacket   = sink_endofpacket;
        src76_channel       = sink_channel >> NUM_OUTPUTS;

        src76_valid         = sink_channel[76] && sink_valid[76];

        src77_data          = sink_data;
        src77_startofpacket = sink_startofpacket;
        src77_endofpacket   = sink_endofpacket;
        src77_channel       = sink_channel >> NUM_OUTPUTS;

        src77_valid         = sink_channel[77] && sink_valid[77];

        src78_data          = sink_data;
        src78_startofpacket = sink_startofpacket;
        src78_endofpacket   = sink_endofpacket;
        src78_channel       = sink_channel >> NUM_OUTPUTS;

        src78_valid         = sink_channel[78] && sink_valid[78];

        src79_data          = sink_data;
        src79_startofpacket = sink_startofpacket;
        src79_endofpacket   = sink_endofpacket;
        src79_channel       = sink_channel >> NUM_OUTPUTS;

        src79_valid         = sink_channel[79] && sink_valid[79];

        src80_data          = sink_data;
        src80_startofpacket = sink_startofpacket;
        src80_endofpacket   = sink_endofpacket;
        src80_channel       = sink_channel >> NUM_OUTPUTS;

        src80_valid         = sink_channel[80] && sink_valid[80];

        src81_data          = sink_data;
        src81_startofpacket = sink_startofpacket;
        src81_endofpacket   = sink_endofpacket;
        src81_channel       = sink_channel >> NUM_OUTPUTS;

        src81_valid         = sink_channel[81] && sink_valid[81];

        src82_data          = sink_data;
        src82_startofpacket = sink_startofpacket;
        src82_endofpacket   = sink_endofpacket;
        src82_channel       = sink_channel >> NUM_OUTPUTS;

        src82_valid         = sink_channel[82] && sink_valid[82];

        src83_data          = sink_data;
        src83_startofpacket = sink_startofpacket;
        src83_endofpacket   = sink_endofpacket;
        src83_channel       = sink_channel >> NUM_OUTPUTS;

        src83_valid         = sink_channel[83] && sink_valid[83];

        src84_data          = sink_data;
        src84_startofpacket = sink_startofpacket;
        src84_endofpacket   = sink_endofpacket;
        src84_channel       = sink_channel >> NUM_OUTPUTS;

        src84_valid         = sink_channel[84] && sink_valid[84];

        src85_data          = sink_data;
        src85_startofpacket = sink_startofpacket;
        src85_endofpacket   = sink_endofpacket;
        src85_channel       = sink_channel >> NUM_OUTPUTS;

        src85_valid         = sink_channel[85] && sink_valid[85];

        src86_data          = sink_data;
        src86_startofpacket = sink_startofpacket;
        src86_endofpacket   = sink_endofpacket;
        src86_channel       = sink_channel >> NUM_OUTPUTS;

        src86_valid         = sink_channel[86] && sink_valid[86];

        src87_data          = sink_data;
        src87_startofpacket = sink_startofpacket;
        src87_endofpacket   = sink_endofpacket;
        src87_channel       = sink_channel >> NUM_OUTPUTS;

        src87_valid         = sink_channel[87] && sink_valid[87];

        src88_data          = sink_data;
        src88_startofpacket = sink_startofpacket;
        src88_endofpacket   = sink_endofpacket;
        src88_channel       = sink_channel >> NUM_OUTPUTS;

        src88_valid         = sink_channel[88] && sink_valid[88];

        src89_data          = sink_data;
        src89_startofpacket = sink_startofpacket;
        src89_endofpacket   = sink_endofpacket;
        src89_channel       = sink_channel >> NUM_OUTPUTS;

        src89_valid         = sink_channel[89] && sink_valid[89];

        src90_data          = sink_data;
        src90_startofpacket = sink_startofpacket;
        src90_endofpacket   = sink_endofpacket;
        src90_channel       = sink_channel >> NUM_OUTPUTS;

        src90_valid         = sink_channel[90] && sink_valid[90];

        src91_data          = sink_data;
        src91_startofpacket = sink_startofpacket;
        src91_endofpacket   = sink_endofpacket;
        src91_channel       = sink_channel >> NUM_OUTPUTS;

        src91_valid         = sink_channel[91] && sink_valid[91];

        src92_data          = sink_data;
        src92_startofpacket = sink_startofpacket;
        src92_endofpacket   = sink_endofpacket;
        src92_channel       = sink_channel >> NUM_OUTPUTS;

        src92_valid         = sink_channel[92] && sink_valid[92];

        src93_data          = sink_data;
        src93_startofpacket = sink_startofpacket;
        src93_endofpacket   = sink_endofpacket;
        src93_channel       = sink_channel >> NUM_OUTPUTS;

        src93_valid         = sink_channel[93] && sink_valid[93];

        src94_data          = sink_data;
        src94_startofpacket = sink_startofpacket;
        src94_endofpacket   = sink_endofpacket;
        src94_channel       = sink_channel >> NUM_OUTPUTS;

        src94_valid         = sink_channel[94] && sink_valid[94];

        src95_data          = sink_data;
        src95_startofpacket = sink_startofpacket;
        src95_endofpacket   = sink_endofpacket;
        src95_channel       = sink_channel >> NUM_OUTPUTS;

        src95_valid         = sink_channel[95] && sink_valid[95];

        src96_data          = sink_data;
        src96_startofpacket = sink_startofpacket;
        src96_endofpacket   = sink_endofpacket;
        src96_channel       = sink_channel >> NUM_OUTPUTS;

        src96_valid         = sink_channel[96] && sink_valid[96];

        src97_data          = sink_data;
        src97_startofpacket = sink_startofpacket;
        src97_endofpacket   = sink_endofpacket;
        src97_channel       = sink_channel >> NUM_OUTPUTS;

        src97_valid         = sink_channel[97] && sink_valid[97];

        src98_data          = sink_data;
        src98_startofpacket = sink_startofpacket;
        src98_endofpacket   = sink_endofpacket;
        src98_channel       = sink_channel >> NUM_OUTPUTS;

        src98_valid         = sink_channel[98] && sink_valid[98];

        src99_data          = sink_data;
        src99_startofpacket = sink_startofpacket;
        src99_endofpacket   = sink_endofpacket;
        src99_channel       = sink_channel >> NUM_OUTPUTS;

        src99_valid         = sink_channel[99] && sink_valid[99];

        src100_data          = sink_data;
        src100_startofpacket = sink_startofpacket;
        src100_endofpacket   = sink_endofpacket;
        src100_channel       = sink_channel >> NUM_OUTPUTS;

        src100_valid         = sink_channel[100] && sink_valid[100];

        src101_data          = sink_data;
        src101_startofpacket = sink_startofpacket;
        src101_endofpacket   = sink_endofpacket;
        src101_channel       = sink_channel >> NUM_OUTPUTS;

        src101_valid         = sink_channel[101] && sink_valid[101];

        src102_data          = sink_data;
        src102_startofpacket = sink_startofpacket;
        src102_endofpacket   = sink_endofpacket;
        src102_channel       = sink_channel >> NUM_OUTPUTS;

        src102_valid         = sink_channel[102] && sink_valid[102];

        src103_data          = sink_data;
        src103_startofpacket = sink_startofpacket;
        src103_endofpacket   = sink_endofpacket;
        src103_channel       = sink_channel >> NUM_OUTPUTS;

        src103_valid         = sink_channel[103] && sink_valid[103];

        src104_data          = sink_data;
        src104_startofpacket = sink_startofpacket;
        src104_endofpacket   = sink_endofpacket;
        src104_channel       = sink_channel >> NUM_OUTPUTS;

        src104_valid         = sink_channel[104] && sink_valid[104];

        src105_data          = sink_data;
        src105_startofpacket = sink_startofpacket;
        src105_endofpacket   = sink_endofpacket;
        src105_channel       = sink_channel >> NUM_OUTPUTS;

        src105_valid         = sink_channel[105] && sink_valid[105];

        src106_data          = sink_data;
        src106_startofpacket = sink_startofpacket;
        src106_endofpacket   = sink_endofpacket;
        src106_channel       = sink_channel >> NUM_OUTPUTS;

        src106_valid         = sink_channel[106] && sink_valid[106];

        src107_data          = sink_data;
        src107_startofpacket = sink_startofpacket;
        src107_endofpacket   = sink_endofpacket;
        src107_channel       = sink_channel >> NUM_OUTPUTS;

        src107_valid         = sink_channel[107] && sink_valid[107];

        src108_data          = sink_data;
        src108_startofpacket = sink_startofpacket;
        src108_endofpacket   = sink_endofpacket;
        src108_channel       = sink_channel >> NUM_OUTPUTS;

        src108_valid         = sink_channel[108] && sink_valid[108];

        src109_data          = sink_data;
        src109_startofpacket = sink_startofpacket;
        src109_endofpacket   = sink_endofpacket;
        src109_channel       = sink_channel >> NUM_OUTPUTS;

        src109_valid         = sink_channel[109] && sink_valid[109];

        src110_data          = sink_data;
        src110_startofpacket = sink_startofpacket;
        src110_endofpacket   = sink_endofpacket;
        src110_channel       = sink_channel >> NUM_OUTPUTS;

        src110_valid         = sink_channel[110] && sink_valid[110];

        src111_data          = sink_data;
        src111_startofpacket = sink_startofpacket;
        src111_endofpacket   = sink_endofpacket;
        src111_channel       = sink_channel >> NUM_OUTPUTS;

        src111_valid         = sink_channel[111] && sink_valid[111];

        src112_data          = sink_data;
        src112_startofpacket = sink_startofpacket;
        src112_endofpacket   = sink_endofpacket;
        src112_channel       = sink_channel >> NUM_OUTPUTS;

        src112_valid         = sink_channel[112] && sink_valid[112];

        src113_data          = sink_data;
        src113_startofpacket = sink_startofpacket;
        src113_endofpacket   = sink_endofpacket;
        src113_channel       = sink_channel >> NUM_OUTPUTS;

        src113_valid         = sink_channel[113] && sink_valid[113];

        src114_data          = sink_data;
        src114_startofpacket = sink_startofpacket;
        src114_endofpacket   = sink_endofpacket;
        src114_channel       = sink_channel >> NUM_OUTPUTS;

        src114_valid         = sink_channel[114] && sink_valid[114];

        src115_data          = sink_data;
        src115_startofpacket = sink_startofpacket;
        src115_endofpacket   = sink_endofpacket;
        src115_channel       = sink_channel >> NUM_OUTPUTS;

        src115_valid         = sink_channel[115] && sink_valid[115];

        src116_data          = sink_data;
        src116_startofpacket = sink_startofpacket;
        src116_endofpacket   = sink_endofpacket;
        src116_channel       = sink_channel >> NUM_OUTPUTS;

        src116_valid         = sink_channel[116] && sink_valid[116];

        src117_data          = sink_data;
        src117_startofpacket = sink_startofpacket;
        src117_endofpacket   = sink_endofpacket;
        src117_channel       = sink_channel >> NUM_OUTPUTS;

        src117_valid         = sink_channel[117] && sink_valid[117];

        src118_data          = sink_data;
        src118_startofpacket = sink_startofpacket;
        src118_endofpacket   = sink_endofpacket;
        src118_channel       = sink_channel >> NUM_OUTPUTS;

        src118_valid         = sink_channel[118] && sink_valid[118];

        src119_data          = sink_data;
        src119_startofpacket = sink_startofpacket;
        src119_endofpacket   = sink_endofpacket;
        src119_channel       = sink_channel >> NUM_OUTPUTS;

        src119_valid         = sink_channel[119] && sink_valid[119];

        src120_data          = sink_data;
        src120_startofpacket = sink_startofpacket;
        src120_endofpacket   = sink_endofpacket;
        src120_channel       = sink_channel >> NUM_OUTPUTS;

        src120_valid         = sink_channel[120] && sink_valid[120];

        src121_data          = sink_data;
        src121_startofpacket = sink_startofpacket;
        src121_endofpacket   = sink_endofpacket;
        src121_channel       = sink_channel >> NUM_OUTPUTS;

        src121_valid         = sink_channel[121] && sink_valid[121];

        src122_data          = sink_data;
        src122_startofpacket = sink_startofpacket;
        src122_endofpacket   = sink_endofpacket;
        src122_channel       = sink_channel >> NUM_OUTPUTS;

        src122_valid         = sink_channel[122] && sink_valid[122];

        src123_data          = sink_data;
        src123_startofpacket = sink_startofpacket;
        src123_endofpacket   = sink_endofpacket;
        src123_channel       = sink_channel >> NUM_OUTPUTS;

        src123_valid         = sink_channel[123] && sink_valid[123];

        src124_data          = sink_data;
        src124_startofpacket = sink_startofpacket;
        src124_endofpacket   = sink_endofpacket;
        src124_channel       = sink_channel >> NUM_OUTPUTS;

        src124_valid         = sink_channel[124] && sink_valid[124];

        src125_data          = sink_data;
        src125_startofpacket = sink_startofpacket;
        src125_endofpacket   = sink_endofpacket;
        src125_channel       = sink_channel >> NUM_OUTPUTS;

        src125_valid         = sink_channel[125] && sink_valid[125];

        src126_data          = sink_data;
        src126_startofpacket = sink_startofpacket;
        src126_endofpacket   = sink_endofpacket;
        src126_channel       = sink_channel >> NUM_OUTPUTS;

        src126_valid         = sink_channel[126] && sink_valid[126];

        src127_data          = sink_data;
        src127_startofpacket = sink_startofpacket;
        src127_endofpacket   = sink_endofpacket;
        src127_channel       = sink_channel >> NUM_OUTPUTS;

        src127_valid         = sink_channel[127] && sink_valid[127];

        src128_data          = sink_data;
        src128_startofpacket = sink_startofpacket;
        src128_endofpacket   = sink_endofpacket;
        src128_channel       = sink_channel >> NUM_OUTPUTS;

        src128_valid         = sink_channel[128] && sink_valid[128];

        src129_data          = sink_data;
        src129_startofpacket = sink_startofpacket;
        src129_endofpacket   = sink_endofpacket;
        src129_channel       = sink_channel >> NUM_OUTPUTS;

        src129_valid         = sink_channel[129] && sink_valid[129];

        src130_data          = sink_data;
        src130_startofpacket = sink_startofpacket;
        src130_endofpacket   = sink_endofpacket;
        src130_channel       = sink_channel >> NUM_OUTPUTS;

        src130_valid         = sink_channel[130] && sink_valid[130];

        src131_data          = sink_data;
        src131_startofpacket = sink_startofpacket;
        src131_endofpacket   = sink_endofpacket;
        src131_channel       = sink_channel >> NUM_OUTPUTS;

        src131_valid         = sink_channel[131] && sink_valid[131];

        src132_data          = sink_data;
        src132_startofpacket = sink_startofpacket;
        src132_endofpacket   = sink_endofpacket;
        src132_channel       = sink_channel >> NUM_OUTPUTS;

        src132_valid         = sink_channel[132] && sink_valid[132];

        src133_data          = sink_data;
        src133_startofpacket = sink_startofpacket;
        src133_endofpacket   = sink_endofpacket;
        src133_channel       = sink_channel >> NUM_OUTPUTS;

        src133_valid         = sink_channel[133] && sink_valid[133];

        src134_data          = sink_data;
        src134_startofpacket = sink_startofpacket;
        src134_endofpacket   = sink_endofpacket;
        src134_channel       = sink_channel >> NUM_OUTPUTS;

        src134_valid         = sink_channel[134] && sink_valid[134];

        src135_data          = sink_data;
        src135_startofpacket = sink_startofpacket;
        src135_endofpacket   = sink_endofpacket;
        src135_channel       = sink_channel >> NUM_OUTPUTS;

        src135_valid         = sink_channel[135] && sink_valid[135];

        src136_data          = sink_data;
        src136_startofpacket = sink_startofpacket;
        src136_endofpacket   = sink_endofpacket;
        src136_channel       = sink_channel >> NUM_OUTPUTS;

        src136_valid         = sink_channel[136] && sink_valid[136];

        src137_data          = sink_data;
        src137_startofpacket = sink_startofpacket;
        src137_endofpacket   = sink_endofpacket;
        src137_channel       = sink_channel >> NUM_OUTPUTS;

        src137_valid         = sink_channel[137] && sink_valid[137];

        src138_data          = sink_data;
        src138_startofpacket = sink_startofpacket;
        src138_endofpacket   = sink_endofpacket;
        src138_channel       = sink_channel >> NUM_OUTPUTS;

        src138_valid         = sink_channel[138] && sink_valid[138];

        src139_data          = sink_data;
        src139_startofpacket = sink_startofpacket;
        src139_endofpacket   = sink_endofpacket;
        src139_channel       = sink_channel >> NUM_OUTPUTS;

        src139_valid         = sink_channel[139] && sink_valid[139];

        src140_data          = sink_data;
        src140_startofpacket = sink_startofpacket;
        src140_endofpacket   = sink_endofpacket;
        src140_channel       = sink_channel >> NUM_OUTPUTS;

        src140_valid         = sink_channel[140] && sink_valid[140];

    end

    // -------------------
    // Backpressure
    // -------------------
    assign ready_vector[0] = src0_ready;
    assign ready_vector[1] = src1_ready;
    assign ready_vector[2] = src2_ready;
    assign ready_vector[3] = src3_ready;
    assign ready_vector[4] = src4_ready;
    assign ready_vector[5] = src5_ready;
    assign ready_vector[6] = src6_ready;
    assign ready_vector[7] = src7_ready;
    assign ready_vector[8] = src8_ready;
    assign ready_vector[9] = src9_ready;
    assign ready_vector[10] = src10_ready;
    assign ready_vector[11] = src11_ready;
    assign ready_vector[12] = src12_ready;
    assign ready_vector[13] = src13_ready;
    assign ready_vector[14] = src14_ready;
    assign ready_vector[15] = src15_ready;
    assign ready_vector[16] = src16_ready;
    assign ready_vector[17] = src17_ready;
    assign ready_vector[18] = src18_ready;
    assign ready_vector[19] = src19_ready;
    assign ready_vector[20] = src20_ready;
    assign ready_vector[21] = src21_ready;
    assign ready_vector[22] = src22_ready;
    assign ready_vector[23] = src23_ready;
    assign ready_vector[24] = src24_ready;
    assign ready_vector[25] = src25_ready;
    assign ready_vector[26] = src26_ready;
    assign ready_vector[27] = src27_ready;
    assign ready_vector[28] = src28_ready;
    assign ready_vector[29] = src29_ready;
    assign ready_vector[30] = src30_ready;
    assign ready_vector[31] = src31_ready;
    assign ready_vector[32] = src32_ready;
    assign ready_vector[33] = src33_ready;
    assign ready_vector[34] = src34_ready;
    assign ready_vector[35] = src35_ready;
    assign ready_vector[36] = src36_ready;
    assign ready_vector[37] = src37_ready;
    assign ready_vector[38] = src38_ready;
    assign ready_vector[39] = src39_ready;
    assign ready_vector[40] = src40_ready;
    assign ready_vector[41] = src41_ready;
    assign ready_vector[42] = src42_ready;
    assign ready_vector[43] = src43_ready;
    assign ready_vector[44] = src44_ready;
    assign ready_vector[45] = src45_ready;
    assign ready_vector[46] = src46_ready;
    assign ready_vector[47] = src47_ready;
    assign ready_vector[48] = src48_ready;
    assign ready_vector[49] = src49_ready;
    assign ready_vector[50] = src50_ready;
    assign ready_vector[51] = src51_ready;
    assign ready_vector[52] = src52_ready;
    assign ready_vector[53] = src53_ready;
    assign ready_vector[54] = src54_ready;
    assign ready_vector[55] = src55_ready;
    assign ready_vector[56] = src56_ready;
    assign ready_vector[57] = src57_ready;
    assign ready_vector[58] = src58_ready;
    assign ready_vector[59] = src59_ready;
    assign ready_vector[60] = src60_ready;
    assign ready_vector[61] = src61_ready;
    assign ready_vector[62] = src62_ready;
    assign ready_vector[63] = src63_ready;
    assign ready_vector[64] = src64_ready;
    assign ready_vector[65] = src65_ready;
    assign ready_vector[66] = src66_ready;
    assign ready_vector[67] = src67_ready;
    assign ready_vector[68] = src68_ready;
    assign ready_vector[69] = src69_ready;
    assign ready_vector[70] = src70_ready;
    assign ready_vector[71] = src71_ready;
    assign ready_vector[72] = src72_ready;
    assign ready_vector[73] = src73_ready;
    assign ready_vector[74] = src74_ready;
    assign ready_vector[75] = src75_ready;
    assign ready_vector[76] = src76_ready;
    assign ready_vector[77] = src77_ready;
    assign ready_vector[78] = src78_ready;
    assign ready_vector[79] = src79_ready;
    assign ready_vector[80] = src80_ready;
    assign ready_vector[81] = src81_ready;
    assign ready_vector[82] = src82_ready;
    assign ready_vector[83] = src83_ready;
    assign ready_vector[84] = src84_ready;
    assign ready_vector[85] = src85_ready;
    assign ready_vector[86] = src86_ready;
    assign ready_vector[87] = src87_ready;
    assign ready_vector[88] = src88_ready;
    assign ready_vector[89] = src89_ready;
    assign ready_vector[90] = src90_ready;
    assign ready_vector[91] = src91_ready;
    assign ready_vector[92] = src92_ready;
    assign ready_vector[93] = src93_ready;
    assign ready_vector[94] = src94_ready;
    assign ready_vector[95] = src95_ready;
    assign ready_vector[96] = src96_ready;
    assign ready_vector[97] = src97_ready;
    assign ready_vector[98] = src98_ready;
    assign ready_vector[99] = src99_ready;
    assign ready_vector[100] = src100_ready;
    assign ready_vector[101] = src101_ready;
    assign ready_vector[102] = src102_ready;
    assign ready_vector[103] = src103_ready;
    assign ready_vector[104] = src104_ready;
    assign ready_vector[105] = src105_ready;
    assign ready_vector[106] = src106_ready;
    assign ready_vector[107] = src107_ready;
    assign ready_vector[108] = src108_ready;
    assign ready_vector[109] = src109_ready;
    assign ready_vector[110] = src110_ready;
    assign ready_vector[111] = src111_ready;
    assign ready_vector[112] = src112_ready;
    assign ready_vector[113] = src113_ready;
    assign ready_vector[114] = src114_ready;
    assign ready_vector[115] = src115_ready;
    assign ready_vector[116] = src116_ready;
    assign ready_vector[117] = src117_ready;
    assign ready_vector[118] = src118_ready;
    assign ready_vector[119] = src119_ready;
    assign ready_vector[120] = src120_ready;
    assign ready_vector[121] = src121_ready;
    assign ready_vector[122] = src122_ready;
    assign ready_vector[123] = src123_ready;
    assign ready_vector[124] = src124_ready;
    assign ready_vector[125] = src125_ready;
    assign ready_vector[126] = src126_ready;
    assign ready_vector[127] = src127_ready;
    assign ready_vector[128] = src128_ready;
    assign ready_vector[129] = src129_ready;
    assign ready_vector[130] = src130_ready;
    assign ready_vector[131] = src131_ready;
    assign ready_vector[132] = src132_ready;
    assign ready_vector[133] = src133_ready;
    assign ready_vector[134] = src134_ready;
    assign ready_vector[135] = src135_ready;
    assign ready_vector[136] = src136_ready;
    assign ready_vector[137] = src137_ready;
    assign ready_vector[138] = src138_ready;
    assign ready_vector[139] = src139_ready;
    assign ready_vector[140] = src140_ready;

    assign sink_ready = |(sink_channel & ready_vector);

endmodule

