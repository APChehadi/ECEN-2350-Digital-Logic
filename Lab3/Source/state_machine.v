module state_machine(
 
    input                       CLK,
    output   reg    [2:0]       CurrentState
    
);

/// State Machine Parameters
parameter par_idle = 3'b000;
parameter par_hazard = 3'b001;
parameter par_turn_sig_left = 3'b010;
parameter par_turn_sig_right = 3'b011;

reg [1:0] address = 0;
reg [4:0] count = 0;
wire [2:0] memory_ouput;

always @(posedge CLK)
	begin
		case (count)
			25:
			begin
				if(address != 3)
					address = address + 1;
				else
					address = 0;
				count = 0;
			end
			default:
				count = count + 1;
		endcase
	end

memory M0(.address(address), .clock(CLK), .q(memory_ouput));

always @(memory_ouput)
	begin
		case(memory_ouput)
			0:
			begin
				CurrentState = par_idle;
			end
			1:
			begin
				CurrentState = par_hazard;
			end
			2:
			begin
				CurrentState = par_turn_sig_left;
			end
			3:
			begin
				CurrentState = par_turn_sig_right;
			end
			default:
			begin
				CurrentState = par_idle;
			end
		endcase
	end

endmodule
