// Author: Ethan Brugger
// Date: 3/8/2023
// Description: This file contains a simple 3-bit ALU, which can perform
//              addition, subtraction, and, and bitwise or.

// Inputs
// a[2:0] - 3-bit input
// b[2:0] - 3-bit input
// opcode[1:0] - 2-bit opcode

// Outputs
// z[3:0] - 4-bit output

// OPCODES
// 00 - ADD
// 01 - SUB
// 10 - AND
// 11 - OR

`default_nettype none

module hulohot_alu_wrapper(
    input [7:0] io_in,
    output [7:0] io_out
);

alu alu_inst(
    .a(io_in[2:0]),
    .b(io_in[6:4]),
    .opcode(io_in[7:6]),
    .z(io_out[3:0])
);

endmodule

module alu(
        input [2:0] a, 
        input [2:0] b, 
        input [1:0] opcode, 
        output [3:0] z
    );
    
    wire [3:0] add_op;
    wire [3:0] sub_op;
    wire [3:0] and_op;
    wire [3:0] or_op;

    assign add_op = a + b;
    assign sub_op = a - b;
    assign and_op = a & b;
    assign or_op = a | b;

    always @ (opcode)
        case (opcode)
            2'b00: z = add_op;
            2'b01: z = sub_op;
            2'b10: z = and_op;
            2'b11: z = or_op;
        endcase
endmodule