module TB_ALU();

reg [31:0] I1, I2;
reg [3:0] OP;
wire [31:0] O;

ALU instancia_alu(
	.input1(I1),
	.input2(I2),
	.op(OP),
	.output1(O)
);

initial
begin
	I1 = 32'h00000002;
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
