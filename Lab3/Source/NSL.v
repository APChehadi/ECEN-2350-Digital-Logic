module NSL(
    input                       turn_sig_latch,
    input           [1:0]       SW,
    input           [2:0]       CurrentState,
    output          [2:0]       NextState
    
);

// State Machine Parameters
parameter par_idle = 3'b000;
parameter par_hazard = 3'b001;
parameter par_turn_sig_left = 3'b010;
parameter par_turn_sig_right = 3'b011;

reg [2:0] temp_NextState;

always @(CurrentState)
  begin
    if(SW[0] == 1)
        begin
            temp_NextState <= par_hazard;
        end
    else if(SW[1] == 1)
        begin
            if(turn_sig_latch == 0)
                temp_NextState <= par_turn_sig_left;
            else
                temp_NextState <= par_turn_sig_right;
        end
    else
        temp_NextState <= par_idle;
  end

assign NextState = temp_NextState;
 
endmodule