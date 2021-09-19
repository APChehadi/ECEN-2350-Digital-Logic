module RippleCarry(
    
    //////////// SevenSeg //////////
    output           [7:0]      HEX0,
    output           [7:0]      HEX1,
    output           [7:0]      HEX2,
    output           [7:0]      HEX3,
    output           [7:0]      HEX4,
    output           [7:0]      HEX5,

    //////////// KEY //////////
    input            [1:0]      KEY,

    //////////// SW //////////
    input            [3:0]      input1,
    input            [3:0]      input2
    
);

   reg [7:0] input1_d;
   reg [7:0] sign1_d;
   reg [7:0] input2_d;
   reg [7:0] sign2_d;

//ATTEMPTED:
//input1 is 2s complement number from SW[7:4] -> display abs val on HEX4, sign on HEX5
//input2 is 2s complement number from SW[3:0] -> display abs val on HEX3, sign on HEX2
//TODO:
//instantiate adder
//output on HEX0, sign on HEX1: added, if EKY1 pressed, subtracted
//if overflow display 0F on HEX0/1

    always @(input1)
        begin

            if(input1[3] == 0)
                sign1_d = 8'd88;
            else if(input1[3] == 1)
                sign1_d = 8'd99;

            case(input1)
                4'b0000: input1_d = 8'd0;
                4'b0001: input1_d = 8'd1;
                4'b0010: input1_d = 8'd2;
                4'b0011: input1_d = 8'd3;
                4'b0100: input1_d = 8'd4;
                4'b0101: input1_d = 8'd5;
                4'b0110: input1_d = 8'd6;
                4'b0111: input1_d = 8'd7;

                4'b1111: input1_d = 8'd1;
                4'b1110: input1_d = 8'd2;
                4'b1101: input1_d = 8'd3;
                4'b1100: input1_d = 8'd4;
                4'b1011: input1_d = 8'd5;
                4'b1010: input1_d = 8'd6;
                4'b1001: input1_d = 8'd7;
                4'b1000: input1_d = 8'd8;
            endcase
        end

    SevenSeg U1(.HEX(HEX4), .NUM(input1_d));
    SevenSeg U2(.HEX(HEX5), .NUM(sign1_d));

    always @(input2)
        begin

            if(input2[3] == 0)
                sign2_d = 8'd88;
            else if(input2[3] == 1)
                sign2_d = 8'd99;

            case(input2)
                4'b0000: input2_d = 8'd0;
                4'b0001: input2_d = 8'd1;
                4'b0010: input2_d = 8'd2;
                4'b0011: input2_d = 8'd3;
                4'b0100: input2_d = 8'd4;
                4'b0101: input2_d = 8'd5;
                4'b0110: input2_d = 8'd6;
                4'b0111: input2_d = 8'd7;

                4'b1111: input2_d = 8'd1;
                4'b1110: input2_d = 8'd2;
                4'b1101: input2_d = 8'd3;
                4'b1100: input2_d = 8'd4;
                4'b1011: input2_d = 8'd5;
                4'b1010: input2_d = 8'd6;
                4'b1001: input2_d = 8'd7;
                4'b1000: input2_d = 8'd8;
            endcase
        end

    SevenSeg U3(.HEX(HEX2), .NUM(input2_d));
    SevenSeg U4(.HEX(HEX3), .NUM(sign2_d));

//to add c[0] = 0 /subtract c[0] = 1:

wire [3:0] x;
wire [3:0] y;
wire [4:0] c;
wire [3:0] s;

assign x[0] = input1[0];
assign x[1] = input1[1];
assign x[2] = input1[2];
assign x[3] = input1[3];

assign y[0] = input2[0];
assign y[1] = input2[1];
assign y[2] = input2[2];
assign y[3] = input2[3];

assign c[0] = ~KEY[0];

    Adder A0(.s_out(s[0]), .c_out(c[1]), .y_in(y[0]), .x_in(x[0]), .c_in(c[0]), .a_s(c[0]));
    Adder A1(.s_out(s[1]), .c_out(c[2]), .y_in(y[1]), .x_in(x[1]), .c_in(c[1]), .a_s(c[0]));
    Adder A2(.s_out(s[2]), .c_out(c[3]), .y_in(y[2]), .x_in(x[2]), .c_in(c[2]), .a_s(c[0]));
    Adder A3(.s_out(s[3]), .c_out(c[4]), .y_in(y[3]), .x_in(x[3]), .c_in(c[3]), .a_s(c[0]));

reg [7:0] s_disp;
reg [7:0] sign_s;

    always @(s, c)
            begin
                if(c[3] ^ c[4])
                begin
                    sign_s = 8'd0;
                    s_disp = 8'd15;
                end
                
                else
                    begin

                    if(s[3] == 0)
                        sign_s = 8'd88;
                    else if(s[3] == 1)
                        sign_s = 8'd99;

                    case(s)
                        4'b0000: s_disp = 8'd0;
                        4'b0001: s_disp = 8'd1;
                        4'b0010: s_disp = 8'd2;
                        4'b0011: s_disp = 8'd3;
                        4'b0100: s_disp = 8'd4;
                        4'b0101: s_disp = 8'd5;
                        4'b0110: s_disp = 8'd6;
                        4'b0111: s_disp = 8'd7;

                        4'b1111: s_disp = 8'd1;
                        4'b1110: s_disp = 8'd2;
                        4'b1101: s_disp = 8'd3;
                        4'b1100: s_disp = 8'd4;
                        4'b1011: s_disp = 8'd5;
                        4'b1010: s_disp = 8'd6;
                        4'b1001: s_disp = 8'd7;
                        4'b1000: s_disp = 8'd8;
                    endcase
                end
            end
        
    SevenSeg U5(.HEX(HEX0), .NUM(s_disp));
    SevenSeg U6(.HEX(HEX1), .NUM(sign_s));

endmodule
