module logic_e(conf_func, conf_ins, all_inputs, leOut);

	input [2:0] conf_func;
	input [9:0] conf_ins;
	input [26:0] all_inputs;
	output leOut;
	
	wire all_funcs[7:0];
    wire post_lcell[7:0];
	
	and func0(all_funcs[0], all_inputs[conf_ins[4:0]], all_inputs[conf_ins[9:5]]);
	or func1(all_funcs[1], all_inputs[conf_ins[4:0]], all_inputs[conf_ins[9:5]]);
	not func2(all_funcs[2], all_inputs[conf_ins[4:0]]);
	xor func3(all_funcs[3], all_inputs[conf_ins[4:0]], all_inputs[conf_ins[9:5]]);
	xnor func4(all_funcs[4], all_inputs[conf_ins[4:0]], all_inputs[conf_ins[9:5]]);
	nand func5(all_funcs[5], all_inputs[conf_ins[4:0]], all_inputs[conf_ins[9:5]]);
	nor func6(all_funcs[6], all_inputs[conf_ins[4:0]], all_inputs[conf_ins[9:5]]);
	buf func7(all_funcs[7], all_inputs[conf_ins[4:0]]);
	
genvar i;
generate for (i = 0; i <= 7; i++)
begin : lcells
    
    LCELL lcell_inst 
        ( .in(all_funcs[i])
        , .out(post_lcell[i])
        );

end
endgenerate

LCELL out_inst
    ( .in(post_lcell[conf_func])
    , .out(leOut)
    );

endmodule