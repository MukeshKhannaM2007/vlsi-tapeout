// ============================================
// 4-bit Multiplier with Registered Output
// Modified for DFT scan insertion
// Added: clk, rst_n, output register
// ============================================
module mult_4bit (
    input         clk,
    input         rst_n,
    input  [3:0]  a,
    input  [3:0]  b,
    output reg [7:0] product
);

integer i;
reg [7:0] product_comb;

// Combinational multiply — original logic unchanged
always @(*) begin
    product_comb = 8'b0;
    for (i = 0; i < 4; i = i + 1) begin
        if (b[i])
            product_comb = product_comb + (a << i);
    end
end

// Registered output — gives Genus 8 flops to scan
always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        product <= 8'b0;
    else
        product <= product_comb;
end

endmodule
