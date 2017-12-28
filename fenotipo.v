module fenotipo(
    input [41:0] cromossomo,
    input [1:0] chromIn,
    output wire [1:0] chromOut
);

    wire [3:0][8:0] descricao_les;
    wire [1:0][2:0] descricao_outs;
    
	assign descricao_les[0] = cromossomo[8:0];
	assign descricao_les[1] = cromossomo[17:9];
	assign descricao_les[2] = cromossomo[26:18];
	assign descricao_les[3] = cromossomo[35:27];

	assign descricao_outs[0] = cromossomo[38:36];
	assign descricao_outs[1] = cromossomo[41:39];

genetico genetico(
    .conf_les(descricao_les),
    .conf_outs(descricao_outs),
    .chromIn(chromIn),
    .chromOut(chromOut)
);

endmodule
