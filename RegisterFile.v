module RegisterFile(
	input wire [1:0] RegEsc, Fonte1, Fonte2,
	input wire Esc, Clk,
	input wire [31:0] Dado,
	output reg [31:0] Dado1, Dado2
);

reg [31:0] RegA, RegB, Acc;

always @(negedge Clk)
begin
	if (Esc == 1)
	begin
		case(RegEsc)
			2'b00: RegA <= Dado;
			2'b01: RegB <= Dado;
			2'b10: Acc <= Dado;
		endcase
	end
end
endmodule
