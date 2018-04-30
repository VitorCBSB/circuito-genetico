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


// $Id: //acds/rel/16.1/ip/merlin/altera_merlin_router/altera_merlin_router.sv.terp#1 $
// $Revision: #1 $
// $Date: 2016/08/07 $
// $Author: swbranch $

// -------------------------------------------------------
// Merlin Router
//
// Asserts the appropriate one-hot encoded channel based on 
// either (a) the address or (b) the dest id. The DECODER_TYPE
// parameter controls this behaviour. 0 means address decoder,
// 1 means dest id decoder.
//
// In the case of (a), it also sets the destination id.
// -------------------------------------------------------

`timescale 1 ns / 1 ns

module testeio_mm_interconnect_0_router_default_decode
  #(
     parameter DEFAULT_CHANNEL = 93,
               DEFAULT_WR_CHANNEL = -1,
               DEFAULT_RD_CHANNEL = -1,
               DEFAULT_DESTID = 76 
   )
  (output [99 - 93 : 0] default_destination_id,
   output [94-1 : 0] default_wr_channel,
   output [94-1 : 0] default_rd_channel,
   output [94-1 : 0] default_src_channel
  );

  assign default_destination_id = 
    DEFAULT_DESTID[99 - 93 : 0];

  generate
    if (DEFAULT_CHANNEL == -1) begin : no_default_channel_assignment
      assign default_src_channel = '0;
    end
    else begin : default_channel_assignment
      assign default_src_channel = 94'b1 << DEFAULT_CHANNEL;
    end
  endgenerate

  generate
    if (DEFAULT_RD_CHANNEL == -1) begin : no_default_rw_channel_assignment
      assign default_wr_channel = '0;
      assign default_rd_channel = '0;
    end
    else begin : default_rw_channel_assignment
      assign default_wr_channel = 94'b1 << DEFAULT_WR_CHANNEL;
      assign default_rd_channel = 94'b1 << DEFAULT_RD_CHANNEL;
    end
  endgenerate

endmodule


module testeio_mm_interconnect_0_router
(
    // -------------------
    // Clock & Reset
    // -------------------
    input clk,
    input reset,

    // -------------------
    // Command Sink (Input)
    // -------------------
    input                       sink_valid,
    input  [124-1 : 0]    sink_data,
    input                       sink_startofpacket,
    input                       sink_endofpacket,
    output                      sink_ready,

    // -------------------
    // Command Source (Output)
    // -------------------
    output                          src_valid,
    output reg [124-1    : 0] src_data,
    output reg [94-1 : 0] src_channel,
    output                          src_startofpacket,
    output                          src_endofpacket,
    input                           src_ready
);

    // -------------------------------------------------------
    // Local parameters and variables
    // -------------------------------------------------------
    localparam PKT_ADDR_H = 56;
    localparam PKT_ADDR_L = 36;
    localparam PKT_DEST_ID_H = 99;
    localparam PKT_DEST_ID_L = 93;
    localparam PKT_PROTECTION_H = 114;
    localparam PKT_PROTECTION_L = 112;
    localparam ST_DATA_W = 124;
    localparam ST_CHANNEL_W = 94;
    localparam DECODER_TYPE = 0;

    localparam PKT_TRANS_WRITE = 59;
    localparam PKT_TRANS_READ  = 60;

    localparam PKT_ADDR_W = PKT_ADDR_H-PKT_ADDR_L + 1;
    localparam PKT_DEST_ID_W = PKT_DEST_ID_H-PKT_DEST_ID_L + 1;



    // -------------------------------------------------------
    // Figure out the number of bits to mask off for each slave span
    // during address decoding
    // -------------------------------------------------------
    localparam PAD0 = log2ceil(64'h20000 - 64'h0); 
    localparam PAD1 = log2ceil(64'h40000 - 64'h20000); 
    localparam PAD2 = log2ceil(64'h40010 - 64'h40000); 
    localparam PAD3 = log2ceil(64'h40020 - 64'h40010); 
    localparam PAD4 = log2ceil(64'h40030 - 64'h40020); 
    localparam PAD5 = log2ceil(64'h40040 - 64'h40030); 
    localparam PAD6 = log2ceil(64'h40050 - 64'h40040); 
    localparam PAD7 = log2ceil(64'h40060 - 64'h40050); 
    localparam PAD8 = log2ceil(64'h40070 - 64'h40060); 
    localparam PAD9 = log2ceil(64'h40080 - 64'h40070); 
    localparam PAD10 = log2ceil(64'h40090 - 64'h40080); 
    localparam PAD11 = log2ceil(64'h400a0 - 64'h40090); 
    localparam PAD12 = log2ceil(64'h400b0 - 64'h400a0); 
    localparam PAD13 = log2ceil(64'h400c0 - 64'h400b0); 
    localparam PAD14 = log2ceil(64'h400d0 - 64'h400c0); 
    localparam PAD15 = log2ceil(64'h400e0 - 64'h400d0); 
    localparam PAD16 = log2ceil(64'h400f0 - 64'h400e0); 
    localparam PAD17 = log2ceil(64'h40100 - 64'h400f0); 
    localparam PAD18 = log2ceil(64'h40110 - 64'h40100); 
    localparam PAD19 = log2ceil(64'h40120 - 64'h40110); 
    localparam PAD20 = log2ceil(64'h40130 - 64'h40120); 
    localparam PAD21 = log2ceil(64'h40140 - 64'h40130); 
    localparam PAD22 = log2ceil(64'h40150 - 64'h40140); 
    localparam PAD23 = log2ceil(64'h40160 - 64'h40150); 
    localparam PAD24 = log2ceil(64'h40170 - 64'h40160); 
    localparam PAD25 = log2ceil(64'h40180 - 64'h40170); 
    localparam PAD26 = log2ceil(64'h40190 - 64'h40180); 
    localparam PAD27 = log2ceil(64'h401a0 - 64'h40190); 
    localparam PAD28 = log2ceil(64'h401b0 - 64'h401a0); 
    localparam PAD29 = log2ceil(64'h401c0 - 64'h401b0); 
    localparam PAD30 = log2ceil(64'h401d0 - 64'h401c0); 
    localparam PAD31 = log2ceil(64'h401e0 - 64'h401d0); 
    localparam PAD32 = log2ceil(64'h401f0 - 64'h401e0); 
    localparam PAD33 = log2ceil(64'h40200 - 64'h401f0); 
    localparam PAD34 = log2ceil(64'h40210 - 64'h40200); 
    localparam PAD35 = log2ceil(64'h40220 - 64'h40210); 
    localparam PAD36 = log2ceil(64'h40230 - 64'h40220); 
    localparam PAD37 = log2ceil(64'h40240 - 64'h40230); 
    localparam PAD38 = log2ceil(64'h40250 - 64'h40240); 
    localparam PAD39 = log2ceil(64'h40260 - 64'h40250); 
    localparam PAD40 = log2ceil(64'h40270 - 64'h40260); 
    localparam PAD41 = log2ceil(64'h40280 - 64'h40270); 
    localparam PAD42 = log2ceil(64'h40290 - 64'h40280); 
    localparam PAD43 = log2ceil(64'h402a0 - 64'h40290); 
    localparam PAD44 = log2ceil(64'h402b0 - 64'h402a0); 
    localparam PAD45 = log2ceil(64'h402c0 - 64'h402b0); 
    localparam PAD46 = log2ceil(64'h402d0 - 64'h402c0); 
    localparam PAD47 = log2ceil(64'h402e0 - 64'h402d0); 
    localparam PAD48 = log2ceil(64'h402f0 - 64'h402e0); 
    localparam PAD49 = log2ceil(64'h40300 - 64'h402f0); 
    localparam PAD50 = log2ceil(64'h40310 - 64'h40300); 
    localparam PAD51 = log2ceil(64'h40320 - 64'h40310); 
    localparam PAD52 = log2ceil(64'h40330 - 64'h40320); 
    localparam PAD53 = log2ceil(64'h40340 - 64'h40330); 
    localparam PAD54 = log2ceil(64'h40350 - 64'h40340); 
    localparam PAD55 = log2ceil(64'h40360 - 64'h40350); 
    localparam PAD56 = log2ceil(64'h40370 - 64'h40360); 
    localparam PAD57 = log2ceil(64'h40380 - 64'h40370); 
    localparam PAD58 = log2ceil(64'h40390 - 64'h40380); 
    localparam PAD59 = log2ceil(64'h403a0 - 64'h40390); 
    localparam PAD60 = log2ceil(64'h403b0 - 64'h403a0); 
    localparam PAD61 = log2ceil(64'h403c0 - 64'h403b0); 
    localparam PAD62 = log2ceil(64'h403d0 - 64'h403c0); 
    localparam PAD63 = log2ceil(64'h403e0 - 64'h403d0); 
    localparam PAD64 = log2ceil(64'h403f0 - 64'h403e0); 
    localparam PAD65 = log2ceil(64'h40400 - 64'h403f0); 
    localparam PAD66 = log2ceil(64'h40410 - 64'h40400); 
    localparam PAD67 = log2ceil(64'h40420 - 64'h40410); 
    localparam PAD68 = log2ceil(64'h40430 - 64'h40420); 
    localparam PAD69 = log2ceil(64'h40440 - 64'h40430); 
    localparam PAD70 = log2ceil(64'h40450 - 64'h40440); 
    localparam PAD71 = log2ceil(64'h40460 - 64'h40450); 
    localparam PAD72 = log2ceil(64'h40470 - 64'h40460); 
    localparam PAD73 = log2ceil(64'h40480 - 64'h40470); 
    localparam PAD74 = log2ceil(64'h40490 - 64'h40480); 
    localparam PAD75 = log2ceil(64'h404a0 - 64'h40490); 
    localparam PAD76 = log2ceil(64'h404b0 - 64'h404a0); 
    localparam PAD77 = log2ceil(64'h404c0 - 64'h404b0); 
    localparam PAD78 = log2ceil(64'h404d0 - 64'h404c0); 
    localparam PAD79 = log2ceil(64'h404e0 - 64'h404d0); 
    localparam PAD80 = log2ceil(64'h404f0 - 64'h404e0); 
    localparam PAD81 = log2ceil(64'h40500 - 64'h404f0); 
    localparam PAD82 = log2ceil(64'h40510 - 64'h40500); 
    localparam PAD83 = log2ceil(64'h40520 - 64'h40510); 
    localparam PAD84 = log2ceil(64'h40530 - 64'h40520); 
    localparam PAD85 = log2ceil(64'h40540 - 64'h40530); 
    localparam PAD86 = log2ceil(64'h40550 - 64'h40540); 
    localparam PAD87 = log2ceil(64'h40560 - 64'h40550); 
    localparam PAD88 = log2ceil(64'h40570 - 64'h40560); 
    localparam PAD89 = log2ceil(64'h40580 - 64'h40570); 
    localparam PAD90 = log2ceil(64'h40590 - 64'h40580); 
    localparam PAD91 = log2ceil(64'h405a0 - 64'h40590); 
    localparam PAD92 = log2ceil(64'h405b0 - 64'h405a0); 
    localparam PAD93 = log2ceil(64'h405c0 - 64'h405b0); 
    // -------------------------------------------------------
    // Work out which address bits are significant based on the
    // address range of the slaves. If the required width is too
    // large or too small, we use the address field width instead.
    // -------------------------------------------------------
    localparam ADDR_RANGE = 64'h405c0;
    localparam RANGE_ADDR_WIDTH = log2ceil(ADDR_RANGE);
    localparam OPTIMIZED_ADDR_H = (RANGE_ADDR_WIDTH > PKT_ADDR_W) ||
                                  (RANGE_ADDR_WIDTH == 0) ?
                                        PKT_ADDR_H :
                                        PKT_ADDR_L + RANGE_ADDR_WIDTH - 1;

    localparam RG = RANGE_ADDR_WIDTH-1;
    localparam REAL_ADDRESS_RANGE = OPTIMIZED_ADDR_H - PKT_ADDR_L;

      reg [PKT_ADDR_W-1 : 0] address;
      always @* begin
        address = {PKT_ADDR_W{1'b0}};
        address [REAL_ADDRESS_RANGE:0] = sink_data[OPTIMIZED_ADDR_H : PKT_ADDR_L];
      end   

    // -------------------------------------------------------
    // Pass almost everything through, untouched
    // -------------------------------------------------------
    assign sink_ready        = src_ready;
    assign src_valid         = sink_valid;
    assign src_startofpacket = sink_startofpacket;
    assign src_endofpacket   = sink_endofpacket;
    wire [PKT_DEST_ID_W-1:0] default_destid;
    wire [94-1 : 0] default_src_channel;




    // -------------------------------------------------------
    // Write and read transaction signals
    // -------------------------------------------------------
    wire read_transaction;
    assign read_transaction  = sink_data[PKT_TRANS_READ];


    testeio_mm_interconnect_0_router_default_decode the_default_decode(
      .default_destination_id (default_destid),
      .default_wr_channel   (),
      .default_rd_channel   (),
      .default_src_channel  (default_src_channel)
    );

    always @* begin
        src_data    = sink_data;
        src_channel = default_src_channel;
        src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = default_destid;

        // --------------------------------------------------
        // Address Decoder
        // Sets the channel and destination ID based on the address
        // --------------------------------------------------

    // ( 0x0 .. 0x20000 )
    if ( {address[RG:PAD0],{PAD0{1'b0}}} == 19'h0   ) begin
            src_channel = 94'b1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 76;
    end

    // ( 0x20000 .. 0x40000 )
    if ( {address[RG:PAD1],{PAD1{1'b0}}} == 19'h20000   ) begin
            src_channel = 94'b0000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 77;
    end

    // ( 0x40000 .. 0x40010 )
    if ( {address[RG:PAD2],{PAD2{1'b0}}} == 19'h40000   ) begin
            src_channel = 94'b0100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 47;
    end

    // ( 0x40010 .. 0x40020 )
    if ( {address[RG:PAD3],{PAD3{1'b0}}} == 19'h40010   ) begin
            src_channel = 94'b0010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 46;
    end

    // ( 0x40020 .. 0x40030 )
    if ( {address[RG:PAD4],{PAD4{1'b0}}} == 19'h40020   ) begin
            src_channel = 94'b0001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 45;
    end

    // ( 0x40030 .. 0x40040 )
    if ( {address[RG:PAD5],{PAD5{1'b0}}} == 19'h40030   ) begin
            src_channel = 94'b0000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 44;
    end

    // ( 0x40040 .. 0x40050 )
    if ( {address[RG:PAD6],{PAD6{1'b0}}} == 19'h40040   ) begin
            src_channel = 94'b0000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 43;
    end

    // ( 0x40050 .. 0x40060 )
    if ( {address[RG:PAD7],{PAD7{1'b0}}} == 19'h40050   ) begin
            src_channel = 94'b0000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 42;
    end

    // ( 0x40060 .. 0x40070 )
    if ( {address[RG:PAD8],{PAD8{1'b0}}} == 19'h40060   ) begin
            src_channel = 94'b0000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 56;
    end

    // ( 0x40070 .. 0x40080 )
    if ( {address[RG:PAD9],{PAD9{1'b0}}} == 19'h40070   ) begin
            src_channel = 94'b0000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 55;
    end

    // ( 0x40080 .. 0x40090 )
    if ( {address[RG:PAD10],{PAD10{1'b0}}} == 19'h40080   ) begin
            src_channel = 94'b0000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 54;
    end

    // ( 0x40090 .. 0x400a0 )
    if ( {address[RG:PAD11],{PAD11{1'b0}}} == 19'h40090   ) begin
            src_channel = 94'b0000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 53;
    end

    // ( 0x400a0 .. 0x400b0 )
    if ( {address[RG:PAD12],{PAD12{1'b0}}} == 19'h400a0   ) begin
            src_channel = 94'b0000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 52;
    end

    // ( 0x400b0 .. 0x400c0 )
    if ( {address[RG:PAD13],{PAD13{1'b0}}} == 19'h400b0   ) begin
            src_channel = 94'b0000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 63;
    end

    // ( 0x400c0 .. 0x400d0 )
    if ( {address[RG:PAD14],{PAD14{1'b0}}} == 19'h400c0   ) begin
            src_channel = 94'b0000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 62;
    end

    // ( 0x400d0 .. 0x400e0 )
    if ( {address[RG:PAD15],{PAD15{1'b0}}} == 19'h400d0   ) begin
            src_channel = 94'b0000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 61;
    end

    // ( 0x400e0 .. 0x400f0 )
    if ( {address[RG:PAD16],{PAD16{1'b0}}} == 19'h400e0   ) begin
            src_channel = 94'b0000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 60;
    end

    // ( 0x400f0 .. 0x40100 )
    if ( {address[RG:PAD17],{PAD17{1'b0}}} == 19'h400f0   ) begin
            src_channel = 94'b0000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 59;
    end

    // ( 0x40100 .. 0x40110 )
    if ( {address[RG:PAD18],{PAD18{1'b0}}} == 19'h40100   ) begin
            src_channel = 94'b0000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 58;
    end

    // ( 0x40110 .. 0x40120 )
    if ( {address[RG:PAD19],{PAD19{1'b0}}} == 19'h40110   ) begin
            src_channel = 94'b0000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 72;
    end

    // ( 0x40120 .. 0x40130 )
    if ( {address[RG:PAD20],{PAD20{1'b0}}} == 19'h40120   ) begin
            src_channel = 94'b0000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 71;
    end

    // ( 0x40130 .. 0x40140 )
    if ( {address[RG:PAD21],{PAD21{1'b0}}} == 19'h40130   ) begin
            src_channel = 94'b0000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 70;
    end

    // ( 0x40140 .. 0x40150 )
    if ( {address[RG:PAD22],{PAD22{1'b0}}} == 19'h40140   ) begin
            src_channel = 94'b0000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 69;
    end

    // ( 0x40150 .. 0x40160 )
    if ( {address[RG:PAD23],{PAD23{1'b0}}} == 19'h40150   ) begin
            src_channel = 94'b0000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 68;
    end

    // ( 0x40160 .. 0x40170 )
    if ( {address[RG:PAD24],{PAD24{1'b0}}} == 19'h40160   ) begin
            src_channel = 94'b0000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 84;
    end

    // ( 0x40170 .. 0x40180 )
    if ( {address[RG:PAD25],{PAD25{1'b0}}} == 19'h40170   ) begin
            src_channel = 94'b0000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 83;
    end

    // ( 0x40180 .. 0x40190 )
    if ( {address[RG:PAD26],{PAD26{1'b0}}} == 19'h40180   ) begin
            src_channel = 94'b0000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 82;
    end

    // ( 0x40190 .. 0x401a0 )
    if ( {address[RG:PAD27],{PAD27{1'b0}}} == 19'h40190   ) begin
            src_channel = 94'b0000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 81;
    end

    // ( 0x401a0 .. 0x401b0 )
    if ( {address[RG:PAD28],{PAD28{1'b0}}} == 19'h401a0   ) begin
            src_channel = 94'b0000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 80;
    end

    // ( 0x401b0 .. 0x401c0 )
    if ( {address[RG:PAD29],{PAD29{1'b0}}} == 19'h401b0   ) begin
            src_channel = 94'b0000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 79;
    end

    // ( 0x401c0 .. 0x401d0 )
    if ( {address[RG:PAD30],{PAD30{1'b0}}} == 19'h401c0   ) begin
            src_channel = 94'b0000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 93;
    end

    // ( 0x401d0 .. 0x401e0 )
    if ( {address[RG:PAD31],{PAD31{1'b0}}} == 19'h401d0   ) begin
            src_channel = 94'b0000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 92;
    end

    // ( 0x401e0 .. 0x401f0 )
    if ( {address[RG:PAD32],{PAD32{1'b0}}} == 19'h401e0   ) begin
            src_channel = 94'b0000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 91;
    end

    // ( 0x401f0 .. 0x40200 )
    if ( {address[RG:PAD33],{PAD33{1'b0}}} == 19'h401f0   ) begin
            src_channel = 94'b0000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 90;
    end

    // ( 0x40200 .. 0x40210 )
    if ( {address[RG:PAD34],{PAD34{1'b0}}} == 19'h40200   ) begin
            src_channel = 94'b0000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 89;
    end

    // ( 0x40210 .. 0x40220 )
    if ( {address[RG:PAD35],{PAD35{1'b0}}} == 19'h40210   ) begin
            src_channel = 94'b0000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 74;
    end

    // ( 0x40220 .. 0x40230 )
    if ( {address[RG:PAD36],{PAD36{1'b0}}} == 19'h40220   ) begin
            src_channel = 94'b0000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 88;
    end

    // ( 0x40230 .. 0x40240 )
    if ( {address[RG:PAD37],{PAD37{1'b0}}} == 19'h40230   ) begin
            src_channel = 94'b0000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 51;
    end

    // ( 0x40240 .. 0x40250 )
    if ( {address[RG:PAD38],{PAD38{1'b0}}} == 19'h40240   ) begin
            src_channel = 94'b0000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 67;
    end

    // ( 0x40250 .. 0x40260 )
    if ( {address[RG:PAD39],{PAD39{1'b0}}} == 19'h40250   ) begin
            src_channel = 94'b0000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 87;
    end

    // ( 0x40260 .. 0x40270 )
    if ( {address[RG:PAD40],{PAD40{1'b0}}} == 19'h40260   ) begin
            src_channel = 94'b0000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 86;
    end

    // ( 0x40270 .. 0x40280 )
    if ( {address[RG:PAD41],{PAD41{1'b0}}} == 19'h40270   ) begin
            src_channel = 94'b0000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 85;
    end

    // ( 0x40280 .. 0x40290 )
    if ( {address[RG:PAD42],{PAD42{1'b0}}} == 19'h40280   ) begin
            src_channel = 94'b0000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 78;
    end

    // ( 0x40290 .. 0x402a0 )
    if ( {address[RG:PAD43],{PAD43{1'b0}}} == 19'h40290   ) begin
            src_channel = 94'b0000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 50;
    end

    // ( 0x402a0 .. 0x402b0 )
    if ( {address[RG:PAD44],{PAD44{1'b0}}} == 19'h402a0   ) begin
            src_channel = 94'b0000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 49;
    end

    // ( 0x402b0 .. 0x402c0 )
    if ( {address[RG:PAD45],{PAD45{1'b0}}} == 19'h402b0   ) begin
            src_channel = 94'b0000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 48;
    end

    // ( 0x402c0 .. 0x402d0 )
    if ( {address[RG:PAD46],{PAD46{1'b0}}} == 19'h402c0   ) begin
            src_channel = 94'b0000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 41;
    end

    // ( 0x402d0 .. 0x402e0 )
    if ( {address[RG:PAD47],{PAD47{1'b0}}} == 19'h402d0   ) begin
            src_channel = 94'b0000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 66;
    end

    // ( 0x402e0 .. 0x402f0 )
    if ( {address[RG:PAD48],{PAD48{1'b0}}} == 19'h402e0   ) begin
            src_channel = 94'b0000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 65;
    end

    // ( 0x402f0 .. 0x40300 )
    if ( {address[RG:PAD49],{PAD49{1'b0}}} == 19'h402f0   ) begin
            src_channel = 94'b0000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 64;
    end

    // ( 0x40300 .. 0x40310 )
    if ( {address[RG:PAD50],{PAD50{1'b0}}} == 19'h40300   ) begin
            src_channel = 94'b0000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 57;
    end

    // ( 0x40310 .. 0x40320 )
    if ( {address[RG:PAD51],{PAD51{1'b0}}} == 19'h40310  && read_transaction  ) begin
            src_channel = 94'b0000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 40;
    end

    // ( 0x40320 .. 0x40330 )
    if ( {address[RG:PAD52],{PAD52{1'b0}}} == 19'h40320  && read_transaction  ) begin
            src_channel = 94'b0000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 39;
    end

    // ( 0x40330 .. 0x40340 )
    if ( {address[RG:PAD53],{PAD53{1'b0}}} == 19'h40330  && read_transaction  ) begin
            src_channel = 94'b0000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 38;
    end

    // ( 0x40340 .. 0x40350 )
    if ( {address[RG:PAD54],{PAD54{1'b0}}} == 19'h40340  && read_transaction  ) begin
            src_channel = 94'b0000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 37;
    end

    // ( 0x40350 .. 0x40360 )
    if ( {address[RG:PAD55],{PAD55{1'b0}}} == 19'h40350  && read_transaction  ) begin
            src_channel = 94'b0000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 36;
    end

    // ( 0x40360 .. 0x40370 )
    if ( {address[RG:PAD56],{PAD56{1'b0}}} == 19'h40360  && read_transaction  ) begin
            src_channel = 94'b0000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 35;
    end

    // ( 0x40370 .. 0x40380 )
    if ( {address[RG:PAD57],{PAD57{1'b0}}} == 19'h40370  && read_transaction  ) begin
            src_channel = 94'b0000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 34;
    end

    // ( 0x40380 .. 0x40390 )
    if ( {address[RG:PAD58],{PAD58{1'b0}}} == 19'h40380  && read_transaction  ) begin
            src_channel = 94'b0000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 33;
    end

    // ( 0x40390 .. 0x403a0 )
    if ( {address[RG:PAD59],{PAD59{1'b0}}} == 19'h40390   ) begin
            src_channel = 94'b0000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 32;
    end

    // ( 0x403a0 .. 0x403b0 )
    if ( {address[RG:PAD60],{PAD60{1'b0}}} == 19'h403a0  && read_transaction  ) begin
            src_channel = 94'b0000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 73;
    end

    // ( 0x403b0 .. 0x403c0 )
    if ( {address[RG:PAD61],{PAD61{1'b0}}} == 19'h403b0  && read_transaction  ) begin
            src_channel = 94'b0000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 31;
    end

    // ( 0x403c0 .. 0x403d0 )
    if ( {address[RG:PAD62],{PAD62{1'b0}}} == 19'h403c0   ) begin
            src_channel = 94'b0000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 75;
    end

    // ( 0x403d0 .. 0x403e0 )
    if ( {address[RG:PAD63],{PAD63{1'b0}}} == 19'h403d0   ) begin
            src_channel = 94'b0000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 23;
    end

    // ( 0x403e0 .. 0x403f0 )
    if ( {address[RG:PAD64],{PAD64{1'b0}}} == 19'h403e0   ) begin
            src_channel = 94'b0000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 21;
    end

    // ( 0x403f0 .. 0x40400 )
    if ( {address[RG:PAD65],{PAD65{1'b0}}} == 19'h403f0   ) begin
            src_channel = 94'b0000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 20;
    end

    // ( 0x40400 .. 0x40410 )
    if ( {address[RG:PAD66],{PAD66{1'b0}}} == 19'h40400   ) begin
            src_channel = 94'b0000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 19;
    end

    // ( 0x40410 .. 0x40420 )
    if ( {address[RG:PAD67],{PAD67{1'b0}}} == 19'h40410   ) begin
            src_channel = 94'b0000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 18;
    end

    // ( 0x40420 .. 0x40430 )
    if ( {address[RG:PAD68],{PAD68{1'b0}}} == 19'h40420   ) begin
            src_channel = 94'b0000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 17;
    end

    // ( 0x40430 .. 0x40440 )
    if ( {address[RG:PAD69],{PAD69{1'b0}}} == 19'h40430   ) begin
            src_channel = 94'b0000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 16;
    end

    // ( 0x40440 .. 0x40450 )
    if ( {address[RG:PAD70],{PAD70{1'b0}}} == 19'h40440   ) begin
            src_channel = 94'b0000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 15;
    end

    // ( 0x40450 .. 0x40460 )
    if ( {address[RG:PAD71],{PAD71{1'b0}}} == 19'h40450   ) begin
            src_channel = 94'b0000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 14;
    end

    // ( 0x40460 .. 0x40470 )
    if ( {address[RG:PAD72],{PAD72{1'b0}}} == 19'h40460   ) begin
            src_channel = 94'b0000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 13;
    end

    // ( 0x40470 .. 0x40480 )
    if ( {address[RG:PAD73],{PAD73{1'b0}}} == 19'h40470   ) begin
            src_channel = 94'b0000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 12;
    end

    // ( 0x40480 .. 0x40490 )
    if ( {address[RG:PAD74],{PAD74{1'b0}}} == 19'h40480   ) begin
            src_channel = 94'b0000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 10;
    end

    // ( 0x40490 .. 0x404a0 )
    if ( {address[RG:PAD75],{PAD75{1'b0}}} == 19'h40490   ) begin
            src_channel = 94'b0000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 9;
    end

    // ( 0x404a0 .. 0x404b0 )
    if ( {address[RG:PAD76],{PAD76{1'b0}}} == 19'h404a0   ) begin
            src_channel = 94'b0000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 8;
    end

    // ( 0x404b0 .. 0x404c0 )
    if ( {address[RG:PAD77],{PAD77{1'b0}}} == 19'h404b0   ) begin
            src_channel = 94'b0000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 7;
    end

    // ( 0x404c0 .. 0x404d0 )
    if ( {address[RG:PAD78],{PAD78{1'b0}}} == 19'h404c0   ) begin
            src_channel = 94'b0000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 6;
    end

    // ( 0x404d0 .. 0x404e0 )
    if ( {address[RG:PAD79],{PAD79{1'b0}}} == 19'h404d0   ) begin
            src_channel = 94'b0000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 5;
    end

    // ( 0x404e0 .. 0x404f0 )
    if ( {address[RG:PAD80],{PAD80{1'b0}}} == 19'h404e0   ) begin
            src_channel = 94'b0000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 4;
    end

    // ( 0x404f0 .. 0x40500 )
    if ( {address[RG:PAD81],{PAD81{1'b0}}} == 19'h404f0   ) begin
            src_channel = 94'b0000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 3;
    end

    // ( 0x40500 .. 0x40510 )
    if ( {address[RG:PAD82],{PAD82{1'b0}}} == 19'h40500   ) begin
            src_channel = 94'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 2;
    end

    // ( 0x40510 .. 0x40520 )
    if ( {address[RG:PAD83],{PAD83{1'b0}}} == 19'h40510   ) begin
            src_channel = 94'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 1;
    end

    // ( 0x40520 .. 0x40530 )
    if ( {address[RG:PAD84],{PAD84{1'b0}}} == 19'h40520   ) begin
            src_channel = 94'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 30;
    end

    // ( 0x40530 .. 0x40540 )
    if ( {address[RG:PAD85],{PAD85{1'b0}}} == 19'h40530   ) begin
            src_channel = 94'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 29;
    end

    // ( 0x40540 .. 0x40550 )
    if ( {address[RG:PAD86],{PAD86{1'b0}}} == 19'h40540   ) begin
            src_channel = 94'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 28;
    end

    // ( 0x40550 .. 0x40560 )
    if ( {address[RG:PAD87],{PAD87{1'b0}}} == 19'h40550   ) begin
            src_channel = 94'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 27;
    end

    // ( 0x40560 .. 0x40570 )
    if ( {address[RG:PAD88],{PAD88{1'b0}}} == 19'h40560   ) begin
            src_channel = 94'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 26;
    end

    // ( 0x40570 .. 0x40580 )
    if ( {address[RG:PAD89],{PAD89{1'b0}}} == 19'h40570   ) begin
            src_channel = 94'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 25;
    end

    // ( 0x40580 .. 0x40590 )
    if ( {address[RG:PAD90],{PAD90{1'b0}}} == 19'h40580   ) begin
            src_channel = 94'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 24;
    end

    // ( 0x40590 .. 0x405a0 )
    if ( {address[RG:PAD91],{PAD91{1'b0}}} == 19'h40590   ) begin
            src_channel = 94'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 22;
    end

    // ( 0x405a0 .. 0x405b0 )
    if ( {address[RG:PAD92],{PAD92{1'b0}}} == 19'h405a0   ) begin
            src_channel = 94'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 11;
    end

    // ( 0x405b0 .. 0x405c0 )
    if ( {address[RG:PAD93],{PAD93{1'b0}}} == 19'h405b0   ) begin
            src_channel = 94'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 0;
    end

end


    // --------------------------------------------------
    // Ceil(log2()) function
    // --------------------------------------------------
    function integer log2ceil;
        input reg[65:0] val;
        reg [65:0] i;

        begin
            i = 1;
            log2ceil = 0;

            while (i < val) begin
                log2ceil = log2ceil + 1;
                i = i << 1;
            end
        end
    endfunction

endmodule


