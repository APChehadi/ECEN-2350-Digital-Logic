`timescale 1 ns / 100 ps
module TB_Lab1_DB1();
 
reg [7:0] SW;
reg [1:0] KEY;
reg [7:0] HEX0;
reg [7:0] HEX1;
reg [7:0] HEX2;
reg [7:0] HEX3;
reg [7:0] HEX4;
reg [7:0] HEX5;
wire [7:0] LEDR;
 
initial
      begin
        $dumpfile("output.vcd");
        $dumpvars;
        $display(" << Starting simulation >>");
 
SW[7:0] = 8'b0000_0000;  // All switches DOWN
#10 if (LEDR[7:0] != ~SW[7:0]) 
    $display("ERROR:  LEDR value should be %b, is %b", ~SW[7:0], LEDR[7:0]);
        
#10 KEY[0] = 0;  
#10 if (LEDR[7:0] != SW[7:0]) 
        $display("ERROR:  LEDR value should be %b,is %b", SW[7:0], LEDR[7:0]); 
 
#10 if (HEX0 [7:0] != 8'b10011000)
    $display("ERROR: HEX0 value not 9");
 
#10 if (HEX1 [7:0] != 8'b10011000)
    $display("ERROR: HEX1 value not 9");
 
#10 if (HEX2 [7:0] != 8'b10000000)
    $display("ERROR: HEX2 value not 8");
 
#10 if (HEX3 [7:0] != 8'b10100100)
    $display("ERROR: HEX3 value not 2");
 
#10 if (HEX4 [7:0] != 8'b10000000)
    $display("ERROR: HEX4 value not 8");
 
#10 if (HEX5 [7:0] != 8'b11000000)
    $display("ERROR: HEX5 value not 0");
 
#10 KEY[1] = 0;
#10 if (HEX0 [7:0] != 8'b10011000)
    $display("ERROR: HEX0 value not 9");
 
#10 if (HEX1 [7:0] != 8'b10011000)
    $display("ERROR: HEX1 value not 9");
 
#10 if (HEX2 [7:0] != 8'b10000010)
    $display("ERROR: HEX2 value not 6");
 
#10 if (HEX3 [7:0] != 8'b11000000)
    $display("ERROR: HEX3 value not 0");
 
#10 if (HEX4 [7:0] != 8'b10010010)
    $display("ERROR: HEX4 value not 5");
 
#10 if (HEX5 [7:0] != 8'b11000000)
    $display("ERROR: HEX5 value not 0");
 
 
    #10 $display($time, "<< Sim Complete. If not error messages, test successful. >>");
    $finish;
 
end
 
  initial
    begin
      $monitor($time, " SW=%b, KEY=%b, HEX0=%b, HEX1=%b, HEX2=%b, HEX3=%b, HEX4=%b, HEX5=%b, LEDR=%b", SW[7:0], KEY[1:0], HEX0[7:0], HEX1[7:0], HEX2[7:0], HEX3[7:0], HEX4[7:0], HEX5[7:0], LEDR[7:0]);
    end
 
 
endmodule
