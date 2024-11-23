module full_adder(
	input a, //First bit
	input b, //Second bit
	input cin, //carry in
	output sum, //sum
	output cout //carry out
);
	assign sum = a ^ b ^ cin; //sum of the three inputs
	assign cout = (a & b) | (cin & (a ^ b)); //carry out logic
endmodule
