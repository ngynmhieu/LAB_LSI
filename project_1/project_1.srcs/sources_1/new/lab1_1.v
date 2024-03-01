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


module Bound_Flash(
    input wire clk,
    input wire reset,
    input wire flick,
    output reg [15:0] lamps
);

    reg [3:0] state;
    reg [3:0] max, min;
    reg [4:0] counter;
    reg [4:0] lampstate;
    reg [4:0] kickback;
    
    parameter INIT = 0, 
              ON_STATE = 1, 
              GRADUALLY_ON = 2, 
              GRADUALLY_OFF = 3,
              OFF_STATE = 4;

   always @(posedge clk, negedge reset, posedge flick)
   if (reset == 1'b0) begin // Low active reset = 0
       state = INIT;
   end else begin // Reset = 1
       case (state)
       INIT: begin
        max = 0;
        min = 0;
        counter = 0 ;
        kickback = 0;
        lamps = 16'b0;
        lampstate = 1;
        if (flick == 1) state = ON_STATE;
       end

       ON_STATE: begin
        state = GRADUALLY_ON;
        if (lampstate == 1) begin
            min = 0; max = 5;
        end else if (lampstate == 3) begin
            min = 0 ; max = 10;
        end else if (lampstate == 5) begin
            min = 5; max = 15;
        end else if (lampstate == 7) begin
            lamps = 16'b1111111111111111;
            state = OFF_STATE;
        end
        counter = min;
       end

       GRADUALLY_ON: begin
        if (flick == 1 && (counter == 5 || counter == 10) && lampstate != 1) begin
            kickback = 1;
            lampstate = lampstate -1 ;
            state = OFF_STATE;
        end else begin
            lamps[counter] = 1'b1;
            if (counter == max) begin
                state = OFF_STATE;
                lampstate = lampstate + 1;
            end
            counter = counter + 1;
        end
       end

       OFF_STATE: begin
        state = GRADUALLY_OFF;
        if (lampstate == 2) begin
            max = 5; min = 0;
        end else if (lampstate == 4) begin
            max = 10; min = 5;
        end else if (lampstate == 6) begin
            max = 15; min = 0;
        end else if (lampstate == 7) begin
            lamps = 16'b0;
            state = INIT;
        end
        if (kickback == 0) counter = max;
        else kickback = 0;
       end

       GRADUALLY_OFF: begin
        lamps [counter] = 1'b0;
        if (counter == min) begin
            state = ON_STATE;
            lampstate = lampstate + 1;
        end
        counter = counter - 1;
       end
       endcase
   end
endmodule

