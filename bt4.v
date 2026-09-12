`timescale 1ns / 1ps

module full_adder (
    input wire a, b, cin,
    output wire sum, cout
);

    wire axb, ab, bc, ac;

    // XOR for sum
    xor #(3, 6) u1(axb, a, b);       // axb = a ^ b
    xor #(3, 6) u2(sum, axb, cin);   // sum = axb ^ cin

    // Carry logic
    and #(3, 6) u3(ab, a, b);        // ab = a & b
    and #(3, 6) u4(bc, b, cin);      // bc = b & cin
    and #(3, 6) u5(ac, a, cin);      // ac = a & cin
    or  #(3, 6) u6(cout, ab, bc, ac); // cout = ab | bc | ac

endmodule



