module output_mux(
 
    input           [2:0]       CurrentState_memory,
    input           [2:0]       CurrentState_manual,
    input                       SW9,
    output   reg    [2:0]       CurrentState
    
);

always @(CurrentState_memory, CurrentState_manual, SW9)
  begin
    if(SW9)
        begin
            CurrentState = CurrentState_memory;
        end
    else
        begin
            CurrentState = CurrentState_manual;
        end
  end

endmodule