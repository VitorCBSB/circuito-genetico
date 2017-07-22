module fenotipo(
    input processing,
    input [102:0] cromossomo,
    input [1:0] chromIn,
    output wire [0:0] chromOut
);

    wire [8:0][10:0] descricao_les;
    wire [0:0][3:0] descricao_outs;
    
	assign descricao_les[0] = cromossomo[10:0];
	assign descricao_les[1] = cromossomo[21:11];
	assign descricao_les[2] = cromossomo[32:22];
	assign descricao_les[3] = cromossomo[43:33];
	assign descricao_les[4] = cromossomo[54:44];
	assign descricao_les[5] = cromossomo[65:55];
	assign descricao_les[6] = cromossomo[76:66];
	assign descricao_les[7] = cromossomo[87:77];
	assign descricao_les[8] = cromossomo[98:88];

	assign descricao_outs[0] = cromossomo[102:99];

genetico genetico(
    .conf_les(descricao_les),
    .conf_outs(descricao_outs),
    .chromIn(chromIn),
    .chromOut(chromOut)
);

endmodule
