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
    reg [3:0] counter;
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
       INIT: begin  // initial state
           max = 4'b0000;
           min = 4'b0000;
           lamps = 16'b0;
           lampstate = 0;
           kickback = 0;
           if (flick == 1) state = ON_STATE;
       end

       ON_STATE: begin //set up max and min for ON
            lamps = 16'b1;
        //    state = GRADUALLY_ON;
        //    if (lampstate == 0) begin
        //        max = 5; min = 0;
        //    end else if (lampstate == 2) begin
        //        max = 10; min = 0;
        //    end else if (lampstate == 4) begin
        //        max = 15; min = 5;
        //    end else if (lampstate == 6) begin
        //        lamps = 16'b1;
        //        state = OFF_STATE;
        //        lampstate = lampstate + 1;
        //    end
        //    counter = min;
       end

       GRADUALLY_ON: begin
           if (flick == 1 && (lampstate == 2 || lampstate == 4)) begin // kickback point
               kickback = 1;
               lampstate = lampstate - 1;
               state = OFF_STATE;
           end else begin
               if (counter < max) begin
                   lamps[counter] = 1'b1;
                   counter = counter + 1;
               end else begin
                   state = OFF_STATE;
                   lampstate = lampstate + 1;
               end
           end
       end

       OFF_STATE: begin //set up max and min for OFF
           state = GRADUALLY_OFF;
           if (lampstate == 1) begin
               max = 5; min = 0;
           end else if (lampstate == 3) begin
               max = 10; min = 5;
           end else if (lampstate == 5) begin
               max = 15; min = 0;
           end else if (lampstate == 7) begin
               lamps = 16'b0;
               state = INIT;
           end
           if (kickback == 0) counter = max;
           else kickback = 0;
       end

       GRADUALLY_OFF: begin
           if (counter > min) begin
               lamps[counter] = 1'b0;
               counter = counter - 1;
           end else begin
               state = ON_STATE;
               lampstate = lampstate + 1;
           end
       end
       endcase
   end
endmodule