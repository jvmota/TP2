module Mem(
	input wire [31:0] ReadPC, RWAddr, Value,
	input wire OP2En, OP2RW, Clk, Clear,
	output reg [31:0] Instr, Data
);

//declara a memoria
reg [31:0] memory [29:0];

//carrega os dados da memoria
initial
begin
$readmemh("memoria.txt", memory);
end

//para limpar a memoria
integer i;

//sempre numa borda de subida de clock
always @(posedge Clk)
begin
	//instrucao sempre lida
	Instr = memory[ReadPC];
	if(OP2En == 1'b1)
	begin
		Data = memory[RWAddr];
	end
end

always @(posedge !Clk)
begin
	//se o clear estiver desativado
	if(Clear == 1'b1)
	begin
		for(i = 11; i < 30; i = i+1)
			memory[i] = 32'h00000000;
	end	
		
	//assume que as 100 primeiras posicoes serao para instrucoes e que a limpeza so funcionara a partir da posicao 100
	else //if(Clear == 1'b1)
	begin
		if((OP2RW == 1'b1) & (OP2En == 1'b1))
			memory[RWAddr] = Value;
	end
end

endmodule
