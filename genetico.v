module genetico(conf_les, conf_outs, chromIn, chromOut);

	input [3:0][8:0] conf_les;
	input [1:0][2:0] conf_outs;
	input [1:0] chromIn;
	output [1:0] chromOut;
	
	wire [3:0] le_out;
	wire [5:0] all_inputs;
	
	assign all_inputs = {le_out, chromIn};
	
	assign chromOut = {all_inputs[conf_outs[1]], all_inputs[conf_outs[0]]};
	
logic_e le00(
	.conf_func(conf_les[0][8:6]),
	.conf_ins(conf_les[0][5:0]),
	.all_inputs(all_inputs),
	.leOut(le_out[0])
);

logic_e le10(
	.conf_func(conf_les[1][8:6]),
	.conf_ins(conf_les[1][5:0]),
	.all_inputs(all_inputs),
	.leOut(le_out[1])
);

logic_e le01(
	.conf_func(conf_les[2][8:6]),
	.conf_ins(conf_les[2][5:0]),
	.all_inputs(all_inputs),
	.leOut(le_out[2])
);

logic_e le11(
	.conf_func(conf_les[3][8:6]),
	.conf_ins(conf_les[3][5:0]),
	.all_inputs(all_inputs),
	.leOut(le_out[3])
);


endmodule
