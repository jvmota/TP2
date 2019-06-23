module tb_CALC1();

reg clk = 0;
wire [31:0] regA, regB, rAcc, Instrucao;

CALC1 instCalc (
	.Clk(clk),
	.RegA(regA),
	.RegB(regB),
	.RAcc(rAcc),
	.InstrAtual(Instrucao)
);

always #10 clk = !clk;

endmodule
