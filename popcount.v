`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.08.2025 12:46:46
// Design Name: 
// Module Name: popcount16
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

module popcount16 (
    input  wire [15:0] data_in,
    output reg  [4:0]  count_out
);
   integer i ;
    always @(*) begin
  
        count_out = 0;
        for (i = 0; i < 16; i = i + 1) begin
            count_out = count_out + data_in[i];
        end
    end

endmodule

