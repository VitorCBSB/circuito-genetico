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
     parameter DEFAULT_CHANNEL = 59,
               DEFAULT_WR_CHANNEL = -1,
               DEFAULT_RD_CHANNEL = -1,
               DEFAULT_DESTID = 108 
   )
  (output [101 - 94 : 0] default_destination_id,
   output [141-1 : 0] default_wr_channel,
   output [141-1 : 0] default_rd_channel,
   output [141-1 : 0] default_src_channel
  );

  assign default_destination_id = 
    DEFAULT_DESTID[101 - 94 : 0];

  generate
    if (DEFAULT_CHANNEL == -1) begin : no_default_channel_assignment
      assign default_src_channel = '0;
    end
    else begin : default_channel_assignment
      assign default_src_channel = 141'b1 << DEFAULT_CHANNEL;
    end
  endgenerate

  generate
    if (DEFAULT_RD_CHANNEL == -1) begin : no_default_rw_channel_assignment
      assign default_wr_channel = '0;
      assign default_rd_channel = '0;
    end
    else begin : default_rw_channel_assignment
      assign default_wr_channel = 141'b1 << DEFAULT_WR_CHANNEL;
      assign default_rd_channel = 141'b1 << DEFAULT_RD_CHANNEL;
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
    input  [126-1 : 0]    sink_data,
    input                       sink_startofpacket,
    input                       sink_endofpacket,
    output                      sink_ready,

    // -------------------
    // Command Source (Output)
    // -------------------
    output                          src_valid,
    output reg [126-1    : 0] src_data,
    output reg [141-1 : 0] src_channel,
    output                          src_startofpacket,
    output                          src_endofpacket,
    input                           src_ready
);

    // -------------------------------------------------------
    // Local parameters and variables
    // -------------------------------------------------------
    localparam PKT_ADDR_H = 56;
    localparam PKT_ADDR_L = 36;
    localparam PKT_DEST_ID_H = 101;
    localparam PKT_DEST_ID_L = 94;
    localparam PKT_PROTECTION_H = 116;
    localparam PKT_PROTECTION_L = 114;
    localparam ST_DATA_W = 126;
    localparam ST_CHANNEL_W = 141;
    localparam DECODER_TYPE = 0;

    localparam PKT_TRANS_WRITE = 59;
    localparam PKT_TRANS_READ  = 60;

    localparam PKT_ADDR_W = PKT_ADDR_H-PKT_ADDR_L + 1;
    localparam PKT_DEST_ID_W = PKT_DEST_ID_H-PKT_DEST_ID_L + 1;



    // -------------------------------------------------------
    // Figure out the number of bits to mask off for each slave span
    // during address decoding
    // -------------------------------------------------------
    localparam PAD0 = log2ceil(64'h40000 - 64'h0); 
    localparam PAD1 = log2ceil(64'h40010 - 64'h40000); 
    localparam PAD2 = log2ceil(64'h40220 - 64'h40210); 
    localparam PAD3 = log2ceil(64'h40230 - 64'h40220); 
    localparam PAD4 = log2ceil(64'h40240 - 64'h40230); 
    localparam PAD5 = log2ceil(64'h40250 - 64'h40240); 
    localparam PAD6 = log2ceil(64'h40260 - 64'h40250); 
    localparam PAD7 = log2ceil(64'h40270 - 64'h40260); 
    localparam PAD8 = log2ceil(64'h40280 - 64'h40270); 
    localparam PAD9 = log2ceil(64'h40290 - 64'h40280); 
    localparam PAD10 = log2ceil(64'h402a0 - 64'h40290); 
    localparam PAD11 = log2ceil(64'h402b0 - 64'h402a0); 
    localparam PAD12 = log2ceil(64'h402c0 - 64'h402b0); 
    localparam PAD13 = log2ceil(64'h402d0 - 64'h402c0); 
    localparam PAD14 = log2ceil(64'h402e0 - 64'h402d0); 
    localparam PAD15 = log2ceil(64'h402f0 - 64'h402e0); 
    localparam PAD16 = log2ceil(64'h40300 - 64'h402f0); 
    localparam PAD17 = log2ceil(64'h40310 - 64'h40300); 
    localparam PAD18 = log2ceil(64'h40320 - 64'h40310); 
    localparam PAD19 = log2ceil(64'h40330 - 64'h40320); 
    localparam PAD20 = log2ceil(64'h40340 - 64'h40330); 
    localparam PAD21 = log2ceil(64'h40350 - 64'h40340); 
    localparam PAD22 = log2ceil(64'h40360 - 64'h40350); 
    localparam PAD23 = log2ceil(64'h40370 - 64'h40360); 
    localparam PAD24 = log2ceil(64'h40380 - 64'h40370); 
    localparam PAD25 = log2ceil(64'h40390 - 64'h40380); 
    localparam PAD26 = log2ceil(64'h403a0 - 64'h40390); 
    localparam PAD27 = log2ceil(64'h403b0 - 64'h403a0); 
    localparam PAD28 = log2ceil(64'h405b0 - 64'h405a0); 
    localparam PAD29 = log2ceil(64'h405c0 - 64'h405b0); 
    localparam PAD30 = log2ceil(64'h405d0 - 64'h405c0); 
    localparam PAD31 = log2ceil(64'h405e0 - 64'h405d0); 
    localparam PAD32 = log2ceil(64'h405f0 - 64'h405e0); 
    localparam PAD33 = log2ceil(64'h40600 - 64'h405f0); 
    localparam PAD34 = log2ceil(64'h40610 - 64'h40600); 
    localparam PAD35 = log2ceil(64'h40620 - 64'h40610); 
    localparam PAD36 = log2ceil(64'h40630 - 64'h40620); 
    localparam PAD37 = log2ceil(64'h40640 - 64'h40630); 
    localparam PAD38 = log2ceil(64'h40650 - 64'h40640); 
    localparam PAD39 = log2ceil(64'h40660 - 64'h40650); 
    localparam PAD40 = log2ceil(64'h40670 - 64'h40660); 
    localparam PAD41 = log2ceil(64'h40680 - 64'h40670); 
    localparam PAD42 = log2ceil(64'h40690 - 64'h40680); 
    localparam PAD43 = log2ceil(64'h406a0 - 64'h40690); 
    localparam PAD44 = log2ceil(64'h406b0 - 64'h406a0); 
    localparam PAD45 = log2ceil(64'h406c0 - 64'h406b0); 
    localparam PAD46 = log2ceil(64'h406d0 - 64'h406c0); 
    localparam PAD47 = log2ceil(64'h406e0 - 64'h406d0); 
    localparam PAD48 = log2ceil(64'h406f0 - 64'h406e0); 
    localparam PAD49 = log2ceil(64'h40700 - 64'h406f0); 
    localparam PAD50 = log2ceil(64'h40710 - 64'h40700); 
    localparam PAD51 = log2ceil(64'h40720 - 64'h40710); 
    localparam PAD52 = log2ceil(64'h40730 - 64'h40720); 
    localparam PAD53 = log2ceil(64'h40740 - 64'h40730); 
    localparam PAD54 = log2ceil(64'h40750 - 64'h40740); 
    localparam PAD55 = log2ceil(64'h40960 - 64'h40950); 
    localparam PAD56 = log2ceil(64'h40970 - 64'h40960); 
    localparam PAD57 = log2ceil(64'h40980 - 64'h40970); 
    localparam PAD58 = log2ceil(64'h40990 - 64'h40980); 
    localparam PAD59 = log2ceil(64'h409a0 - 64'h40990); 
    localparam PAD60 = log2ceil(64'h409b0 - 64'h409a0); 
    localparam PAD61 = log2ceil(64'h409d0 - 64'h409c0); 
    localparam PAD62 = log2ceil(64'h409e0 - 64'h409d0); 
    localparam PAD63 = log2ceil(64'h409f0 - 64'h409e0); 
    localparam PAD64 = log2ceil(64'h40a00 - 64'h409f0); 
    localparam PAD65 = log2ceil(64'h40a10 - 64'h40a00); 
    localparam PAD66 = log2ceil(64'h40a20 - 64'h40a10); 
    localparam PAD67 = log2ceil(64'h40a30 - 64'h40a20); 
    localparam PAD68 = log2ceil(64'h40a40 - 64'h40a30); 
    localparam PAD69 = log2ceil(64'h40a50 - 64'h40a40); 
    localparam PAD70 = log2ceil(64'h40a60 - 64'h40a50); 
    localparam PAD71 = log2ceil(64'h40a70 - 64'h40a60); 
    localparam PAD72 = log2ceil(64'h40a80 - 64'h40a70); 
    localparam PAD73 = log2ceil(64'h40a90 - 64'h40a80); 
    localparam PAD74 = log2ceil(64'h40aa0 - 64'h40a90); 
    localparam PAD75 = log2ceil(64'h40ab0 - 64'h40aa0); 
    localparam PAD76 = log2ceil(64'h40ac0 - 64'h40ab0); 
    localparam PAD77 = log2ceil(64'h40ad0 - 64'h40ac0); 
    localparam PAD78 = log2ceil(64'h40ae0 - 64'h40ad0); 
    localparam PAD79 = log2ceil(64'h40af0 - 64'h40ae0); 
    localparam PAD80 = log2ceil(64'h40b00 - 64'h40af0); 
    localparam PAD81 = log2ceil(64'h40b10 - 64'h40b00); 
    localparam PAD82 = log2ceil(64'h40b20 - 64'h40b10); 
    localparam PAD83 = log2ceil(64'h40b30 - 64'h40b20); 
    localparam PAD84 = log2ceil(64'h40b40 - 64'h40b30); 
    localparam PAD85 = log2ceil(64'h40b50 - 64'h40b40); 
    localparam PAD86 = log2ceil(64'h40b60 - 64'h40b50); 
    localparam PAD87 = log2ceil(64'h40b70 - 64'h40b60); 
    localparam PAD88 = log2ceil(64'h40b80 - 64'h40b70); 
    localparam PAD89 = log2ceil(64'h40b90 - 64'h40b80); 
    localparam PAD90 = log2ceil(64'h40ba0 - 64'h40b90); 
    localparam PAD91 = log2ceil(64'h40bb0 - 64'h40ba0); 
    localparam PAD92 = log2ceil(64'h40bc0 - 64'h40bb0); 
    localparam PAD93 = log2ceil(64'h40bd0 - 64'h40bc0); 
    localparam PAD94 = log2ceil(64'h40be0 - 64'h40bd0); 
    localparam PAD95 = log2ceil(64'h40bf0 - 64'h40be0); 
    localparam PAD96 = log2ceil(64'h40c00 - 64'h40bf0); 
    localparam PAD97 = log2ceil(64'h40c10 - 64'h40c00); 
    localparam PAD98 = log2ceil(64'h40c20 - 64'h40c10); 
    localparam PAD99 = log2ceil(64'h40c30 - 64'h40c20); 
    localparam PAD100 = log2ceil(64'h40c40 - 64'h40c30); 
    localparam PAD101 = log2ceil(64'h40c50 - 64'h40c40); 
    localparam PAD102 = log2ceil(64'h40c60 - 64'h40c50); 
    localparam PAD103 = log2ceil(64'h40c70 - 64'h40c60); 
    localparam PAD104 = log2ceil(64'h40c80 - 64'h40c70); 
    localparam PAD105 = log2ceil(64'h40c90 - 64'h40c80); 
    localparam PAD106 = log2ceil(64'h40ca0 - 64'h40c90); 
    localparam PAD107 = log2ceil(64'h40cb0 - 64'h40ca0); 
    localparam PAD108 = log2ceil(64'h40cc0 - 64'h40cb0); 
    localparam PAD109 = log2ceil(64'h40cd0 - 64'h40cc0); 
    localparam PAD110 = log2ceil(64'h40ce0 - 64'h40cd0); 
    localparam PAD111 = log2ceil(64'h40cf0 - 64'h40ce0); 
    localparam PAD112 = log2ceil(64'h40d00 - 64'h40cf0); 
    localparam PAD113 = log2ceil(64'h40d10 - 64'h40d00); 
    localparam PAD114 = log2ceil(64'h40d20 - 64'h40d10); 
    localparam PAD115 = log2ceil(64'h40d30 - 64'h40d20); 
    localparam PAD116 = log2ceil(64'h40d40 - 64'h40d30); 
    localparam PAD117 = log2ceil(64'h40d50 - 64'h40d40); 
    localparam PAD118 = log2ceil(64'h40d60 - 64'h40d50); 
    localparam PAD119 = log2ceil(64'h40d70 - 64'h40d60); 
    localparam PAD120 = log2ceil(64'h40d80 - 64'h40d70); 
    localparam PAD121 = log2ceil(64'h40d90 - 64'h40d80); 
    localparam PAD122 = log2ceil(64'h40da0 - 64'h40d90); 
    localparam PAD123 = log2ceil(64'h40db0 - 64'h40da0); 
    localparam PAD124 = log2ceil(64'h40dc0 - 64'h40db0); 
    localparam PAD125 = log2ceil(64'h40dd0 - 64'h40dc0); 
    localparam PAD126 = log2ceil(64'h40de0 - 64'h40dd0); 
    localparam PAD127 = log2ceil(64'h40df0 - 64'h40de0); 
    localparam PAD128 = log2ceil(64'h40e00 - 64'h40df0); 
    localparam PAD129 = log2ceil(64'h40e10 - 64'h40e00); 
    localparam PAD130 = log2ceil(64'h40e20 - 64'h40e10); 
    localparam PAD131 = log2ceil(64'h40e30 - 64'h40e20); 
    localparam PAD132 = log2ceil(64'h40e40 - 64'h40e30); 
    localparam PAD133 = log2ceil(64'h40e50 - 64'h40e40); 
    localparam PAD134 = log2ceil(64'h40e60 - 64'h40e50); 
    localparam PAD135 = log2ceil(64'h40e70 - 64'h40e60); 
    localparam PAD136 = log2ceil(64'h40e80 - 64'h40e70); 
    localparam PAD137 = log2ceil(64'h40e90 - 64'h40e80); 
    localparam PAD138 = log2ceil(64'h40ea0 - 64'h40e90); 
    localparam PAD139 = log2ceil(64'h40eb0 - 64'h40ea0); 
    localparam PAD140 = log2ceil(64'h40ec0 - 64'h40eb0); 
    // -------------------------------------------------------
    // Work out which address bits are significant based on the
    // address range of the slaves. If the required width is too
    // large or too small, we use the address field width instead.
    // -------------------------------------------------------
    localparam ADDR_RANGE = 64'h40ec0;
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
    wire [141-1 : 0] default_src_channel;




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

    // ( 0x0 .. 0x40000 )
    if ( {address[RG:PAD0],{PAD0{1'b0}}} == 19'h0   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 108;
    end

    // ( 0x40000 .. 0x40010 )
    if ( {address[RG:PAD1],{PAD1{1'b0}}} == 19'h40000   ) begin
            src_channel = 141'b100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 50;
    end

    // ( 0x40210 .. 0x40220 )
    if ( {address[RG:PAD2],{PAD2{1'b0}}} == 19'h40210   ) begin
            src_channel = 141'b010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 65;
    end

    // ( 0x40220 .. 0x40230 )
    if ( {address[RG:PAD3],{PAD3{1'b0}}} == 19'h40220   ) begin
            src_channel = 141'b001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 64;
    end

    // ( 0x40230 .. 0x40240 )
    if ( {address[RG:PAD4],{PAD4{1'b0}}} == 19'h40230   ) begin
            src_channel = 141'b000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 62;
    end

    // ( 0x40240 .. 0x40250 )
    if ( {address[RG:PAD5],{PAD5{1'b0}}} == 19'h40240   ) begin
            src_channel = 141'b000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 61;
    end

    // ( 0x40250 .. 0x40260 )
    if ( {address[RG:PAD6],{PAD6{1'b0}}} == 19'h40250   ) begin
            src_channel = 141'b000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 60;
    end

    // ( 0x40260 .. 0x40270 )
    if ( {address[RG:PAD7],{PAD7{1'b0}}} == 19'h40260   ) begin
            src_channel = 141'b000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 59;
    end

    // ( 0x40270 .. 0x40280 )
    if ( {address[RG:PAD8],{PAD8{1'b0}}} == 19'h40270   ) begin
            src_channel = 141'b000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 58;
    end

    // ( 0x40280 .. 0x40290 )
    if ( {address[RG:PAD9],{PAD9{1'b0}}} == 19'h40280   ) begin
            src_channel = 141'b000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 57;
    end

    // ( 0x40290 .. 0x402a0 )
    if ( {address[RG:PAD10],{PAD10{1'b0}}} == 19'h40290   ) begin
            src_channel = 141'b000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 56;
    end

    // ( 0x402a0 .. 0x402b0 )
    if ( {address[RG:PAD11],{PAD11{1'b0}}} == 19'h402a0   ) begin
            src_channel = 141'b000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 55;
    end

    // ( 0x402b0 .. 0x402c0 )
    if ( {address[RG:PAD12],{PAD12{1'b0}}} == 19'h402b0   ) begin
            src_channel = 141'b000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 54;
    end

    // ( 0x402c0 .. 0x402d0 )
    if ( {address[RG:PAD13],{PAD13{1'b0}}} == 19'h402c0   ) begin
            src_channel = 141'b000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 53;
    end

    // ( 0x402d0 .. 0x402e0 )
    if ( {address[RG:PAD14],{PAD14{1'b0}}} == 19'h402d0   ) begin
            src_channel = 141'b000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 51;
    end

    // ( 0x402e0 .. 0x402f0 )
    if ( {address[RG:PAD15],{PAD15{1'b0}}} == 19'h402e0   ) begin
            src_channel = 141'b000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 49;
    end

    // ( 0x402f0 .. 0x40300 )
    if ( {address[RG:PAD16],{PAD16{1'b0}}} == 19'h402f0   ) begin
            src_channel = 141'b000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 48;
    end

    // ( 0x40300 .. 0x40310 )
    if ( {address[RG:PAD17],{PAD17{1'b0}}} == 19'h40300   ) begin
            src_channel = 141'b000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 47;
    end

    // ( 0x40310 .. 0x40320 )
    if ( {address[RG:PAD18],{PAD18{1'b0}}} == 19'h40310   ) begin
            src_channel = 141'b000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 46;
    end

    // ( 0x40320 .. 0x40330 )
    if ( {address[RG:PAD19],{PAD19{1'b0}}} == 19'h40320   ) begin
            src_channel = 141'b000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 45;
    end

    // ( 0x40330 .. 0x40340 )
    if ( {address[RG:PAD20],{PAD20{1'b0}}} == 19'h40330   ) begin
            src_channel = 141'b000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 44;
    end

    // ( 0x40340 .. 0x40350 )
    if ( {address[RG:PAD21],{PAD21{1'b0}}} == 19'h40340   ) begin
            src_channel = 141'b000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 43;
    end

    // ( 0x40350 .. 0x40360 )
    if ( {address[RG:PAD22],{PAD22{1'b0}}} == 19'h40350   ) begin
            src_channel = 141'b000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 42;
    end

    // ( 0x40360 .. 0x40370 )
    if ( {address[RG:PAD23],{PAD23{1'b0}}} == 19'h40360   ) begin
            src_channel = 141'b000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 72;
    end

    // ( 0x40370 .. 0x40380 )
    if ( {address[RG:PAD24],{PAD24{1'b0}}} == 19'h40370   ) begin
            src_channel = 141'b000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 71;
    end

    // ( 0x40380 .. 0x40390 )
    if ( {address[RG:PAD25],{PAD25{1'b0}}} == 19'h40380   ) begin
            src_channel = 141'b000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 70;
    end

    // ( 0x40390 .. 0x403a0 )
    if ( {address[RG:PAD26],{PAD26{1'b0}}} == 19'h40390   ) begin
            src_channel = 141'b000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 69;
    end

    // ( 0x403a0 .. 0x403b0 )
    if ( {address[RG:PAD27],{PAD27{1'b0}}} == 19'h403a0   ) begin
            src_channel = 141'b000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 68;
    end

    // ( 0x405a0 .. 0x405b0 )
    if ( {address[RG:PAD28],{PAD28{1'b0}}} == 19'h405a0   ) begin
            src_channel = 141'b000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 97;
    end

    // ( 0x405b0 .. 0x405c0 )
    if ( {address[RG:PAD29],{PAD29{1'b0}}} == 19'h405b0   ) begin
            src_channel = 141'b000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 96;
    end

    // ( 0x405c0 .. 0x405d0 )
    if ( {address[RG:PAD30],{PAD30{1'b0}}} == 19'h405c0   ) begin
            src_channel = 141'b000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 94;
    end

    // ( 0x405d0 .. 0x405e0 )
    if ( {address[RG:PAD31],{PAD31{1'b0}}} == 19'h405d0   ) begin
            src_channel = 141'b000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 93;
    end

    // ( 0x405e0 .. 0x405f0 )
    if ( {address[RG:PAD32],{PAD32{1'b0}}} == 19'h405e0   ) begin
            src_channel = 141'b000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 92;
    end

    // ( 0x405f0 .. 0x40600 )
    if ( {address[RG:PAD33],{PAD33{1'b0}}} == 19'h405f0   ) begin
            src_channel = 141'b000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 91;
    end

    // ( 0x40600 .. 0x40610 )
    if ( {address[RG:PAD34],{PAD34{1'b0}}} == 19'h40600   ) begin
            src_channel = 141'b000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 90;
    end

    // ( 0x40610 .. 0x40620 )
    if ( {address[RG:PAD35],{PAD35{1'b0}}} == 19'h40610   ) begin
            src_channel = 141'b000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 89;
    end

    // ( 0x40620 .. 0x40630 )
    if ( {address[RG:PAD36],{PAD36{1'b0}}} == 19'h40620   ) begin
            src_channel = 141'b000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 88;
    end

    // ( 0x40630 .. 0x40640 )
    if ( {address[RG:PAD37],{PAD37{1'b0}}} == 19'h40630   ) begin
            src_channel = 141'b000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 87;
    end

    // ( 0x40640 .. 0x40650 )
    if ( {address[RG:PAD38],{PAD38{1'b0}}} == 19'h40640   ) begin
            src_channel = 141'b000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 86;
    end

    // ( 0x40650 .. 0x40660 )
    if ( {address[RG:PAD39],{PAD39{1'b0}}} == 19'h40650   ) begin
            src_channel = 141'b000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 85;
    end

    // ( 0x40660 .. 0x40670 )
    if ( {address[RG:PAD40],{PAD40{1'b0}}} == 19'h40660   ) begin
            src_channel = 141'b000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 83;
    end

    // ( 0x40670 .. 0x40680 )
    if ( {address[RG:PAD41],{PAD41{1'b0}}} == 19'h40670   ) begin
            src_channel = 141'b000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 82;
    end

    // ( 0x40680 .. 0x40690 )
    if ( {address[RG:PAD42],{PAD42{1'b0}}} == 19'h40680   ) begin
            src_channel = 141'b000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 81;
    end

    // ( 0x40690 .. 0x406a0 )
    if ( {address[RG:PAD43],{PAD43{1'b0}}} == 19'h40690   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 80;
    end

    // ( 0x406a0 .. 0x406b0 )
    if ( {address[RG:PAD44],{PAD44{1'b0}}} == 19'h406a0   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 79;
    end

    // ( 0x406b0 .. 0x406c0 )
    if ( {address[RG:PAD45],{PAD45{1'b0}}} == 19'h406b0   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 78;
    end

    // ( 0x406c0 .. 0x406d0 )
    if ( {address[RG:PAD46],{PAD46{1'b0}}} == 19'h406c0   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 77;
    end

    // ( 0x406d0 .. 0x406e0 )
    if ( {address[RG:PAD47],{PAD47{1'b0}}} == 19'h406d0   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 76;
    end

    // ( 0x406e0 .. 0x406f0 )
    if ( {address[RG:PAD48],{PAD48{1'b0}}} == 19'h406e0   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 75;
    end

    // ( 0x406f0 .. 0x40700 )
    if ( {address[RG:PAD49],{PAD49{1'b0}}} == 19'h406f0   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 74;
    end

    // ( 0x40700 .. 0x40710 )
    if ( {address[RG:PAD50],{PAD50{1'b0}}} == 19'h40700   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 104;
    end

    // ( 0x40710 .. 0x40720 )
    if ( {address[RG:PAD51],{PAD51{1'b0}}} == 19'h40710   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 103;
    end

    // ( 0x40720 .. 0x40730 )
    if ( {address[RG:PAD52],{PAD52{1'b0}}} == 19'h40720   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 102;
    end

    // ( 0x40730 .. 0x40740 )
    if ( {address[RG:PAD53],{PAD53{1'b0}}} == 19'h40730   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 101;
    end

    // ( 0x40740 .. 0x40750 )
    if ( {address[RG:PAD54],{PAD54{1'b0}}} == 19'h40740   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 100;
    end

    // ( 0x40950 .. 0x40960 )
    if ( {address[RG:PAD55],{PAD55{1'b0}}} == 19'h40950   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 133;
    end

    // ( 0x40960 .. 0x40970 )
    if ( {address[RG:PAD56],{PAD56{1'b0}}} == 19'h40960   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 132;
    end

    // ( 0x40970 .. 0x40980 )
    if ( {address[RG:PAD57],{PAD57{1'b0}}} == 19'h40970   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 130;
    end

    // ( 0x40980 .. 0x40990 )
    if ( {address[RG:PAD58],{PAD58{1'b0}}} == 19'h40980   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 129;
    end

    // ( 0x40990 .. 0x409a0 )
    if ( {address[RG:PAD59],{PAD59{1'b0}}} == 19'h40990   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 128;
    end

    // ( 0x409a0 .. 0x409b0 )
    if ( {address[RG:PAD60],{PAD60{1'b0}}} == 19'h409a0   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 127;
    end

    // ( 0x409c0 .. 0x409d0 )
    if ( {address[RG:PAD61],{PAD61{1'b0}}} == 19'h409c0   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 126;
    end

    // ( 0x409d0 .. 0x409e0 )
    if ( {address[RG:PAD62],{PAD62{1'b0}}} == 19'h409d0   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 125;
    end

    // ( 0x409e0 .. 0x409f0 )
    if ( {address[RG:PAD63],{PAD63{1'b0}}} == 19'h409e0   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 124;
    end

    // ( 0x409f0 .. 0x40a00 )
    if ( {address[RG:PAD64],{PAD64{1'b0}}} == 19'h409f0   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 123;
    end

    // ( 0x40a00 .. 0x40a10 )
    if ( {address[RG:PAD65],{PAD65{1'b0}}} == 19'h40a00   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 122;
    end

    // ( 0x40a10 .. 0x40a20 )
    if ( {address[RG:PAD66],{PAD66{1'b0}}} == 19'h40a10   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 121;
    end

    // ( 0x40a20 .. 0x40a30 )
    if ( {address[RG:PAD67],{PAD67{1'b0}}} == 19'h40a20   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 119;
    end

    // ( 0x40a30 .. 0x40a40 )
    if ( {address[RG:PAD68],{PAD68{1'b0}}} == 19'h40a30   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 118;
    end

    // ( 0x40a40 .. 0x40a50 )
    if ( {address[RG:PAD69],{PAD69{1'b0}}} == 19'h40a40   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 117;
    end

    // ( 0x40a50 .. 0x40a60 )
    if ( {address[RG:PAD70],{PAD70{1'b0}}} == 19'h40a50   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 116;
    end

    // ( 0x40a60 .. 0x40a70 )
    if ( {address[RG:PAD71],{PAD71{1'b0}}} == 19'h40a60   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 115;
    end

    // ( 0x40a70 .. 0x40a80 )
    if ( {address[RG:PAD72],{PAD72{1'b0}}} == 19'h40a70   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 114;
    end

    // ( 0x40a80 .. 0x40a90 )
    if ( {address[RG:PAD73],{PAD73{1'b0}}} == 19'h40a80   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 113;
    end

    // ( 0x40a90 .. 0x40aa0 )
    if ( {address[RG:PAD74],{PAD74{1'b0}}} == 19'h40a90   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 112;
    end

    // ( 0x40aa0 .. 0x40ab0 )
    if ( {address[RG:PAD75],{PAD75{1'b0}}} == 19'h40aa0   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 111;
    end

    // ( 0x40ab0 .. 0x40ac0 )
    if ( {address[RG:PAD76],{PAD76{1'b0}}} == 19'h40ab0   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 110;
    end

    // ( 0x40ac0 .. 0x40ad0 )
    if ( {address[RG:PAD77],{PAD77{1'b0}}} == 19'h40ac0   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 140;
    end

    // ( 0x40ad0 .. 0x40ae0 )
    if ( {address[RG:PAD78],{PAD78{1'b0}}} == 19'h40ad0   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 139;
    end

    // ( 0x40ae0 .. 0x40af0 )
    if ( {address[RG:PAD79],{PAD79{1'b0}}} == 19'h40ae0   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 138;
    end

    // ( 0x40af0 .. 0x40b00 )
    if ( {address[RG:PAD80],{PAD80{1'b0}}} == 19'h40af0   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 137;
    end

    // ( 0x40b00 .. 0x40b10 )
    if ( {address[RG:PAD81],{PAD81{1'b0}}} == 19'h40b00   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 136;
    end

    // ( 0x40b10 .. 0x40b20 )
    if ( {address[RG:PAD82],{PAD82{1'b0}}} == 19'h40b10   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 106;
    end

    // ( 0x40b20 .. 0x40b30 )
    if ( {address[RG:PAD83],{PAD83{1'b0}}} == 19'h40b20   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 135;
    end

    // ( 0x40b30 .. 0x40b40 )
    if ( {address[RG:PAD84],{PAD84{1'b0}}} == 19'h40b30   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 67;
    end

    // ( 0x40b40 .. 0x40b50 )
    if ( {address[RG:PAD85],{PAD85{1'b0}}} == 19'h40b40   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 99;
    end

    // ( 0x40b50 .. 0x40b60 )
    if ( {address[RG:PAD86],{PAD86{1'b0}}} == 19'h40b50   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 134;
    end

    // ( 0x40b60 .. 0x40b70 )
    if ( {address[RG:PAD87],{PAD87{1'b0}}} == 19'h40b60   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 131;
    end

    // ( 0x40b70 .. 0x40b80 )
    if ( {address[RG:PAD88],{PAD88{1'b0}}} == 19'h40b70   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 120;
    end

    // ( 0x40b80 .. 0x40b90 )
    if ( {address[RG:PAD89],{PAD89{1'b0}}} == 19'h40b80   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 109;
    end

    // ( 0x40b90 .. 0x40ba0 )
    if ( {address[RG:PAD90],{PAD90{1'b0}}} == 19'h40b90   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 66;
    end

    // ( 0x40ba0 .. 0x40bb0 )
    if ( {address[RG:PAD91],{PAD91{1'b0}}} == 19'h40ba0   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 63;
    end

    // ( 0x40bb0 .. 0x40bc0 )
    if ( {address[RG:PAD92],{PAD92{1'b0}}} == 19'h40bb0   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 52;
    end

    // ( 0x40bc0 .. 0x40bd0 )
    if ( {address[RG:PAD93],{PAD93{1'b0}}} == 19'h40bc0   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 41;
    end

    // ( 0x40bd0 .. 0x40be0 )
    if ( {address[RG:PAD94],{PAD94{1'b0}}} == 19'h40bd0   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 98;
    end

    // ( 0x40be0 .. 0x40bf0 )
    if ( {address[RG:PAD95],{PAD95{1'b0}}} == 19'h40be0   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 95;
    end

    // ( 0x40bf0 .. 0x40c00 )
    if ( {address[RG:PAD96],{PAD96{1'b0}}} == 19'h40bf0   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 84;
    end

    // ( 0x40c00 .. 0x40c10 )
    if ( {address[RG:PAD97],{PAD97{1'b0}}} == 19'h40c00   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 73;
    end

    // ( 0x40c10 .. 0x40c20 )
    if ( {address[RG:PAD98],{PAD98{1'b0}}} == 19'h40c10  && read_transaction  ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 40;
    end

    // ( 0x40c20 .. 0x40c30 )
    if ( {address[RG:PAD99],{PAD99{1'b0}}} == 19'h40c20  && read_transaction  ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 39;
    end

    // ( 0x40c30 .. 0x40c40 )
    if ( {address[RG:PAD100],{PAD100{1'b0}}} == 19'h40c30  && read_transaction  ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 38;
    end

    // ( 0x40c40 .. 0x40c50 )
    if ( {address[RG:PAD101],{PAD101{1'b0}}} == 19'h40c40  && read_transaction  ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 37;
    end

    // ( 0x40c50 .. 0x40c60 )
    if ( {address[RG:PAD102],{PAD102{1'b0}}} == 19'h40c50  && read_transaction  ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 36;
    end

    // ( 0x40c60 .. 0x40c70 )
    if ( {address[RG:PAD103],{PAD103{1'b0}}} == 19'h40c60  && read_transaction  ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 35;
    end

    // ( 0x40c70 .. 0x40c80 )
    if ( {address[RG:PAD104],{PAD104{1'b0}}} == 19'h40c70  && read_transaction  ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 34;
    end

    // ( 0x40c80 .. 0x40c90 )
    if ( {address[RG:PAD105],{PAD105{1'b0}}} == 19'h40c80  && read_transaction  ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 33;
    end

    // ( 0x40c90 .. 0x40ca0 )
    if ( {address[RG:PAD106],{PAD106{1'b0}}} == 19'h40c90   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 32;
    end

    // ( 0x40ca0 .. 0x40cb0 )
    if ( {address[RG:PAD107],{PAD107{1'b0}}} == 19'h40ca0  && read_transaction  ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 105;
    end

    // ( 0x40cb0 .. 0x40cc0 )
    if ( {address[RG:PAD108],{PAD108{1'b0}}} == 19'h40cb0  && read_transaction  ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 31;
    end

    // ( 0x40cc0 .. 0x40cd0 )
    if ( {address[RG:PAD109],{PAD109{1'b0}}} == 19'h40cc0   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 107;
    end

    // ( 0x40cd0 .. 0x40ce0 )
    if ( {address[RG:PAD110],{PAD110{1'b0}}} == 19'h40cd0   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 23;
    end

    // ( 0x40ce0 .. 0x40cf0 )
    if ( {address[RG:PAD111],{PAD111{1'b0}}} == 19'h40ce0   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 21;
    end

    // ( 0x40cf0 .. 0x40d00 )
    if ( {address[RG:PAD112],{PAD112{1'b0}}} == 19'h40cf0   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 20;
    end

    // ( 0x40d00 .. 0x40d10 )
    if ( {address[RG:PAD113],{PAD113{1'b0}}} == 19'h40d00   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 19;
    end

    // ( 0x40d10 .. 0x40d20 )
    if ( {address[RG:PAD114],{PAD114{1'b0}}} == 19'h40d10   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 18;
    end

    // ( 0x40d20 .. 0x40d30 )
    if ( {address[RG:PAD115],{PAD115{1'b0}}} == 19'h40d20   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 17;
    end

    // ( 0x40d30 .. 0x40d40 )
    if ( {address[RG:PAD116],{PAD116{1'b0}}} == 19'h40d30   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 16;
    end

    // ( 0x40d40 .. 0x40d50 )
    if ( {address[RG:PAD117],{PAD117{1'b0}}} == 19'h40d40   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 15;
    end

    // ( 0x40d50 .. 0x40d60 )
    if ( {address[RG:PAD118],{PAD118{1'b0}}} == 19'h40d50   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 14;
    end

    // ( 0x40d60 .. 0x40d70 )
    if ( {address[RG:PAD119],{PAD119{1'b0}}} == 19'h40d60   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 13;
    end

    // ( 0x40d70 .. 0x40d80 )
    if ( {address[RG:PAD120],{PAD120{1'b0}}} == 19'h40d70   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 12;
    end

    // ( 0x40d80 .. 0x40d90 )
    if ( {address[RG:PAD121],{PAD121{1'b0}}} == 19'h40d80   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 10;
    end

    // ( 0x40d90 .. 0x40da0 )
    if ( {address[RG:PAD122],{PAD122{1'b0}}} == 19'h40d90   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 9;
    end

    // ( 0x40da0 .. 0x40db0 )
    if ( {address[RG:PAD123],{PAD123{1'b0}}} == 19'h40da0   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 8;
    end

    // ( 0x40db0 .. 0x40dc0 )
    if ( {address[RG:PAD124],{PAD124{1'b0}}} == 19'h40db0   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 7;
    end

    // ( 0x40dc0 .. 0x40dd0 )
    if ( {address[RG:PAD125],{PAD125{1'b0}}} == 19'h40dc0   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 6;
    end

    // ( 0x40dd0 .. 0x40de0 )
    if ( {address[RG:PAD126],{PAD126{1'b0}}} == 19'h40dd0   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 5;
    end

    // ( 0x40de0 .. 0x40df0 )
    if ( {address[RG:PAD127],{PAD127{1'b0}}} == 19'h40de0   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 4;
    end

    // ( 0x40df0 .. 0x40e00 )
    if ( {address[RG:PAD128],{PAD128{1'b0}}} == 19'h40df0   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 3;
    end

    // ( 0x40e00 .. 0x40e10 )
    if ( {address[RG:PAD129],{PAD129{1'b0}}} == 19'h40e00   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 2;
    end

    // ( 0x40e10 .. 0x40e20 )
    if ( {address[RG:PAD130],{PAD130{1'b0}}} == 19'h40e10   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 1;
    end

    // ( 0x40e20 .. 0x40e30 )
    if ( {address[RG:PAD131],{PAD131{1'b0}}} == 19'h40e20   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 30;
    end

    // ( 0x40e30 .. 0x40e40 )
    if ( {address[RG:PAD132],{PAD132{1'b0}}} == 19'h40e30   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 29;
    end

    // ( 0x40e40 .. 0x40e50 )
    if ( {address[RG:PAD133],{PAD133{1'b0}}} == 19'h40e40   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 28;
    end

    // ( 0x40e50 .. 0x40e60 )
    if ( {address[RG:PAD134],{PAD134{1'b0}}} == 19'h40e50   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 27;
    end

    // ( 0x40e60 .. 0x40e70 )
    if ( {address[RG:PAD135],{PAD135{1'b0}}} == 19'h40e60   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 26;
    end

    // ( 0x40e70 .. 0x40e80 )
    if ( {address[RG:PAD136],{PAD136{1'b0}}} == 19'h40e70   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 25;
    end

    // ( 0x40e80 .. 0x40e90 )
    if ( {address[RG:PAD137],{PAD137{1'b0}}} == 19'h40e80   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 24;
    end

    // ( 0x40e90 .. 0x40ea0 )
    if ( {address[RG:PAD138],{PAD138{1'b0}}} == 19'h40e90   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 22;
    end

    // ( 0x40ea0 .. 0x40eb0 )
    if ( {address[RG:PAD139],{PAD139{1'b0}}} == 19'h40ea0   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 11;
    end

    // ( 0x40eb0 .. 0x40ec0 )
    if ( {address[RG:PAD140],{PAD140{1'b0}}} == 19'h40eb0   ) begin
            src_channel = 141'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001;
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


