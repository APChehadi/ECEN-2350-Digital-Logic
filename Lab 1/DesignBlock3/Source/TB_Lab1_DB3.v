`timescale 1 ns / 100 ps
module TB_Lab1_DB3();
 
reg [8:0] SW;
reg [7:0] HEX0;
reg [7:0] HEX1;
reg [7:0] HEX2;
reg [7:0] HEX3;
reg [7:0] HEX4;
reg [7:0] HEX5;
wire [2:0] LEDR;
 
initial
    begin
        $dumpfile("output.vcd");
        $dumpvars;
        $display(" << Starting simulation >>");
 
        SW[8:0] = 9'b0_0000_0000;  // All switches DOWN
        #10 if (LEDR[2:0] != 3'b100) 
            $display("ERROR:  LEDR value should be %b, is %b", 3'b100, LEDR[2:0]); 
        #10 if (HEX0 [7:0] != 8'b11000000)
            $display("ERROR: HEX0 value not 0");
        #10 if (HEX1 [7:0] != 8'b11111111)
            $display("ERROR: HEX0 value not BLANK");  
        #10 if (HEX4 [7:0] != 8'b11000000)
            $display("ERROR: HEX1 value not 0");
        #10 if (HEX5 [7:0] != 8'b11111111)
            $display("ERROR: HEX0 value not BLANK");

        SW[8:0] = 9'b0_0010_0001;  // UP: SW0, SW5
        #10 if (LEDR[2:0] != 3'b010) 
            $display("ERROR:  LEDR value should be %b, is %b", 3'b010, LEDR[2:0]); 
        #10 if (HEX0 [7:0] != 8'b11111001)
            $display("ERROR: HEX0 value not 1");
        #10 if (HEX1 [7:0] != 8'b11111111)
            $display("ERROR: HEX0 value not BLANK");  
        #10 if (HEX4 [7:0] != 8'b11000000)
            $display("ERROR: HEX1 value not 2");
        #10 if (HEX5 [7:0] != 8'b10100100)
            $display("ERROR: HEX0 value not BLANK");

        SW[8:0] = 9'b0_0011_0110;  // UP: SW1, SW2, SW4, SW5
        #10 if (LEDR[2:0] != 3'b001) 
            $display("ERROR:  LEDR value should be %b, is %b", 3'b001, LEDR[2:0]); 
        #10 if (HEX0 [7:0] != 8'b10000011)
            $display("ERROR: HEX0 value not 6");
        #10 if (HEX1 [7:0] != 8'b11111111)
            $display("ERROR: HEX0 value not BLANK");  
        #10 if (HEX4 [7:0] != 8'b10110000)
            $display("ERROR: HEX1 value not 3");
        #10 if (HEX5 [7:0] != 8'b10100100)
            $display("ERROR: HEX0 value not BLANK");


        SW[8:0] = 9'b1_1000_1000;  // UP: SW3, SW7, SW8
        #10 if (LEDR[2:0] != 3'b100) 
            $display("ERROR:  LEDR value should be %b, is %b", 3'b100, LEDR[2:0]); 
        #10 if (HEX0 [7:0] != 8'b10000000)
            $display("ERROR: HEX0 value not 8");
        #10 if (HEX1 [7:0] != 8'b10111111)
            $display("ERROR: HEX0 value not -");  
        #10 if (HEX4 [7:0] != 8'b10000000)
            $display("ERROR: HEX1 value not 8");
        #10 if (HEX5 [7:0] != 8'b10111111)
            $display("ERROR: HEX0 value not -");

        SW[8:0] = 9'b1_1111_1001;  // UP: SW0, SW3, SW4, SW5, SW6, SW7, SW8
        #10 if (LEDR[2:0] != 3'b010) 
            $display("ERROR:  LEDR value should be %b, is %b", 3'b010, LEDR[2:0]); 
        #10 if (HEX0 [7:0] != 8'b11111000)
            $display("ERROR: HEX0 value not 7");
        #10 if (HEX1 [7:0] != 8'b10111111)
            $display("ERROR: HEX0 value not -");  
        #10 if (HEX4 [7:0] != 8'b11111001)
            $display("ERROR: HEX1 value not 1");
        #10 if (HEX5 [7:0] != 8'b10111111)
            $display("ERROR: HEX0 value not -");

        SW[8:0] = 9'b1_1000_1101;  // UP: SW0, SW2, SW3, SW7, SW8
        #10 if (LEDR[2:0] != 3'b001) 
            $display("ERROR:  LEDR value should be %b, is %b", 3'b001, LEDR[2:0]); 
        #10 if (HEX0 [7:0] != 8'b10110000)
            $display("ERROR: HEX0 value not 3");
        #10 if (HEX1 [7:0] != 8'b10111111)
            $display("ERROR: HEX0 value not -");  
        #10 if (HEX4 [7:0] != 8'b10000000)
            $display("ERROR: HEX1 value not 8");
        #10 if (HEX5 [7:0] != 8'b10111111)
            $display("ERROR: HEX0 value not -");

        SW[8:0] = 9'b1_0100_1011;  // UP: SW1, SW1, SW3, SW6, SW8
        #10 if (LEDR[2:0] != 3'b010) 
            $display("ERROR:  LEDR value should be %b, is %b", 3'b010, LEDR[2:0]); 
        #10 if (HEX0 [7:0] != 8'b10010010)
            $display("ERROR: HEX0 value not 5");
        #10 if (HEX1 [7:0] != 8'b10111111)
            $display("ERROR: HEX0 value not -");  
        #10 if (HEX4 [7:0] != 8'b10011001)
            $display("ERROR: HEX1 value not 4");
        #10 if (HEX5 [7:0] != 8'b11111111)
            $display("ERROR: HEX0 value not BLANK"); 

        SW[8:0] = 9'b1_1110_0001;  // UP: SW0, SW5, SW6, SW7, SW8
        #10 if (LEDR[2:0] != 3'b001) 
            $display("ERROR:  LEDR value should be %b, is %b", 3'b001, LEDR[2:0]); 
        #10 if (HEX0 [7:0] != 8'b11111001)
            $display("ERROR: HEX0 value not 1");
        #10 if (HEX1 [7:0] != 8'b11111111)
            $display("ERROR: HEX0 value not BLANK");  
        #10 if (HEX4 [7:0] != 8'b10100100)
            $display("ERROR: HEX1 value not 2");
        #10 if (HEX5 [7:0] != 8'b10111111)
            $display("ERROR: HEX0 value not -");
        
        
        #10 $display($time, "<< Sim Complete. If no error messages, test successful. >>");
        $finish;
 
    end
 

initial
    begin
        $monitor($time, " SW=%b, HEX0=%b, HEX1=%b, HEX2=%b, HEX3=%b, HEX4=%b, HEX5=%b, LEDR=%b", SW[7:0], HEX0[7:0], HEX1[7:0], HEX2[7:0], HEX3[7:0], HEX4[7:0], HEX5[7:0], LEDR[7:0]);
    end
 
 
endmodule
