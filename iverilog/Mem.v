module Mem(
	input wire [31:0] ReadPC, RWAddr, Value,
	input wire OP2En, OP2RW, Clk, Clear,
	output reg [31:0] Instr, Data
);

//declara a memoria
reg [31:0] memory [1023:0];

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
	//if(OP2En == 1'b1)
	//begin
		Data = memory[RWAddr];
	//end
end

always @(posedge !Clk)
begin
	//instrucao sempre lida
	Instr = memory[ReadPC];
	//se o clear estiver desativado
	if(Clear == 1'b0)
	begin
		if((OP2En == 1'b1) & (OP2RW == 1'b1))
		begin
			memory[RWAddr] = Value;
		end
	end
	//limpa a memoria na posicao indicada	
	else if(Clear == 1'b1)
	begin
		memory[RWAddr] = 32'h00000000;
	end
end

endmodule
