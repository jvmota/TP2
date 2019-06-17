module CALC1 (
input wire A, B, Clk,
output wire C
);

reg [1:0] FonteA, Dest, Acc;
reg [31:0] DadosEscrita, PC, PCP;
wire [31:0] DadosA, DadosB, ResultALU, MemAddres, MemValue, MemData, instrucao;
wire RegEsc, MemEn, MemOp, Clear;
wire FonteEscrita, MemtoReg, Stop;
wire [3:0] opALU;

initial PC = 32'h00000000;

ALU instALU(
	.input1(DadosA),
	.input2(DadosB),
	.op(opALU),
	.output1(ResultALU)
);

RegisterFile insRegisterFile(
	.RegEsc(Dest),
	.Fonte1(Acc),
	.Fonte2(FonteA),
	.Esc(RegEsc),
	.Clk(Clk),
	.Dado(DadosEscrita),
	.Dado1(DadosA),
	.Dado2(DadosB)
);

Mem instMem(
	.ReadPC(PC),
	.RWAddr(MemAddres),
	.Value(MemValue),
	.OP2En(MemEn),
	.OP2RW(MemOp),
	.Clk(Clk),
	.Instr(instrucao),
	.Data(MemData),
	.Clear(Clear)
);

Controle instControle(
	.OpCode(instrucao[31:29]),
	.MemtoReg(MemtoReg),
	.MemEn(MemEn),
	.MemOp(MemOp),
	.FonteEscrita(FonteEscrita),
	.RegEsc(RegEsc),
	.ALUCode(opALU),
	.Stop(Stop),
	.Clear(Clear)
);

assign C = A & B;
always @(*)
begin
	Dest = instrucao[26:25];
	FonteA = instrucao[28:27];
	Acc = 2'b10;
	PCP = PC + 1;
	if(FonteEscrita == 1'b0)
		Dest = Acc;
	else
		Dest = FonteA;
	if(MemtoReg == 1'b0)
		DadosEscrita = ResultALU;
	else
		DadosEscrita = MemData;
end

always @(posedge Clk)
begin
	if(Stop == 1'b0)
		PC = PCP;
end
endmodule
