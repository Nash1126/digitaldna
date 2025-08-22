`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.08.2025 12:51:55
// Design Name: 
// Module Name: popcounttb
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

`timescale 1ns / 1ps

module tb_popcount16;

    // Inputs
    reg [15:0] data_in;

    // Outputs
    wire [4:0] count_out;

    // Instantiate the Unit Under Test (UUT)
    popcount16 uut (
        .data_in(data_in),
        .count_out(count_out)
    );

    // Stimulus process
    initial begin
        // Initialize inputs
        data_in = 16'b0;

        // Apply test vectors
        #10 data_in = 16'b0000000000000000; // 0 ones
        #10 data_in = 16'b1111111111111111; // 16 ones
        #10 data_in = 16'b1010101010101010; // 8 ones
        #10 data_in = 16'b1100110011001100; // 8 ones
        #10 data_in = 16'b1111000011110000; // 8 ones
        #10 data_in = 16'b1110000011100000; // 8 ones
        #10 data_in = 16'b1000000000000000; // 1 one
        #10 data_in = 16'b0000000000000001; // 1 one

        // Finish simulation
        #10 $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time = %0t | data_in = %b | count_out = %d", $time, data_in, count_out);
    end

endmodule
