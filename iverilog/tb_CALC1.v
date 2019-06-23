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

initial
begin
$dumpfile("saida.vcd");
$dumpvars;
$monitor("No tempo %t, RegA = %h, RegB = %h, RAcc = %h, Instrucao = %h",$time, regA, regB, rAcc, Instrucao);
#250
$finish;
end

endmodule
