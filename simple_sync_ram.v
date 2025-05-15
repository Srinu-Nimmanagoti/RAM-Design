// File: simple_sync_ram.v
module simple_sync_ram (
    input clk,
    input we,             // Write Enable
    input [2:0] addr,     // 3-bit address: 8 locations
    input [7:0] din,      // Data input
    output reg [7:0] dout // Data output
);
    // Declare RAM of 8 locations, each 8-bit wide
    reg [7:0] mem [7:0];

    always @(posedge clk) begin
        if (we)
            mem[addr] <= din;      // Write operation
        else
            dout <= mem[addr];     // Read operation
    end
endmodule
