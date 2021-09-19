module Compare(

    //////////// SevenSeg //////////
    output           [7:0]      HEX0,
    output           [7:0]      HEX1,
    output           [7:0]      HEX2,
    output           [7:0]      HEX3,
    output           [7:0]      HEX4,
    output           [7:0]      HEX5,
    
    //////////// LED //////////
    output           [7:0]      LEDR,

    //////////// SW //////////
    input            [3:0]      input1,
    input            [3:0]      input2,
    input            [1:0]      scomp
    
);

reg [7:0] input1_d;
reg [7:0] sign1_d;
reg [7:0] input2_d;
reg [7:0] sign2_d;

reg [2:0] ledval;

always @(scomp, input1, input2)
    begin
        if(scomp[1:0] == 2'b10)
            begin
                sign1_d = 8'd88;
                sign2_d = 8'd88;
            end
        else if(scomp[1:0] == 2'b11)
            begin
                if(input1[3] == 0)
                    sign1_d = 8'd88;
                else if(input1[3] == 1)
                    sign1_d = 8'd99;
                if(input2[3] == 0)
                    sign2_d = 8'd88;
                else if(input2[3] == 1)
                    sign2_d = 8'd99;
            end

        case(input1)
            4'b0000: input1_d = 8'd0;
            4'b0001: input1_d = 8'd1;
            4'b0010: input1_d = 8'd2;
            4'b0011: input1_d = 8'd3;
            4'b0100: input1_d = 8'd4;
            4'b0101: input1_d = 8'd5;
            4'b0110: input1_d = 8'd6;
            4'b0111: input1_d = 8'd7;

            4'b1111: if(scomp[1:0] == 2'b10) input1_d = 8'd15;
            else if(scomp[1:0] == 2'b11) input1_d = 8'd1;

            4'b1110: if(scomp[1:0] == 2'b10) input1_d = 8'd14;
            else if(scomp[1:0] == 2'b11) input1_d = 8'd2;

            4'b1101: if(scomp[1:0] == 2'b10) input1_d = 8'd13;
            else if(scomp[1:0] == 2'b11) input1_d = 8'd3;

            4'b1100: if(scomp[1:0] == 2'b10) input1_d = 8'd12;
            else if(scomp[1:0] == 2'b11) input1_d = 8'd4;

            4'b1011: if(scomp[1:0] == 2'b10) input1_d = 8'd11;
            else if(scomp[1:0] == 2'b11) input1_d = 8'd5;

            4'b1010: if(scomp[1:0] == 2'b10) input1_d = 8'd10;
            else if(scomp[1:0] == 2'b11) input1_d = 8'd6;

            4'b1001: if(scomp[1:0] == 2'b10) input1_d = 8'd9;
            else if(scomp[1:0] == 2'b11) input1_d = 8'd7;

            4'b1000: if(scomp[1:0] == 2'b10) input1_d = 8'd8;
            else if(scomp[1:0] == 2'b11) input1_d = 8'd8;
        endcase

        case(input2)
            4'b0000: input2_d = 8'd0;
            4'b0001: input2_d = 8'd1;
            4'b0010: input2_d = 8'd2;
            4'b0011: input2_d = 8'd3;
            4'b0100: input2_d = 8'd4;
            4'b0101: input2_d = 8'd5;
            4'b0110: input2_d = 8'd6;
            4'b0111: input2_d = 8'd7;

            4'b1111: if(scomp[1:0] == 2'b10) input2_d = 8'd15;
            else if(scomp[1:0] == 2'b11) input2_d = 8'd1;

            4'b1110: if(scomp[1:0] == 2'b10) input2_d = 8'd14;
            else if(scomp[1:0] == 2'b11) input2_d = 8'd2;

            4'b1101: if(scomp[1:0] == 2'b10) input2_d = 8'd13;
            else if(scomp[1:0] == 2'b11) input2_d = 8'd3;

            4'b1100: if(scomp[1:0] == 2'b10) input2_d = 8'd12;
            else if(scomp[1:0] == 2'b11) input2_d = 8'd4;

            4'b1011: if(scomp[1:0] == 2'b10) input2_d = 8'd11;
            else if(scomp[1:0] == 2'b11) input2_d = 8'd5;

            4'b1010: if(scomp[1:0] == 2'b10) input2_d = 8'd10;
            else if(scomp[1:0] == 2'b11) input2_d = 8'd6;

            4'b1001: if(scomp[1:0] == 2'b10) input2_d = 8'd9;
            else if(scomp[1:0] == 2'b11) input2_d = 8'd7;

            4'b1000: if(scomp[1:0] == 2'b10) input2_d = 8'd8;
            else if(scomp[1:0] == 2'b11) input2_d = 8'd8;
        endcase

        if(sign1_d == 8'd88)
            begin
                if(sign2_d == 8'd88)
                    begin
                        if(input1_d == input2_d)
                            ledval = 3'b100;
                        else if(input1_d > input2_d)
                            ledval = 3'b010;
                        else
                            ledval = 3'b001;
                    end
                else if(sign2_d == 8'd99)
                    ledval = 3'b010;
            end
        else if(sign1_d == 8'd99)
            begin
                if(sign2_d == 8'd99)
                    begin
                        if(input1_d == input2_d)
                            ledval = 3'b100;
                        else if(input1_d > input2_d)
                            ledval = 3'b001;
                        else
                            ledval = 3'b010;
                    end
                else if(sign2_d == 8'd88)
                    ledval = 3'b001;
            end
    end

assign LEDR[2:0] = ledval[2:0];

SevenSeg SS5(.HEX(HEX5), .NUM(sign1_d));
SevenSeg SS4(.HEX(HEX4), .NUM(input1_d));

SevenSeg SS3(.HEX(HEX3), .NUM(8'd88));
SevenSeg SS2(.HEX(HEX2), .NUM(8'd88));

SevenSeg SS1(.HEX(HEX1), .NUM(sign2_d));
SevenSeg SS0(.HEX(HEX0), .NUM(input2_d));

endmodule
