`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.08.2025 11:55:29
// Design Name: 
// Module Name: rule90tb
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



module rule90_tb;

    reg clk;
    reg load;
    reg [511:0] data;
    wire [511:0] q;

    // Instantiate the rule90 module
    rule90 uut (
        .clk(clk),
        .load(load),
        .data(data),
        .q(q)
    );

    // Clock generator
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    initial begin
        // Initial state: all zero
        data = 512'b0;

        // Set one cell in the middle to 1
        data[256] = 1;

        // Load initial state
        load = 1;
        #10;
        load = 0;

        // Run for 10 cycles
        repeat (10) begin
            #10;
            $display("Time %0t: q = %b", $time, q);
        end

        $finish;
    end

endmodule

