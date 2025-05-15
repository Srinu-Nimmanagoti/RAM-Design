`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.05.2025 14:05:52
// Design Name: 
// Module Name: tb_simple_sync_ram
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


// File: tb_simple_sync_ram.v
`timescale 1ns / 1ps

module tb_simple_sync_ram;
    reg clk;
    reg we;
    reg [2:0] addr;
    reg [7:0] din;
    wire [7:0] dout;

    // Instantiate the RAM module
    simple_sync_ram uut (
        .clk(clk),
        .we(we),
        .addr(addr),
        .din(din),
        .dout(dout)
    );

    // Clock generation: Toggle every 5 ns
    always #5 clk = ~clk;

    initial begin
        // Initialize signals
        clk = 0;
        we = 0;
        addr = 0;
        din = 0;

        // Write values to RAM
        #10; we = 1; addr = 3'b000; din = 8'hAA; // Write 0xAA to address 0
        #10; addr = 3'b001; din = 8'hBB;        // Write 0xBB to address 1
        #10; addr = 3'b010; din = 8'hCC;        // Write 0xCC to address 2

        // Read values from RAM
        #10; we = 0; addr = 3'b000;             // Read from address 0
        #10; addr = 3'b001;                     // Read from address 1
        #10; addr = 3'b010;                     // Read from address 2

        #10; $finish;
    end
endmodule

