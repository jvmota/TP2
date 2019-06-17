module signExtend(
	input wire[24:0] entrada,
	output wire[31:0] saida
);

assign saida = {{7{entrada[24]}}, entrada[24:0]};

endmodule
