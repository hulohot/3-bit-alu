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

module hulohot_alu(a, b, opcode, z);
    input [2:0] a, b;
    input [1:0] opcode;
    output [3:0] z;

    wire [3:0] add, sub, and, or;

    assign add = a + b;
    assign sub = a - b;
    assign and = a & b;
    assign or = a | b;

    always @ (opcode)
        case (opcode)
            2'b00: z = add;
            2'b01: z = sub;
            2'b10: z = and;
            2'b11: z = or;
        endcase
endmodule