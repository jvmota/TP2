module ALU (
	input wire [31:0] input1, input2,
	input wire [3:0] op,
	output reg [31:0] output1
);

//reg [31:0] result;
always @(*)
begin
	case(op)
		4'b1000: output1 =  input1 + input2;
		4'b0100: output1 =  input1 - input2;
		4'b0010: output1 =  input1 * input2;
		4'b0001: output1 =  input1 / input2;
		default: output1 = input1;
	endcase
	//output1 <= result;
end
endmodule
