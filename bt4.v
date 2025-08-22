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
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.08.2025 10:25:55
// Design Name: 
// Module Name: bit4tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


// tb_ripple_carry_adder.v
`timescale 1ns / 1ps

module tb_ripple_carry_adder;

    reg  [3:0] a, b;
    reg        cin;
    wire [3:0] sum;
    wire       cout;

    // Instantiate the 4-bit adder
    ripple_carry_adder_4bit uut (
        .a(a), .b(b), .cin(cin),
        .sum(sum), .cout(cout)
    );

    initial begin
        $display("Time\t a\t b\t cin\t | sum\t cout");
        $monitor("%0dns\t %b\t %b\t %b\t | %b\t %b", $time, a, b, cin, sum, cout);

        // Test cases
        a = 4'b0000; b = 4'b0000; cin = 0; #20;
        a = 4'b0101; b = 4'b0011; cin = 0; #20;
        a = 4'b1111; b = 4'b0001; cin = 0; #20;
        a = 4'b1010; b = 4'b0101; cin = 1; #20;
        a = 4'b1111; b = 4'b1111; cin = 1; #20;

        $finish;
    end

endmodule

