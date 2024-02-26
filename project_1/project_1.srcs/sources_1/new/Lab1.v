`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/26/2024 02:18:49 PM
// Design Name: 
// Module Name: Lab1
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


module Flasher(
    input wire clk,
    input wire reset,
    input wire flick,
    output reg [15:0] lamps
);

    reg [3:0] state;
    reg [4:0] lamp_index;
    
    parameter INIT = 3'b0000, 
              ON_STATE = 3'b0001, 
              GRADUALLY_ON = 3'b0010, 
              UPDATE_VALUE = 3'b0011, 
              GRADUALLY_OFF = 3'b0100;

   always @(posedge clk, negedge reset)
    if (reset == 1'b0) begin
        state = INIT;
        lamps = 16'b0;
    end else begin
        
      
        

endmodule
