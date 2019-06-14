module TB_RegisterFile();

reg [1:0] F1, F2, RE;
reg [31:0] D;
reg E, C;
wire [31:0] D1, D2;

RegisterFile instancia_RF(
	.RegEsc(RE),
	.Fonte1(F1),
	.Fonte2(F2),
	.Dado(D),
	.Esc(E),
	.Clk(C),
	.Dado1(D1),
	.Dado2(D2)
);

initial
begin
	D = 32'h048fc24a;
	I2 = 32'H00000004;
	OP = 4'b1000;
	#10
	I1 = 32'h00000004;
	I2 = 32'H00000002;
	OP = 4'b0100;
	#10
	I1 = 32'h00000006;
	I2 = 32'H00000004;
	OP = 4'b0010;
	#10
	I1 = 32'h00000008;
	I2 = 32'H00000002;
	OP = 4'b0001;
	#10
	$finish;
end

endmodule
