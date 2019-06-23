module signExtend(
	input wire[24:0] entrada,
	output wire[31:0] saida
);

//extende o sinal replicando o ultimo bit
assign saida = {{7{entrada[24]}}, entrada[24:0]};

endmodule
