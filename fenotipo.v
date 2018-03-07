module fenotipo(
    input [329:0] cromossomo,
    input [1:0] chromIn,
    output wire [0:0] chromOut
);

    wire [24:0][12:0] descricao_les;
    wire [0:0][4:0] descricao_outs;
    
	assign descricao_les[0] = cromossomo[12:0];
	assign descricao_les[1] = cromossomo[25:13];
	assign descricao_les[2] = cromossomo[38:26];
	assign descricao_les[3] = cromossomo[51:39];
	assign descricao_les[4] = cromossomo[64:52];
	assign descricao_les[5] = cromossomo[77:65];
	assign descricao_les[6] = cromossomo[90:78];
	assign descricao_les[7] = cromossomo[103:91];
	assign descricao_les[8] = cromossomo[116:104];
	assign descricao_les[9] = cromossomo[129:117];
	assign descricao_les[10] = cromossomo[142:130];
	assign descricao_les[11] = cromossomo[155:143];
	assign descricao_les[12] = cromossomo[168:156];
	assign descricao_les[13] = cromossomo[181:169];
	assign descricao_les[14] = cromossomo[194:182];
	assign descricao_les[15] = cromossomo[207:195];
	assign descricao_les[16] = cromossomo[220:208];
	assign descricao_les[17] = cromossomo[233:221];
	assign descricao_les[18] = cromossomo[246:234];
	assign descricao_les[19] = cromossomo[259:247];
	assign descricao_les[20] = cromossomo[272:260];
	assign descricao_les[21] = cromossomo[285:273];
	assign descricao_les[22] = cromossomo[298:286];
	assign descricao_les[23] = cromossomo[311:299];
	assign descricao_les[24] = cromossomo[324:312];

	assign descricao_outs[0] = cromossomo[329:325];

genetico genetico(
    .conf_les(descricao_les),
    .conf_outs(descricao_outs),
    .chromIn(chromIn),
    .chromOut(chromOut)
);

endmodule
