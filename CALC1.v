module CALC1 (
input wire Clk,
output wire [31:0] RegA, RegB, RAcc, InstrAtual, testedado,
output wire  teste, teste1, teste2
);

//arquivo com o caminho de dados:

//sinais internos
reg [1:0] FonteA, Dest, DestEscrita, Acc;
reg [31:0] DadosEscrita, PC, PCP;
wire [31:0] DadosA, DadosB, ResultALU, imediato;
wire [31:0] MemData, instrucao;
wire RegEsc, MemEn, MemOp, Clear;
wire FonteEscrita, MemtoReg, Stop;
wire [3:0] opALU;

//inicializa o pc com 0
initial PC = 32'h00000000;
assign InstrAtual = instrucao;
assign teste = MemEn;
assign teste1 = MemOp;
assign teste2 = Clear;
assign testedado = MemData;

//instancia a alu
ALU instALU(
	.input1(DadosA),
	.input2(imediato),
	.op(opALU),
	.output1(ResultALU)
);

//instancia o banco de registradores
RegisterFile insRegisterFile(
	.RegEsc(DestEscrita),
	.Fonte1(FonteA),
	.Fonte2(FonteA),
	.Esc(RegEsc),
	.Clk(Clk),
	.Dado(DadosEscrita),
	.Dado1(DadosA),
	.Dado2(DadosB),
	.RA(RegA),
	.RB(RegB),
	.RACC(RAcc)
);

//instancia a memoria
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

//instancia o controle
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

//instancia o extensor de sinal
signExtend instSignExtend(
	.entrada(instrucao[24:0]),
	.saida(imediato)
);

always @(*)
begin
	//assimila sinais internos
	Dest = instrucao[26:25];
	FonteA = instrucao[28:27];
	Acc = 2'b10;
	PCP = PC + 1;
	//define a registrador de escrita no banco de registradores
	if(FonteEscrita == 1'b0)
		DestEscrita = Acc;
	else
		DestEscrita = Dest;
	//define o que vai ser escrito no banco de registradores
	if(MemtoReg == 1'b0)
		DadosEscrita = ResultALU;
	else
		DadosEscrita = MemData;
end

//analisa se o PC vai ser atualizado ou não
always @(posedge Clk)
begin
	if(Stop == 1'b0)
		PC = PCP;
end
endmodule
