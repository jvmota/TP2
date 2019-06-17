module CALC1 (
input wire A, B, Clk,
output wire C
);

reg [1:0] FonteA, Dest, DestEscrita, Acc;
reg [31:0] DadosEscrita, PC, PCP;
wire [31:0] DadosA, DadosB, ResultALU, imediato;
wire [31:0] MemData, instrucao;
wire RegEsc, MemEn, MemOp, Clear;
wire FonteEscrita, MemtoReg, Stop;
wire [3:0] opALU;

initial PC = 32'h00000000;

ALU instALU(
	.input1(DadosA),
	.input2(imediato),
	.op(opALU),
	.output1(ResultALU)
);

RegisterFile insRegisterFile(
	.RegEsc(DestEscrita),
	.Fonte1(FonteA),
	.Fonte2(FonteA),
	.Esc(RegEsc),
	.Clk(Clk),
	.Dado(DadosEscrita),
	.Dado1(DadosA),
	.Dado2(DadosB)
);

Mem instMem(
	.ReadPC(PC),
	.RWAddr(imediato),
	.Value(DadosB),
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

signExtend instSignExtend(
	.entrada(instrucao[24:0]),
	.saida(imediato)
);

assign C = A & B;
always @(*)
begin
	Dest = instrucao[26:25];
	FonteA = instrucao[28:27];
	Acc = 2'b10;
	PCP = PC + 1;
	if(FonteEscrita == 1'b0)
		DestEscrita = Acc;
	else
		DestEscrita = Dest;
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
