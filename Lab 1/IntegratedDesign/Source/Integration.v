module Integration(
 
    //////////// CLOCK //////////
    input                       ADC_CLK_10,
    input                       MAX10_CLK1_50,
    input                       MAX10_CLK2_50,
 
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
    input            [9:0]      SW 
);
 
    wire [7:0] DB1_H0;
    wire [7:0] DB1_H1;
    wire [7:0] DB1_H2;
    wire [7:0] DB1_H3;
    wire [7:0] DB1_H4;
    wire [7:0] DB1_H5;
 
    wire [7:0] DB2_H0;
    wire [7:0] DB2_H1;
    wire [7:0] DB2_H2;
    wire [7:0] DB2_H3;
    wire [7:0] DB2_H4;
    wire [7:0] DB2_H5;
    
    wire [7:0] DB3_H0;
    wire [7:0] DB3_H1;
    wire [7:0] DB3_H2;
    wire [7:0] DB3_H3;
    wire [7:0] DB3_H4;
    wire [7:0] DB3_H5;
    
    reg  [7:0] H0;
    reg  [7:0] H1;
    reg  [7:0] H2;
    reg  [7:0] H3;
    reg  [7:0] H4;
    reg  [7:0] H5;
 
    assign HEX0 = H0;
    assign HEX1 = H1;
    assign HEX2 = H2;
    assign HEX3 = H3;
    assign HEX4 = H4;
    assign HEX5 = H5;
 
    wire [9:0] DB1_LEDR;
    wire [9:0] DB2_LEDR;
    wire [9:0] DB3_LEDR;
 
    reg [9:0] LED;
 
    assign LEDR = LED;
 
    Lab1 U1(.HEX0(DB1_H0), .HEX1(DB1_H1), .HEX2(DB1_H2), .HEX3(DB1_H3), .HEX4(DB1_H4), .HEX5(DB1_H5), .KEY(KEY), .LEDR(DB1_LEDR), .SW(SW));
    Lab1DB2 U2(.HEX0(DB2_H0), .HEX1(DB2_H1), .HEX2(DB2_H2), .HEX3(DB2_H3), .HEX4(DB2_H4), .HEX5(DB2_H5), .KEY(KEY), .LEDR(DB2_LEDR), .SW(SW));
    Lab1DB3 U3(.HEX0(DB3_H0), .HEX1(DB3_H1), .HEX2(DB3_H2), .HEX3(DB3_H3), .HEX4(DB3_H4), .HEX5(DB3_H5), .LEDR(DB3_LEDR), .SW(SW));
 
    always @(SW[9:8])
        begin
            case(SW[9:8])
                2'b00: begin
                        H0 = DB1_H0;
                        H1 = DB1_H1;
                        H2 = DB1_H2;
                        H3 = DB1_H3;
                        H4 = DB1_H4;
                        H5 = DB1_H5;
                        LED = DB1_LEDR;
                    end
                2'b01: begin
                        H0 = DB2_H0;
                        H1 = DB2_H1;
                        H2 = DB2_H2;
                        H3 = DB2_H3;
                        H4 = DB2_H4;
                        H5 = DB2_H5;
                        LED = DB2_LEDR;
                    end
                2'b10: begin
                        H0 = DB3_H0;
                        H1 = DB3_H1;
                        H2 = DB3_H2;
                        H3 = DB3_H3;
                        H4 = DB3_H4;
                        H5 = DB3_H5;
                        LED = DB3_LEDR;
                    end
                2'b11: begin
                        H0 = DB3_H0;
                        H1 = DB3_H1;
                        H2 = DB3_H2;
                        H3 = DB3_H3;
                        H4 = DB3_H4;
                        H5 = DB3_H5;
                        LED = DB3_LEDR;
                    end
            endcase
        end
 
endmodule
