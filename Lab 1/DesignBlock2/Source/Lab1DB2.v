module Lab1DB2(

    //////////// CLOCK //////////
	input						ADC_CLK_10,
	input						MAX10_CLK1_50,
	input						MAX10_CLK2_50,
	
	//////////// SEG7 //////////
    output           [7:0]      HEX0,
    output           [7:0]      HEX1,
    output           [7:0]      HEX2,
    output           [7:0]      HEX3,
    output           [7:0]      HEX4,
    output           [7:0]      HEX5,

    //////////// KEY //////////
    input            [1:0]      KEY,

    //////////// LED //////////
    output           [9:0]      LEDR,

    //////////// SW //////////
    input            [7:0]      SW

);

	assign LEDR[7:0] = 8'b0;
	
	RippleCarry U1(.HEX0(HEX0), .HEX1(HEX1), .HEX2(HEX2), .HEX3(HEX3), .HEX4(HEX4), .HEX5(HEX5), .KEY(KEY), .input1(SW[7:4]), .input2(SW[3:0]));

endmodule
