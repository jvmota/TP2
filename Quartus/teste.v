module teste (
	input wire [2:0] OpCode,
	output wire MemtoReg, MemEn, MemOp, FonteEscrita, RegEsc, Stop, Clear,
	output wire [3:0] ALUCode
);

Controle instancia(
	.OpCode(OpCode),
	.MemtoReg(MemtoReg),
	.MemEn(MemEn),
	.MemOp(MemOp),
	.FonteEscrita(FonteEscrita),
	.RegEsc(RegEsc),
	.Stop(Stop),
	.Clear(Clear),
	.ALUCode(ALUCode)
);

endmodule