`timescale 1ns / 1ps
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
module top_example_tb;
reg [3:0] in;
wire [3:0] out;
// Unit under test (UUT)/Design under test (DUT)
top_example uut (
 .in (in),
 .out (out)
);
// Command to print simulation signal values
initial begin
 $monitor("At time %t : input = %b - output = %b", $time, in, out);
end
// Stimulus generation: Sequent input of the simulation
initial begin
 in <= 0;
 #10 // Wait for 10 units of time
 in <= 4'b0001;
 #2 in <= 4'b0010;
 #3 in <= 4'b0011;
 #5 in <= 4'b0101;
 #2 in <= 4'b1001;
 #2 in <= 4'b1111;
 #5 $stop; // end of simulation
end
endmodule

