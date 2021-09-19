`timescale 1 ns / 100 ps
module TB_Lab1_DB2();
 
reg [7:0] SW;
reg [1:0] KEY;
reg [7:0] HEX0;
reg [7:0] HEX1;
reg [7:0] HEX2;
reg [7:0] HEX3;
reg [7:0] HEX4;
reg [7:0] HEX5;
 
initial
    begin
        $dumpfile("output.vcd");
        $dumpvars;
        $display(" << Starting simulation >>");
 
        SW[7:0] = 8'b0011_0100;  // UP: SW2, SW4, SW5
        #10 if (HEX0 [7:0] != 8'b11111000)
            $display("ERROR: HEX0 value not 7");
        #10 if (HEX1 [7:0] != 8'b11111111)
            $display("ERROR: HEX0 value not BLANK");
        #10 if (HEX2 [7:0] != 8'b10011001)
            $display("ERROR: HEX1 value not 4");
        #10 if (HEX3 [7:0] != 8'b11111111)
            $display("ERROR: HEX0 value not BLANK");  
        #10 if (HEX4 [7:0] != 8'b10110000)
            $display("ERROR: HEX1 value not 3");
        #10 if (HEX5 [7:0] != 8'b11111111)
            $display("ERROR: HEX0 value not BLANK");
        #10 KEY[0] = 1;  
        #10 if (HEX0 [7:0] != 8'b11111001)
            $display("ERROR: HEX0 value not 1");
        #10 if (HEX1 [7:0] != 8'b10111111)
            $display("ERROR: HEX0 value not -");
        
        SW[7:0] = 8'b0101_0010;  // UP: SW1, SW4, SW6
        #10 if (HEX0 [7:0] != 8'b11111000)
            $display("ERROR: HEX0 value not 7");
        #10 if (HEX1 [7:0] != 8'b11111111)
            $display("ERROR: HEX0 value not BLANK");
        #10 if (HEX2 [7:0] != 8'b10100100)
            $display("ERROR: HEX1 value not 2");
        #10 if (HEX3 [7:0] != 8'b11111111)
            $display("ERROR: HEX0 value not BLANK");  
        #10 if (HEX4 [7:0] != 8'b10010010)
            $display("ERROR: HEX1 value not 5");
        #10 if (HEX5 [7:0] != 8'b11111111)
            $display("ERROR: HEX0 value not BLANK");
        #10 KEY[0] = 1;  
        #10 if (HEX0 [7:0] != 8'b10110000)
            $display("ERROR: HEX0 value not 3");
        #10 if (HEX1 [7:0] != 8'b11111111)
            $display("ERROR: HEX0 value not BLANK");

        SW[7:0] = 8'b1101_0001;  // UP: SW0, SW4, SW6, SW7
        #10 if (HEX0 [7:0] != 8'b10100100)
            $display("ERROR: HEX0 value not 2");
        #10 if (HEX1 [7:0] != 8'b10111111)
            $display("ERROR: HEX0 value not -");
        #10 if (HEX2 [7:0] != 8'b11111001)
            $display("ERROR: HEX1 value not 1");
        #10 if (HEX3 [7:0] != 8'b11111111)
            $display("ERROR: HEX0 value not BLANK");  
        #10 if (HEX4 [7:0] != 8'b10110000)
            $display("ERROR: HEX1 value not 3");
        #10 if (HEX5 [7:0] != 8'b10111111)
            $display("ERROR: HEX0 value not -");
        #10 KEY[0] = 1;  
        #10 if (HEX0 [7:0] != 8'b10011001)
            $display("ERROR: HEX0 value not 4");
        #10 if (HEX1 [7:0] != 8'b10111111)
            $display("ERROR: HEX0 value not -");

        SW[7:0] = 8'b0111_0101;  // UP: SW0, SW2, SW4, SW5, SW6
        #10 if (HEX0 [7:0] != 8'b10001110)
            $display("ERROR: HEX0 value not F");
        #10 if (HEX1 [7:0] != 8'b11000000)
            $display("ERROR: HEX0 value not 0");
        #10 if (HEX2 [7:0] != 8'b10010010)
            $display("ERROR: HEX1 value not 5");
        #10 if (HEX3 [7:0] != 8'b11111111)
            $display("ERROR: HEX0 value not BLANK");  
        #10 if (HEX4 [7:0] != 8'b11111000)
            $display("ERROR: HEX1 value not 7");
        #10 if (HEX5 [7:0] != 8'b11111111)
            $display("ERROR: HEX0 value not BLANK");
        #10 KEY[0] = 1;  
        #10 if (HEX0 [7:0] != 8'b10100100)
            $display("ERROR: HEX0 value not 2");
        #10 if (HEX1 [7:0] != 8'b11111111)
            $display("ERROR: HEX0 value not BLANK");
        
        
        #10 $display($time, "<< Sim Complete. If no error messages, test successful. >>");
        $finish;
 
    end
 

initial
    begin
        $monitor($time, " SW=%b, KEY=%b, HEX0=%b, HEX1=%b, HEX2=%b, HEX3=%b, HEX4=%b, HEX5=%b", SW[7:0], KEY[1:0], HEX0[7:0], HEX1[7:0], HEX2[7:0], HEX3[7:0], HEX4[7:0], HEX5[7:0]);
    end
 
 
endmodule
