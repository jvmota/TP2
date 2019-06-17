module Mem(
	input wire [31:0] ReadPC, RWAddr, Value,
	input wire OP2En, OP2RW, Clk, Clear,
	output reg [31:0] Instr, Data
);

reg [31:0] memory [1023:0];

integer i;

always @(posedge Clk)
begin
	if(Clear == 1'b0)
	begin
		if(OP2En == 1'b1)
		begin
			if(OP2RW == 1'b1)
				memory[2**RWAddr] = Value;
			else
				Data = memory[2**RWAddr];
		end
		Instr = memory[2**ReadPC];
	end
	else
	begin
		for(i = 0; i < 1024; i = i+1)
			memory[i] = 32'h00000000;
	end
end


endmodule
