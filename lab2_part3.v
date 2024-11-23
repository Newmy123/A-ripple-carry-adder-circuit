module lab2_part3(
	input [9:0] SW,  //SW[7:4] For A, SW[3:0] for B, SW[8] for Carry-in
	output [4:0] LEDR //LEDR[4] for cout, LEDR [3:0] for sum
);
	wire [3:0] A = SW[7:4]; //input A
	wire [3:0] B = SW[3:0]; //input B
	wire cin = SW[8]; 		//carry-in
	wire [3:0] S; 			//sum outputs
	wire [3:0] C; 			//carry-out wires for each stage
	
	//Instantiate 4 full adders
	full_adder FA0 (.a(A[0]), .b(B[0]), .cin(cin), .sum(S[0]), .cout(C[0]));
	full_adder FA1 (.a(A[1]), .b(B[1]), .cin(C[0]), .sum(S[1]), .cout(C[1]));
	full_adder FA2 (.a(A[2]), .b(B[2]), .cin(C[1]), .sum(S[2]), .cout(C[2]));
	full_adder FA3 (.a(A[3]), .b(B[3]), .cin(C[2]), .sum(S[3]), .cout(C[3]));
	
	//connect outputs
	assign LEDR[3:0] = S;    // Sum to LEDR[3:0]
	assign LEDR[4] = C[3];   // Final carry-out to LEDR[4]

endmodule 