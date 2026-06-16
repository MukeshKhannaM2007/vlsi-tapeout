module tb_mult_8bit;

// ── Signals ───────────────────────────────────────
reg         clk;
reg         rst_n;
reg  [7:0]  a, b;
wire [15:0] product;

// ── DUT instantiation ─────────────────────────────
// clk and rst_n added — matches updated mult_8bit.v
mult_8bit dut (
    .clk    (clk),
    .rst_n  (rst_n),
    .a      (a),
    .b      (b),
    .product(product)
);

// ── Clock generation ──────────────────────────────
// 10ns period — matches mult_8bit.sdc create_clock period 10
initial clk = 0;
always #5 clk = ~clk;

// ── Test stimulus ─────────────────────────────────
initial begin
    $display("========================================");
    $display("  8-bit Multiplier Testbench (Registered)");
    $display("========================================");

    // Apply reset — rst_n active low
    // Hold for 2 clock cycles
    rst_n = 0;
    a     = 0;
    b     = 0;
    @(posedge clk); #1;
    @(posedge clk); #1;

    // Release reset
    rst_n = 1;

    // ── Test case 1: 3 x 5 = 15 ──────────────────
    a = 8'd3; b = 8'd5;
    @(posedge clk); #1;   // wait one cycle for output to register
    $display("a=%0d   b=%0d   product=%0d   expected=15   %s",
              a, b, product, (product==15) ? "PASS" : "FAIL");

    // ── Test case 2: 10 x 12 = 120 ───────────────
    a = 8'd10; b = 8'd12;
    @(posedge clk); #1;
    $display("a=%0d  b=%0d  product=%0d  expected=120  %s",
              a, b, product, (product==120) ? "PASS" : "FAIL");

    // ── Test case 3: 25 x 7 = 175 ────────────────
    a = 8'd25; b = 8'd7;
    @(posedge clk); #1;
    $display("a=%0d  b=%0d   product=%0d  expected=175  %s",
              a, b, product, (product==175) ? "PASS" : "FAIL");

    // ── Test case 4: 100 x 3 = 300 ───────────────
    a = 8'd100; b = 8'd3;
    @(posedge clk); #1;
    $display("a=%0d b=%0d   product=%0d  expected=300  %s",
              a, b, product, (product==300) ? "PASS" : "FAIL");

    // ── Test case 5: 255 x 255 = 65025 (max) ─────
    a = 8'd255; b = 8'd255;
    @(posedge clk); #1;
    $display("a=%0d b=%0d product=%0d expected=65025 %s",
              a, b, product, (product==65025) ? "PASS" : "FAIL");

    // ── Test case 6: reset mid-operation ─────────
    rst_n = 0;
    @(posedge clk); #1;
    $display("After reset: product=%0d expected=0  %s",
              product, (product==0) ? "PASS" : "FAIL");
    rst_n = 1;

    $display("========================================");
    $display("  Testbench complete");
    $display("========================================");
    $finish;
end

// ── Waveform dump ─────────────────────────────────
initial begin
    $dumpfile("tb_mult_8bit.vcd");
    $dumpvars(0, tb_mult_8bit);
end

endmodule
