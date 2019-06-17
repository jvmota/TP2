module Controle(
	input wire [2:0] OpCode,
	output reg MemtoReg, MemEn, MemOp, FonteEscrita, RegEsc, Stop, Clear,
	output reg [3:0] ALUCode
);

//O codigo é basicamente um decodificador que gera os sinais de 
//controle a partir do opcode
always @(*)
begin
	//operacao de soma
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
	//operacao de subtracao
	else if(OpCode == 3'b001)
	begin
		MemtoReg = 1'b0;
		MemEn = 1'b0;
		MemOp = 1'b0;
		FonteEscrita = 1'b0;
		RegEsc = 1'b1;
		ALUCode = 4'b0100;
		Stop = 1'b0;
		Clear = 1'b0;
	end
	//operacao de divisao
	else if(OpCode == 3'b010)
	begin
		MemtoReg = 1'b0;
		MemEn = 1'b0;
		MemOp = 1'b0;
		FonteEscrita = 1'b0;
		RegEsc = 1'b1;
		ALUCode = 4'b0001;
		Stop = 1'b0;
		Clear = 1'b0;
	end
	//operacao de multiplicacao
	else if(OpCode == 3'b011)
	begin
		MemtoReg = 1'b0;
		MemEn = 1'b0;
		MemOp = 1'b0;
		FonteEscrita = 1'b0;
		RegEsc = 1'b1;
		ALUCode = 4'b0001;
		Stop = 1'b0;
		Clear = 1'b0;
	end
	//operacao de memory clear
	else if(OpCode == 3'b100)
	begin
		MemtoReg = 1'b0;
		MemEn = 1'b0;
		MemOp = 1'b0;
		FonteEscrita = 1'b0;
		RegEsc = 1'b0;
		ALUCode = 4'b0001;
		Stop = 1'b0;
		Clear = 1'b1;
	end
	//operacao de memory read
	else if(OpCode == 3'b110)
	begin
		MemtoReg = 1'b1;
		MemEn = 1'b1;
		MemOp = 1'b0;
		FonteEscrita = 1'b1;
		RegEsc = 1'b1;
		ALUCode = 4'b0001;
		Stop = 1'b0;
		Clear = 1'b0;
	end
	//operacao de memory write
	else if(OpCode == 3'b111)
	begin
		MemtoReg = 1'b0;
		MemEn = 1'b1;
		MemOp = 1'b1;
		FonteEscrita = 1'b0;
		RegEsc = 1'b0;
		ALUCode = 4'b0001;
		Stop = 1'b0;
		Clear = 1'b0;
	end
	//operacao de parada
	else
	begin
		MemtoReg = 1'b0;
		MemEn = 1'b0;
		MemOp = 1'b0;
		FonteEscrita = 1'b0;
		RegEsc = 1'b0;
		ALUCode = 4'b0001;
		Stop = 1'b1;
		Clear = 1'b0;
	end
end
endmodule
