module Controle(
	input wire [2:0] OpCode,
	output reg MemtoReg, MemEn, MemOp, FonteEscrita, RegEsc, Stop, Clear,
	output reg [3:0] ALUCode
);

always @(*)
begin
	if(OpCode == 3'b000)
	begin
		MemtoReg = 1'b0;
		MemEn = 1'b0;
		MemOp = 1'b0;
		FonteEscrita = 1'b0;
		RegEsc = 1'b1;
		ALUCode = 4'b1000;
		Stop = 1'b0;
		Clear = 1'b0;
	end
end
endmodule
