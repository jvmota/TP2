module tb_CALC1();

reg clk = 0;
wire [31:0] regA, regB, rAcc, Instrucao, testedado;
wire A, B, C;

CALC1 instCalc (
	.Clk(clk),
	.RegA(regA),
	.RegB(regB),
	.RAcc(rAcc),
	.InstrAtual(Instrucao),
	.teste(C),
	.teste1(B),
	.teste2(A),
	.testedado(testedado)
);

always #5 clk = !clk;

endmodule
