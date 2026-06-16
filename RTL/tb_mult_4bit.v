module tb_mult_4bit;

// ── Signals ───────────────────────────────────────
reg        clk;
reg        rst_n;
reg  [3:0] a, b;
wire [7:0] product;

// ── DUT instantiation ─────────────────────────────
// clk and rst_n added — matches updated mult_4bit.v
mult_4bit dut (
    .clk    (clk),
    .rst_n  (rst_n),
    .a      (a),
    .b      (b),
    .product(product)
);

// ── Clock generation ──────────────────────────────
// 10ns period — matches alu.sdc create_clock period 10
initial clk = 0;
always #5 clk = ~clk;

// ── Test stimulus ─────────────────────────────────
initial begin
    $display("========================================");
    $display("  4-bit Multiplier Testbench (Registered)");
    $display("========================================");

    // Apply reset — rst_n active low
    // Hold reset for 2 clock cycles
    rst_n = 0;
    a     = 0;
    b     = 0;
    @(posedge clk); #1;
    @(posedge clk); #1;

    // Release reset
    rst_n = 1;

    // ── Test case 1: 3 x 5 = 15 ──────────────────
    a = 4'd3; b = 4'd5;
    @(posedge clk); #1;   // wait one cycle for output to register
    $display("a=%0d  b=%0d  product=%0d  expected=15  %s",
              a, b, product, (product==15) ? "PASS" : "FAIL");

    // ── Test case 2: 7 x 2 = 14 ──────────────────
    a = 4'd7; b = 4'd2;
    @(posedge clk); #1;
    $display("a=%0d  b=%0d  product=%0d  expected=14  %s",
              a, b, product, (product==14) ? "PASS" : "FAIL");

    // ── Test case 3: 9 x 4 = 36 ──────────────────
    a = 4'd9; b = 4'd4;
    @(posedge clk); #1;
    $display("a=%0d  b=%0d  product=%0d  expected=36  %s",
              a, b, product, (product==36) ? "PASS" : "FAIL");

    // ── Test case 4: 15 x 15 = 225 (max inputs) ──
    a = 4'd15; b = 4'd15;
    @(posedge clk); #1;
    $display("a=%0d b=%0d product=%0d expected=225 %s",
              a, b, product, (product==225) ? "PASS" : "FAIL");

    // ── Test case 5: reset mid-operation ─────────
    // Apply reset again — product should go to 0
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
    $dumpfile("tb_mult_4bit.vcd");
    $dumpvars(0, tb_mult_4bit);
end

endmodule
