`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.08.2025 11:54:18
// Design Name: 
// Module Name: rule90
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


module rule90 (
    input wire clk,
    input wire load,
    input wire [511:0] data,
    output reg [511:0] q
);

    reg [511:0] q_next;

    integer i;

    always @(*) begin
        // Compute next state based on Rule 90
        for (i = 0; i < 512; i = i + 1) begin
            q_next[i] = ((i == 0)      ? 1'b0 : q[i-1]) ^ 
                        ((i == 511)    ? 1'b0 : q[i+1]);
        end
    end

    always @(posedge clk) begin
        if (load)
            q <= data;
        else
            q <= q_next;
    end

endmodule
