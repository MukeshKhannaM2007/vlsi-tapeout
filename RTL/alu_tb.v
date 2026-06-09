module alu_tb;

    reg         clk;
    reg         rst_n;
    reg  [7:0]  A;
    reg  [7:0]  B;
    reg  [2:0]  opcode;

    wire [7:0]  Y;
    wire        Carry;
    wire        Zero;
    wire        Negative;
    wire        Overflow;

    // DUT
    alu dut (
        .clk(clk),
        .rst_n(rst_n),
        .A(A),
        .B(B),
        .opcode(opcode),
        .Y(Y),
        .Carry(Carry),
        .Zero(Zero),
        .Negative(Negative),
        .Overflow(Overflow)
    );

    //--------------------------------------
    // Clock Generation
    //--------------------------------------
    initial begin
        clk = 0;
        forever #5 clk = ~clk;   // 10 ns period
    end

    //--------------------------------------
    // Stimulus
    //--------------------------------------
    initial begin

        // Reset
        rst_n = 0;
        A = 0;
        B = 0;
        opcode = 0;

        #20;
        rst_n = 1;

        //--------------------------
        // ADD
        //--------------------------
        @(posedge clk);
        A = 8'd10;
        B = 8'd5;
        opcode = 3'b000;

        //--------------------------
        // SUB
        //--------------------------
        @(posedge clk);
        A = 8'd20;
        B = 8'd8;
        opcode = 3'b001;

        //--------------------------
        // AND
        //--------------------------
        @(posedge clk);
        A = 8'hAA;
        B = 8'h0F;
        opcode = 3'b010;

        //--------------------------
        // OR
        //--------------------------
        @(posedge clk);
        A = 8'hAA;
        B = 8'h0F;
        opcode = 3'b011;

        //--------------------------
        // XOR
        //--------------------------
        @(posedge clk);
        A = 8'hAA;
        B = 8'h0F;
        opcode = 3'b100;

        //--------------------------
        // NAND
        //--------------------------
        @(posedge clk);
        A = 8'hAA;
        B = 8'h0F;
        opcode = 3'b101;

        //--------------------------
        // NOR
        //--------------------------
        @(posedge clk);
        A = 8'hAA;
        B = 8'h0F;
        opcode = 3'b110;

        //--------------------------
        // XNOR
        //--------------------------
        @(posedge clk);
        A = 8'hAA;
        B = 8'h0F;
        opcode = 3'b111;

        //--------------------------
        // Carry Test
        //--------------------------
        @(posedge clk);
        A = 8'hFF;
        B = 8'h01;
        opcode = 3'b000;

        //--------------------------
        // Zero Flag Test
        //--------------------------
        @(posedge clk);
        A = 8'd5;
        B = 8'd5;
        opcode = 3'b001;

        //--------------------------
        // Negative Flag Test
        //--------------------------
        @(posedge clk);
        A = 8'd5;
        B = 8'd10;
        opcode = 3'b001;

        #50;
        $finish;

    end

    //--------------------------------------
    // Monitor
    //--------------------------------------
    initial begin
        $monitor(
        "Time=%0t A=%h B=%h OPCODE=%b Y=%h Carry=%b Zero=%b Neg=%b Ovf=%b",
        $time,A,B,opcode,Y,Carry,Zero,Negative,Overflow);
    end

endmodule
