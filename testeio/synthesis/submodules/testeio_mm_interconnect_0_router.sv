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
               DEFAULT_DESTID = 54 
   )
  (output [97 - 92 : 0] default_destination_id,
   output [60-1 : 0] default_wr_channel,
   output [60-1 : 0] default_rd_channel,
   output [60-1 : 0] default_src_channel
  );

  assign default_destination_id = 
    DEFAULT_DESTID[97 - 92 : 0];

  generate
    if (DEFAULT_CHANNEL == -1) begin : no_default_channel_assignment
      assign default_src_channel = '0;
    end
    else begin : default_channel_assignment
      assign default_src_channel = 60'b1 << DEFAULT_CHANNEL;
    end
  endgenerate

  generate
    if (DEFAULT_RD_CHANNEL == -1) begin : no_default_rw_channel_assignment
      assign default_wr_channel = '0;
      assign default_rd_channel = '0;
    end
    else begin : default_rw_channel_assignment
      assign default_wr_channel = 60'b1 << DEFAULT_WR_CHANNEL;
      assign default_rd_channel = 60'b1 << DEFAULT_RD_CHANNEL;
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
    input  [122-1 : 0]    sink_data,
    input                       sink_startofpacket,
    input                       sink_endofpacket,
    output                      sink_ready,

    // -------------------
    // Command Source (Output)
    // -------------------
    output                          src_valid,
    output reg [122-1    : 0] src_data,
    output reg [60-1 : 0] src_channel,
    output                          src_startofpacket,
    output                          src_endofpacket,
    input                           src_ready
);

    // -------------------------------------------------------
    // Local parameters and variables
    // -------------------------------------------------------
    localparam PKT_ADDR_H = 56;
    localparam PKT_ADDR_L = 36;
    localparam PKT_DEST_ID_H = 97;
    localparam PKT_DEST_ID_L = 92;
    localparam PKT_PROTECTION_H = 112;
    localparam PKT_PROTECTION_L = 110;
    localparam ST_DATA_W = 122;
    localparam ST_CHANNEL_W = 60;
    localparam DECODER_TYPE = 0;

    localparam PKT_TRANS_WRITE = 59;
    localparam PKT_TRANS_READ  = 60;

    localparam PKT_ADDR_W = PKT_ADDR_H-PKT_ADDR_L + 1;
    localparam PKT_DEST_ID_W = PKT_DEST_ID_H-PKT_DEST_ID_L + 1;



    // -------------------------------------------------------
    // Figure out the number of bits to mask off for each slave span
    // during address decoding
    // -------------------------------------------------------
    localparam PAD0 = log2ceil(64'h10000 - 64'h0); 
    localparam PAD1 = log2ceil(64'h10010 - 64'h10000); 
    localparam PAD2 = log2ceil(64'h10020 - 64'h10010); 
    localparam PAD3 = log2ceil(64'h10030 - 64'h10020); 
    localparam PAD4 = log2ceil(64'h10040 - 64'h10030); 
    localparam PAD5 = log2ceil(64'h10050 - 64'h10040); 
    localparam PAD6 = log2ceil(64'h10060 - 64'h10050); 
    localparam PAD7 = log2ceil(64'h10070 - 64'h10060); 
    localparam PAD8 = log2ceil(64'h10080 - 64'h10070); 
    localparam PAD9 = log2ceil(64'h10090 - 64'h10080); 
    localparam PAD10 = log2ceil(64'h100a0 - 64'h10090); 
    localparam PAD11 = log2ceil(64'h100b0 - 64'h100a0); 
    localparam PAD12 = log2ceil(64'h100c0 - 64'h100b0); 
    localparam PAD13 = log2ceil(64'h100d0 - 64'h100c0); 
    localparam PAD14 = log2ceil(64'h100e0 - 64'h100d0); 
    localparam PAD15 = log2ceil(64'h100f0 - 64'h100e0); 
    localparam PAD16 = log2ceil(64'h10100 - 64'h100f0); 
    localparam PAD17 = log2ceil(64'h10110 - 64'h10100); 
    localparam PAD18 = log2ceil(64'h10120 - 64'h10110); 
    localparam PAD19 = log2ceil(64'h10130 - 64'h10120); 
    localparam PAD20 = log2ceil(64'h10140 - 64'h10130); 
    localparam PAD21 = log2ceil(64'h10150 - 64'h10140); 
    localparam PAD22 = log2ceil(64'h10160 - 64'h10150); 
    localparam PAD23 = log2ceil(64'h10170 - 64'h10160); 
    localparam PAD24 = log2ceil(64'h10180 - 64'h10170); 
    localparam PAD25 = log2ceil(64'h10190 - 64'h10180); 
    localparam PAD26 = log2ceil(64'h101a0 - 64'h10190); 
    localparam PAD27 = log2ceil(64'h101b0 - 64'h101a0); 
    localparam PAD28 = log2ceil(64'h101c0 - 64'h101b0); 
    localparam PAD29 = log2ceil(64'h101d0 - 64'h101c0); 
    localparam PAD30 = log2ceil(64'h101e0 - 64'h101d0); 
    localparam PAD31 = log2ceil(64'h101f0 - 64'h101e0); 
    localparam PAD32 = log2ceil(64'h10200 - 64'h101f0); 
    localparam PAD33 = log2ceil(64'h10210 - 64'h10200); 
    localparam PAD34 = log2ceil(64'h10220 - 64'h10210); 
    localparam PAD35 = log2ceil(64'h10230 - 64'h10220); 
    localparam PAD36 = log2ceil(64'h10240 - 64'h10230); 
    localparam PAD37 = log2ceil(64'h10250 - 64'h10240); 
    localparam PAD38 = log2ceil(64'h10260 - 64'h10250); 
    localparam PAD39 = log2ceil(64'h10270 - 64'h10260); 
    localparam PAD40 = log2ceil(64'h10280 - 64'h10270); 
    localparam PAD41 = log2ceil(64'h10290 - 64'h10280); 
    localparam PAD42 = log2ceil(64'h102a0 - 64'h10290); 
    localparam PAD43 = log2ceil(64'h102b0 - 64'h102a0); 
    localparam PAD44 = log2ceil(64'h102c0 - 64'h102b0); 
    localparam PAD45 = log2ceil(64'h102d0 - 64'h102c0); 
    localparam PAD46 = log2ceil(64'h102e0 - 64'h102d0); 
    localparam PAD47 = log2ceil(64'h102f0 - 64'h102e0); 
    localparam PAD48 = log2ceil(64'h10300 - 64'h102f0); 
    localparam PAD49 = log2ceil(64'h10310 - 64'h10300); 
    localparam PAD50 = log2ceil(64'h10320 - 64'h10310); 
    localparam PAD51 = log2ceil(64'h10330 - 64'h10320); 
    localparam PAD52 = log2ceil(64'h10340 - 64'h10330); 
    localparam PAD53 = log2ceil(64'h10350 - 64'h10340); 
    localparam PAD54 = log2ceil(64'h10360 - 64'h10350); 
    localparam PAD55 = log2ceil(64'h10370 - 64'h10360); 
    localparam PAD56 = log2ceil(64'h10380 - 64'h10370); 
    localparam PAD57 = log2ceil(64'h10390 - 64'h10380); 
    localparam PAD58 = log2ceil(64'h103a0 - 64'h10390); 
    localparam PAD59 = log2ceil(64'h103b0 - 64'h103a0); 
    // -------------------------------------------------------
    // Work out which address bits are significant based on the
    // address range of the slaves. If the required width is too
    // large or too small, we use the address field width instead.
    // -------------------------------------------------------
    localparam ADDR_RANGE = 64'h103b0;
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
    wire [60-1 : 0] default_src_channel;




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

    // ( 0x0 .. 0x10000 )
    if ( {address[RG:PAD0],{PAD0{1'b0}}} == 17'h0   ) begin
            src_channel = 60'b100000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 54;
    end

    // ( 0x10000 .. 0x10010 )
    if ( {address[RG:PAD1],{PAD1{1'b0}}} == 17'h10000   ) begin
            src_channel = 60'b010000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 52;
    end

    // ( 0x10010 .. 0x10020 )
    if ( {address[RG:PAD2],{PAD2{1'b0}}} == 17'h10010   ) begin
            src_channel = 60'b001000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 59;
    end

    // ( 0x10020 .. 0x10030 )
    if ( {address[RG:PAD3],{PAD3{1'b0}}} == 17'h10020   ) begin
            src_channel = 60'b000100000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 45;
    end

    // ( 0x10030 .. 0x10040 )
    if ( {address[RG:PAD4],{PAD4{1'b0}}} == 17'h10030   ) begin
            src_channel = 60'b000010000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 50;
    end

    // ( 0x10040 .. 0x10050 )
    if ( {address[RG:PAD5],{PAD5{1'b0}}} == 17'h10040   ) begin
            src_channel = 60'b000001000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 58;
    end

    // ( 0x10050 .. 0x10060 )
    if ( {address[RG:PAD6],{PAD6{1'b0}}} == 17'h10050   ) begin
            src_channel = 60'b000000100000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 57;
    end

    // ( 0x10060 .. 0x10070 )
    if ( {address[RG:PAD7],{PAD7{1'b0}}} == 17'h10060   ) begin
            src_channel = 60'b000000010000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 56;
    end

    // ( 0x10070 .. 0x10080 )
    if ( {address[RG:PAD8],{PAD8{1'b0}}} == 17'h10070   ) begin
            src_channel = 60'b000000001000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 55;
    end

    // ( 0x10080 .. 0x10090 )
    if ( {address[RG:PAD9],{PAD9{1'b0}}} == 17'h10080   ) begin
            src_channel = 60'b000000000100000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 44;
    end

    // ( 0x10090 .. 0x100a0 )
    if ( {address[RG:PAD10],{PAD10{1'b0}}} == 17'h10090   ) begin
            src_channel = 60'b000000000010000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 43;
    end

    // ( 0x100a0 .. 0x100b0 )
    if ( {address[RG:PAD11],{PAD11{1'b0}}} == 17'h100a0   ) begin
            src_channel = 60'b000000000001000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 42;
    end

    // ( 0x100b0 .. 0x100c0 )
    if ( {address[RG:PAD12],{PAD12{1'b0}}} == 17'h100b0   ) begin
            src_channel = 60'b000000000000100000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 41;
    end

    // ( 0x100c0 .. 0x100d0 )
    if ( {address[RG:PAD13],{PAD13{1'b0}}} == 17'h100c0   ) begin
            src_channel = 60'b000000000000010000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 49;
    end

    // ( 0x100d0 .. 0x100e0 )
    if ( {address[RG:PAD14],{PAD14{1'b0}}} == 17'h100d0   ) begin
            src_channel = 60'b000000000000001000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 48;
    end

    // ( 0x100e0 .. 0x100f0 )
    if ( {address[RG:PAD15],{PAD15{1'b0}}} == 17'h100e0   ) begin
            src_channel = 60'b000000000000000100000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 47;
    end

    // ( 0x100f0 .. 0x10100 )
    if ( {address[RG:PAD16],{PAD16{1'b0}}} == 17'h100f0   ) begin
            src_channel = 60'b000000000000000010000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 46;
    end

    // ( 0x10100 .. 0x10110 )
    if ( {address[RG:PAD17],{PAD17{1'b0}}} == 17'h10100  && read_transaction  ) begin
            src_channel = 60'b000000000000000001000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 40;
    end

    // ( 0x10110 .. 0x10120 )
    if ( {address[RG:PAD18],{PAD18{1'b0}}} == 17'h10110  && read_transaction  ) begin
            src_channel = 60'b000000000000000000100000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 39;
    end

    // ( 0x10120 .. 0x10130 )
    if ( {address[RG:PAD19],{PAD19{1'b0}}} == 17'h10120  && read_transaction  ) begin
            src_channel = 60'b000000000000000000010000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 38;
    end

    // ( 0x10130 .. 0x10140 )
    if ( {address[RG:PAD20],{PAD20{1'b0}}} == 17'h10130  && read_transaction  ) begin
            src_channel = 60'b000000000000000000001000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 37;
    end

    // ( 0x10140 .. 0x10150 )
    if ( {address[RG:PAD21],{PAD21{1'b0}}} == 17'h10140  && read_transaction  ) begin
            src_channel = 60'b000000000000000000000100000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 36;
    end

    // ( 0x10150 .. 0x10160 )
    if ( {address[RG:PAD22],{PAD22{1'b0}}} == 17'h10150  && read_transaction  ) begin
            src_channel = 60'b000000000000000000000010000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 35;
    end

    // ( 0x10160 .. 0x10170 )
    if ( {address[RG:PAD23],{PAD23{1'b0}}} == 17'h10160  && read_transaction  ) begin
            src_channel = 60'b000000000000000000000001000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 34;
    end

    // ( 0x10170 .. 0x10180 )
    if ( {address[RG:PAD24],{PAD24{1'b0}}} == 17'h10170  && read_transaction  ) begin
            src_channel = 60'b000000000000000000000000100000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 33;
    end

    // ( 0x10180 .. 0x10190 )
    if ( {address[RG:PAD25],{PAD25{1'b0}}} == 17'h10180   ) begin
            src_channel = 60'b000000000000000000000000010000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 32;
    end

    // ( 0x10190 .. 0x101a0 )
    if ( {address[RG:PAD26],{PAD26{1'b0}}} == 17'h10190  && read_transaction  ) begin
            src_channel = 60'b000000000000000000000000001000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 51;
    end

    // ( 0x101a0 .. 0x101b0 )
    if ( {address[RG:PAD27],{PAD27{1'b0}}} == 17'h101a0  && read_transaction  ) begin
            src_channel = 60'b000000000000000000000000000100000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 31;
    end

    // ( 0x101b0 .. 0x101c0 )
    if ( {address[RG:PAD28],{PAD28{1'b0}}} == 17'h101b0   ) begin
            src_channel = 60'b000000000000000000000000000010000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 53;
    end

    // ( 0x101c0 .. 0x101d0 )
    if ( {address[RG:PAD29],{PAD29{1'b0}}} == 17'h101c0   ) begin
            src_channel = 60'b000000000000000000000000000001000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 23;
    end

    // ( 0x101d0 .. 0x101e0 )
    if ( {address[RG:PAD30],{PAD30{1'b0}}} == 17'h101d0   ) begin
            src_channel = 60'b000000000000000000000000000000100000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 21;
    end

    // ( 0x101e0 .. 0x101f0 )
    if ( {address[RG:PAD31],{PAD31{1'b0}}} == 17'h101e0   ) begin
            src_channel = 60'b000000000000000000000000000000010000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 20;
    end

    // ( 0x101f0 .. 0x10200 )
    if ( {address[RG:PAD32],{PAD32{1'b0}}} == 17'h101f0   ) begin
            src_channel = 60'b000000000000000000000000000000001000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 19;
    end

    // ( 0x10200 .. 0x10210 )
    if ( {address[RG:PAD33],{PAD33{1'b0}}} == 17'h10200   ) begin
            src_channel = 60'b000000000000000000000000000000000100000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 18;
    end

    // ( 0x10210 .. 0x10220 )
    if ( {address[RG:PAD34],{PAD34{1'b0}}} == 17'h10210   ) begin
            src_channel = 60'b000000000000000000000000000000000010000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 17;
    end

    // ( 0x10220 .. 0x10230 )
    if ( {address[RG:PAD35],{PAD35{1'b0}}} == 17'h10220   ) begin
            src_channel = 60'b000000000000000000000000000000000001000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 16;
    end

    // ( 0x10230 .. 0x10240 )
    if ( {address[RG:PAD36],{PAD36{1'b0}}} == 17'h10230   ) begin
            src_channel = 60'b000000000000000000000000000000000000100000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 15;
    end

    // ( 0x10240 .. 0x10250 )
    if ( {address[RG:PAD37],{PAD37{1'b0}}} == 17'h10240   ) begin
            src_channel = 60'b000000000000000000000000000000000000010000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 14;
    end

    // ( 0x10250 .. 0x10260 )
    if ( {address[RG:PAD38],{PAD38{1'b0}}} == 17'h10250   ) begin
            src_channel = 60'b000000000000000000000000000000000000001000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 13;
    end

    // ( 0x10260 .. 0x10270 )
    if ( {address[RG:PAD39],{PAD39{1'b0}}} == 17'h10260   ) begin
            src_channel = 60'b000000000000000000000000000000000000000100000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 12;
    end

    // ( 0x10270 .. 0x10280 )
    if ( {address[RG:PAD40],{PAD40{1'b0}}} == 17'h10270   ) begin
            src_channel = 60'b000000000000000000000000000000000000000010000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 10;
    end

    // ( 0x10280 .. 0x10290 )
    if ( {address[RG:PAD41],{PAD41{1'b0}}} == 17'h10280   ) begin
            src_channel = 60'b000000000000000000000000000000000000000001000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 9;
    end

    // ( 0x10290 .. 0x102a0 )
    if ( {address[RG:PAD42],{PAD42{1'b0}}} == 17'h10290   ) begin
            src_channel = 60'b000000000000000000000000000000000000000000100000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 8;
    end

    // ( 0x102a0 .. 0x102b0 )
    if ( {address[RG:PAD43],{PAD43{1'b0}}} == 17'h102a0   ) begin
            src_channel = 60'b000000000000000000000000000000000000000000010000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 7;
    end

    // ( 0x102b0 .. 0x102c0 )
    if ( {address[RG:PAD44],{PAD44{1'b0}}} == 17'h102b0   ) begin
            src_channel = 60'b000000000000000000000000000000000000000000001000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 6;
    end

    // ( 0x102c0 .. 0x102d0 )
    if ( {address[RG:PAD45],{PAD45{1'b0}}} == 17'h102c0   ) begin
            src_channel = 60'b000000000000000000000000000000000000000000000100000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 5;
    end

    // ( 0x102d0 .. 0x102e0 )
    if ( {address[RG:PAD46],{PAD46{1'b0}}} == 17'h102d0   ) begin
            src_channel = 60'b000000000000000000000000000000000000000000000010000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 4;
    end

    // ( 0x102e0 .. 0x102f0 )
    if ( {address[RG:PAD47],{PAD47{1'b0}}} == 17'h102e0   ) begin
            src_channel = 60'b000000000000000000000000000000000000000000000001000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 3;
    end

    // ( 0x102f0 .. 0x10300 )
    if ( {address[RG:PAD48],{PAD48{1'b0}}} == 17'h102f0   ) begin
            src_channel = 60'b000000000000000000000000000000000000000000000000100000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 2;
    end

    // ( 0x10300 .. 0x10310 )
    if ( {address[RG:PAD49],{PAD49{1'b0}}} == 17'h10300   ) begin
            src_channel = 60'b000000000000000000000000000000000000000000000000010000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 1;
    end

    // ( 0x10310 .. 0x10320 )
    if ( {address[RG:PAD50],{PAD50{1'b0}}} == 17'h10310   ) begin
            src_channel = 60'b000000000000000000000000000000000000000000000000001000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 30;
    end

    // ( 0x10320 .. 0x10330 )
    if ( {address[RG:PAD51],{PAD51{1'b0}}} == 17'h10320   ) begin
            src_channel = 60'b000000000000000000000000000000000000000000000000000100000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 29;
    end

    // ( 0x10330 .. 0x10340 )
    if ( {address[RG:PAD52],{PAD52{1'b0}}} == 17'h10330   ) begin
            src_channel = 60'b000000000000000000000000000000000000000000000000000010000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 28;
    end

    // ( 0x10340 .. 0x10350 )
    if ( {address[RG:PAD53],{PAD53{1'b0}}} == 17'h10340   ) begin
            src_channel = 60'b000000000000000000000000000000000000000000000000000001000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 27;
    end

    // ( 0x10350 .. 0x10360 )
    if ( {address[RG:PAD54],{PAD54{1'b0}}} == 17'h10350   ) begin
            src_channel = 60'b000000000000000000000000000000000000000000000000000000100000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 26;
    end

    // ( 0x10360 .. 0x10370 )
    if ( {address[RG:PAD55],{PAD55{1'b0}}} == 17'h10360   ) begin
            src_channel = 60'b000000000000000000000000000000000000000000000000000000010000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 25;
    end

    // ( 0x10370 .. 0x10380 )
    if ( {address[RG:PAD56],{PAD56{1'b0}}} == 17'h10370   ) begin
            src_channel = 60'b000000000000000000000000000000000000000000000000000000001000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 24;
    end

    // ( 0x10380 .. 0x10390 )
    if ( {address[RG:PAD57],{PAD57{1'b0}}} == 17'h10380   ) begin
            src_channel = 60'b000000000000000000000000000000000000000000000000000000000100;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 22;
    end

    // ( 0x10390 .. 0x103a0 )
    if ( {address[RG:PAD58],{PAD58{1'b0}}} == 17'h10390   ) begin
            src_channel = 60'b000000000000000000000000000000000000000000000000000000000010;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 11;
    end

    // ( 0x103a0 .. 0x103b0 )
    if ( {address[RG:PAD59],{PAD59{1'b0}}} == 17'h103a0   ) begin
            src_channel = 60'b000000000000000000000000000000000000000000000000000000000001;
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


