module Adder(

    output          s_out,
    output          c_out,

    input            y_in,
    input            x_in,
    input   [0:0]    c_in,
    input   [0:0]    a_s

);

//single 2's complement adder/subtractor
//inputs: x0, y_0 to be added/subtracted, as well as carry-in c0
//ouputs s0 and carry-out c1

    assign s_out = (y_in ^ a_s) ^ x_in ^ c_in;
    assign c_out = (x_in & (y_in ^ a_s)) + ((x_in + (y_in ^ a_s)) & c_in);


endmodule
