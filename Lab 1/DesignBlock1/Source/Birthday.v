module Birthday(

    //////////// SEG7 //////////
    output           [7:0]      HEX0,
    output           [7:0]      HEX1,
    output           [7:0]      HEX2,
    output           [7:0]      HEX3,
    output           [7:0]      HEX4,
    output           [7:0]      HEX5,

    //////////// KEY //////////
    input            [1:0]      KEY
    
);

    reg [7:0] HEX0_d;
    reg [7:0] HEX1_d;
    reg [7:0] HEX2_d;
    reg [7:0] HEX3_d;
    reg [7:0] HEX4_d;
    reg [7:0] HEX5_d;
    
    
    always @(KEY)
        begin
            HEX0_d = 8'd9;
            HEX1_d = 8'd9;
            HEX2_d = 8'd6;
            HEX3_d = 8'd0;
            HEX4_d = 8'd5;
            HEX5_d = 8'd0;

            if(KEY[1])
                begin
                    HEX0_d = 8'd9;
                    HEX1_d = 8'd9;
                    HEX2_d = 8'd8;
                    HEX3_d = 8'd2;
                    HEX4_d = 8'd8;
                    HEX5_d = 8'd0;
                end
        end
    
        SevenSeg U1(.HEX(HEX0), .NUM(HEX0_d));
        SevenSeg U2(.HEX(HEX1), .NUM(HEX1_d));
        SevenSeg U3(.HEX(HEX2), .NUM(HEX2_d));
        SevenSeg U4(.HEX(HEX3), .NUM(HEX3_d));
        SevenSeg U5(.HEX(HEX4), .NUM(HEX4_d));
        SevenSeg U6(.HEX(HEX5), .NUM(HEX5_d));


endmodule
