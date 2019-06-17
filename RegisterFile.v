module RegisterFile(
	input wire [1:0] RegEsc, Fonte1, Fonte2,
	input wire Esc, Clk,
	input wire [31:0] Dado,
	output reg [31:0] Dado1, Dado2,
	output wire	[31:0] RA, RB, RACC
);

//declara e assimila os tres registradores
reg [31:0] RegA, RegB, Acc;
assign	RA = RegA;
assign	RB = RegB;
assign	RACC = Acc;


//realiza a gravacao na descida de clock
always @(negedge Clk)
begin
	if (Esc == 1'b1)
	begin
		case(RegEsc)
			2'b00: RegA = Dado;
			2'b01: RegB = Dado;
			default: Acc = Dado;
		endcase
	end
end

//realiza as leituras na subida de clock
always @(posedge Clk)
begin
	//if (Esc == 1'b0)
	//begin
		case(Fonte1)
			2'b00: Dado1 = RegA;
			2'b01: Dado1 = RegB;
			2'b10: Dado1 = Acc;
			default: Dado1 = 32'b0;
		endcase
		case(Fonte2)
			2'b00: Dado2 = RegA;
			2'b01: Dado2 = RegB;
			2'b10: Dado2 = Acc;
			default: Dado2 = 32'b0;
		endcase
	//end
end
endmodule
