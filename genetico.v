module genetico(conf_les, conf_outs, chromIn, chromOut);

	input [24:0][12:0] conf_les;
	input [1:0][4:0] conf_outs;
	input [0:0] chromIn;
	output [1:0] chromOut;
	
	wire [24:0] le_out;
	wire [25:0] all_inputs;
	
	assign all_inputs = {le_out, chromIn};
	
	assign chromOut = {all_inputs[conf_outs[1]], all_inputs[conf_outs[0]]};
	
logic_e le00(
	.conf_func(conf_les[0][12:10]),
	.conf_ins(conf_les[0][9:0]),
	.all_inputs(all_inputs),
	.leOut(le_out[0])
);

logic_e le10(
	.conf_func(conf_les[1][12:10]),
	.conf_ins(conf_les[1][9:0]),
	.all_inputs(all_inputs),
	.leOut(le_out[1])
);

logic_e le20(
	.conf_func(conf_les[2][12:10]),
	.conf_ins(conf_les[2][9:0]),
	.all_inputs(all_inputs),
	.leOut(le_out[2])
);

logic_e le30(
	.conf_func(conf_les[3][12:10]),
	.conf_ins(conf_les[3][9:0]),
	.all_inputs(all_inputs),
	.leOut(le_out[3])
);

logic_e le40(
	.conf_func(conf_les[4][12:10]),
	.conf_ins(conf_les[4][9:0]),
	.all_inputs(all_inputs),
	.leOut(le_out[4])
);

logic_e le50(
	.conf_func(conf_les[5][12:10]),
	.conf_ins(conf_les[5][9:0]),
	.all_inputs(all_inputs),
	.leOut(le_out[5])
);

logic_e le60(
	.conf_func(conf_les[6][12:10]),
	.conf_ins(conf_les[6][9:0]),
	.all_inputs(all_inputs),
	.leOut(le_out[6])
);

logic_e le70(
	.conf_func(conf_les[7][12:10]),
	.conf_ins(conf_les[7][9:0]),
	.all_inputs(all_inputs),
	.leOut(le_out[7])
);

logic_e le80(
	.conf_func(conf_les[8][12:10]),
	.conf_ins(conf_les[8][9:0]),
	.all_inputs(all_inputs),
	.leOut(le_out[8])
);

logic_e le90(
	.conf_func(conf_les[9][12:10]),
	.conf_ins(conf_les[9][9:0]),
	.all_inputs(all_inputs),
	.leOut(le_out[9])
);

logic_e le100(
	.conf_func(conf_les[10][12:10]),
	.conf_ins(conf_les[10][9:0]),
	.all_inputs(all_inputs),
	.leOut(le_out[10])
);

logic_e le110(
	.conf_func(conf_les[11][12:10]),
	.conf_ins(conf_les[11][9:0]),
	.all_inputs(all_inputs),
	.leOut(le_out[11])
);

logic_e le120(
	.conf_func(conf_les[12][12:10]),
	.conf_ins(conf_les[12][9:0]),
	.all_inputs(all_inputs),
	.leOut(le_out[12])
);

logic_e le130(
	.conf_func(conf_les[13][12:10]),
	.conf_ins(conf_les[13][9:0]),
	.all_inputs(all_inputs),
	.leOut(le_out[13])
);

logic_e le140(
	.conf_func(conf_les[14][12:10]),
	.conf_ins(conf_les[14][9:0]),
	.all_inputs(all_inputs),
	.leOut(le_out[14])
);

logic_e le150(
	.conf_func(conf_les[15][12:10]),
	.conf_ins(conf_les[15][9:0]),
	.all_inputs(all_inputs),
	.leOut(le_out[15])
);

logic_e le160(
	.conf_func(conf_les[16][12:10]),
	.conf_ins(conf_les[16][9:0]),
	.all_inputs(all_inputs),
	.leOut(le_out[16])
);

logic_e le170(
	.conf_func(conf_les[17][12:10]),
	.conf_ins(conf_les[17][9:0]),
	.all_inputs(all_inputs),
	.leOut(le_out[17])
);

logic_e le180(
	.conf_func(conf_les[18][12:10]),
	.conf_ins(conf_les[18][9:0]),
	.all_inputs(all_inputs),
	.leOut(le_out[18])
);

logic_e le190(
	.conf_func(conf_les[19][12:10]),
	.conf_ins(conf_les[19][9:0]),
	.all_inputs(all_inputs),
	.leOut(le_out[19])
);

logic_e le200(
	.conf_func(conf_les[20][12:10]),
	.conf_ins(conf_les[20][9:0]),
	.all_inputs(all_inputs),
	.leOut(le_out[20])
);

logic_e le210(
	.conf_func(conf_les[21][12:10]),
	.conf_ins(conf_les[21][9:0]),
	.all_inputs(all_inputs),
	.leOut(le_out[21])
);

logic_e le220(
	.conf_func(conf_les[22][12:10]),
	.conf_ins(conf_les[22][9:0]),
	.all_inputs(all_inputs),
	.leOut(le_out[22])
);

logic_e le230(
	.conf_func(conf_les[23][12:10]),
	.conf_ins(conf_les[23][9:0]),
	.all_inputs(all_inputs),
	.leOut(le_out[23])
);

logic_e le240(
	.conf_func(conf_les[24][12:10]),
	.conf_ins(conf_les[24][9:0]),
	.all_inputs(all_inputs),
	.leOut(le_out[24])
);


endmodule
