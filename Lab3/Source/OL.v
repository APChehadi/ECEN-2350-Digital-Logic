module OL(

    input                       CLK,
    input                       reset_n,
    input           [2:0]       CurrentState,
    input           [1:0]       SW,
    output          [7:0]       HEX0,
    output   reg    [2:0]       LEDR_L,
    output   reg    [2:0]       LEDR_R

);

// State Machine Parameters
parameter par_idle = 3'b000;
parameter par_hazard = 3'b001;
parameter par_turn_sig_left = 3'b010;
parameter par_turn_sig_right = 3'b011;

reg hazard_r = 1'b0;
reg [1:0] turn_cnt= 2'b00;

always @(posedge CLK, negedge reset_n)
    begin
        if(reset_n == 0)
            begin
                LEDR_R = 3'b000;
                LEDR_L = 3'b000;
            end
        else
            begin
            case(CurrentState)
                par_hazard: 
                    begin
                        hazard_r <= ~hazard_r;
                        if(hazard_r == 1'b0)
                            begin
                                LEDR_L <= 3'b000;
                                LEDR_R <= 3'b000;
                            end
                        else if(hazard_r == 1'b1)
                            begin
                                LEDR_L <= 3'b111;
                                LEDR_R <= 3'b111;
                            end
                    end
                par_turn_sig_left: 
                    begin
                        LEDR_R <= 3'b000;
                        turn_cnt <= turn_cnt + 1;
                        if(turn_cnt == 2'b11)
                            turn_cnt <= 2'b00;
                        else
                            turn_cnt <= turn_cnt + 1'b1;
                        case(turn_cnt)
                            2'b01: LEDR_L <= 3'b001;
                            2'b10: LEDR_L <= 3'b011;
                            2'b11: LEDR_L <= 3'b111;
                            default: LEDR_L <= 3'b000;
                        endcase
                    end
                par_turn_sig_right: 
                    begin
                        LEDR_L <= 3'b000;
                        if(turn_cnt == 2'b11)
                            turn_cnt <= 2'b00;
                        else
                            turn_cnt <= turn_cnt + 1'b1;
                        case(turn_cnt)
                            2'b01: LEDR_R <= 3'b100;
                            2'b10: LEDR_R <= 3'b110;
                            2'b11: LEDR_R <= 3'b111;
                            default: LEDR_R <= 3'b000;
                        endcase  
                    end
                default: 
                    begin
                        LEDR_L <= 3'b000;
                        LEDR_R <= 3'b000;
                    end
            endcase
        end 
    end


reg[7:0] num;
always @(CurrentState)
    num <= CurrentState;

SevenSeg SS0(.HEX(HEX0), .NUM(num));

endmodule