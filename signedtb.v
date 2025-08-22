`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.08.2025 15:13:14
// Design Name: 
// Module Name: tb
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


module testbench;
    reg signed [7:0] A, B;
    reg [1:0] Op;
    wire signed [7:0] Result;
    wire Overflow, Zero, Negative;

    ArithmeticUnit AU (.A(A), .B(B), .Op(Op), .Result(Result), .Overflow(Overflow), .Zero(Zero), .Negative(Negative));

    initial begin
        $display("Time\tOp\tA\tB\tResult\tO\tZ\tN");
        $monitor("%0d\t%b\t%d\t%d\t%d\t%b\t%b\t%b", $time, Op, A, B, Result, Overflow, Zero, Negative);

        // Test Addition: 50 + 70 = 120 (no overflow)
        A = 8'd50; B = 8'd70; Op = 2'b00; #10;

        // Test Addition with overflow: 100 + 50 = 150 -> Overflow
        A = 8'd100; B = 8'd50; Op = 2'b00; #10;

        // Test Subtraction: 50 - 70 = -20
        A = 8'd50; B = 8'd70; Op = 2'b01; #10;

        // Subtraction with overflow: -100 - 50 = -150 -> Overflow
        A = -8'd100; B = 8'd50; Op = 2'b01; #10;

        // Test Comparison: A == B
        A = 8'd30; B = 8'd30; Op = 2'b10; #10;

        // Test Comparison: A > B
        A = 8'd40; B = 8'd30; Op = 2'b10; #10;

        // Test Comparison: A < B
        A = 8'd10; B = 8'd30; Op = 2'b10; #10;

        // Test Absolute Difference: |30 - 50| = 20
        A = 8'd30; B = 8'd50; Op = 2'b11; #10;

        // Test Absolute Difference with overflow
        A = -8'd100; B = 8'd100; Op = 2'b11; #10;

        $finish;
    end
endmodule

