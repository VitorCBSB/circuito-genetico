module logic_e(conf_func, conf_ins, all_inputs, leOut);

	input [2:0] conf_func;
	input [7:0] conf_ins;
	input [10:0] all_inputs;
	output leOut;
	
	wire all_funcs[7:0];
	
	and func0(all_funcs[0], all_inputs[conf_ins[3:0]], all_inputs[conf_ins[7:4]]);
	or func1(all_funcs[1], all_inputs[conf_ins[3:0]], all_inputs[conf_ins[7:4]]);
	not func2(all_funcs[2], all_inputs[conf_ins[3:0]]);
	xor func3(all_funcs[3], all_inputs[conf_ins[3:0]], all_inputs[conf_ins[7:4]]);
	xnor func4(all_funcs[4], all_inputs[conf_ins[3:0]], all_inputs[conf_ins[7:4]]);
	nand func5(all_funcs[5], all_inputs[conf_ins[3:0]], all_inputs[conf_ins[7:4]]);
	nor func6(all_funcs[6], all_inputs[conf_ins[3:0]], all_inputs[conf_ins[7:4]]);
	buf func7(all_funcs[7], all_inputs[conf_ins[3:0]]);
	
	assign leOut = all_funcs[conf_func];

endmodule