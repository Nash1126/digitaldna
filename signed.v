`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.08.2025 15:11:34
// Design Name: 
// Module Name: Arithmeticunit
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


module ArithmeticUnit (
    input  signed [7:0] A,
    input  signed [7:0] B,
    input        [1:0] Op,
    output reg signed [7:0] Result,
    output reg Overflow,
    output reg Zero,
    output reg Negative
);

    reg signed [8:0] temp_result; // 9-bit to detect overflow

    always @(*) begin
        Overflow = 0;
        temp_result = 0;

        case (Op)
            2'b00: begin // Addition
                temp_result = A + B;
                Result = temp_result[7:0];
                Overflow = (temp_result > 127 || temp_result < -128);
            end

            2'b01: begin // Subtraction
                temp_result = A - B;
                Result = temp_result[7:0];
                Overflow = (temp_result > 127 || temp_result < -128);
            end

            2'b10: begin // Comparison
                if (A == B)
                    Result = 8'd0;
                else if (A > B)
                    Result = 8'd1;
                else
                    Result = -8'd1;
                Overflow = 0;
            end

            2'b11: begin // Absolute Difference
                temp_result = A - B;
                if (temp_result < 0)
                    temp_result = -temp_result;
                Result = temp_result[7:0];
                Overflow = (temp_result > 127);
            end

            default: begin
                Result = 0;
                Overflow = 0;
            end
        endcase

        Zero = (Result == 0);
        Negative = (Result < 0);
    end

endmodule

