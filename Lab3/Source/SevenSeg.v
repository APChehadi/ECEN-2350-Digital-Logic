module SevenSeg(
 
    //////////// SEG7 //////////
    output           [7:0]      HEX,
 
    //////////// KEY //////////
    input            [7:0]     NUM
    
);
 
reg [7:0] value;
 
// Takes decimal number and converts to binary for HEX display based on logic 0 = on, 
// logic 1 = off for each segment.
// If NUM = 'd88 is blank
always @(NUM)
    begin
        case(NUM)
            8'd0: value = 8'b11000000;
            8'd1: value = 8'b11111001;
            8'd2: value = 8'b10100100;
            8'd3: value = 8'b10110000;
            8'd4: value = 8'b10011001;
            8'd5: value = 8'b10010010;
            8'd6: value = 8'b10000010;
            8'd7: value = 8'b11111000;
            8'd8: value = 8'b10000000;
            8'd9: value = 8'b10011000;

            8'd88: value = 8'b11111111;
        endcase
    end


//the HEX display passed is given whatever value determined above
assign HEX[7:0] = value;
 
 
endmodule

    








