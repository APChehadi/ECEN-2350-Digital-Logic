module CSL(
 
    input                       CLK,
    input                       reset_n,
    input           [2:0]       NextState,
    output   reg    [2:0]       CurrentState
    
);

// State Machine Parameters
parameter par_idle = 3'b000;
parameter par_hazard = 3'b001;
parameter par_turn_sig_left = 3'b010;
parameter par_turn_sig_right = 3'b011;

always @(posedge CLK, negedge reset_n)
    if(reset_n == 0)
        CurrentState = par_idle;
    else
        CurrentState = NextState;
 
 
endmodule
