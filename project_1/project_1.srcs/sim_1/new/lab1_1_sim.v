//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/26/2024 02:22:59 PM
// Design Name: 
// Module Name: lab1_sim
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


`timescale 1ns/10ps // time-unit = 1 ns, precision = 10 ps
module Bound_Flash_tb;

reg clk, reset, flick;
wire [15:0] lamps;
// Unit under test (UUT)/Design under test (DUT)
Bound_Flash UUT (
    .clk (clk),
    .reset (reset),
    .flick (flick),
    .lamps (lamps)
);
// Command to print simulation signal values
always @(posedge clk) begin
$monitor("Time: %d, reset = %b, flick = %b | State: %b, Max: %d, Min: %d, Counter: %d, Lampstate: %d, Lamps: %b",
            $time, UUT.reset, UUT.flick, UUT.state, UUT.max, UUT.min, UUT.counter, UUT.lampstate, UUT.lamps);
end
// Stimulus generation: Sequent input of the simulation

initial begin
    clk = 1'b0;
    forever #1 clk = ~clk;
end

initial begin
    reset = 1'b0; // Active low reset
    #10; // Hold reset for 10 ns
    reset = 1'b1;

    // Apply various test patterns for flick signal
    #10; flick = 1'b0; // No flick
    #10; flick = 1'b1; // Early flick during ON_STATE
    #1; flick = 1'b0;
    #200; flick = 1'b0; // No flick
    #200; flick = 1'b1; // Early flick during GRADUALLY_ON
    #200; $finish;
end
endmodule