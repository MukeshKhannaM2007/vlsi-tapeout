module alu(
input clk,
input rst_n,
input [7:0] A,
input [7:0] B,
input [2:0] opcode,
output reg [7:0] Y,
output reg Carry,
output reg Zero,
output reg Negative,
output reg Overflow
);

reg [7:0] alu_result;
reg carry_temp;
reg overflow_temp;

reg [8:0] temp;

always @(*)begin
 alu_result    = 8'h00;
        carry_temp    = 1'b0;
        overflow_temp = 1'b0;
        temp          = 9'h000;

        case(opcode)

            // ADD
            3'b000: begin
                temp = A + B;

                alu_result = temp[7:0];
                carry_temp = temp[8];

                overflow_temp =
                    (~A[7] & ~B[7] & alu_result[7]) |
                    ( A[7] &  B[7] & ~alu_result[7]);
            end

            // SUB
            3'b001: begin
                temp = A - B;

                alu_result = temp[7:0];
                carry_temp = temp[8];

                overflow_temp =
                    (~A[7] &  B[7] & alu_result[7]) |
                    ( A[7] & ~B[7] & ~alu_result[7]);
            end

            // AND
            3'b010:
                alu_result = A & B;

            // OR
            3'b011:
                alu_result = A | B;

            // XOR
            3'b100:
                alu_result = A ^ B;

            // NAND
            3'b101:
                alu_result = ~(A & B);

            // NOR
            3'b110:
                alu_result = ~(A | B);

            // XNOR
            3'b111:
                alu_result = ~(A ^ B);

            default:
                alu_result = 8'h00;

        endcase
    end

 always @(posedge clk or negedge rst_n) begin

        if(!rst_n) begin

            Y        <= 8'h00;
            Carry    <= 1'b0;
            Zero     <= 1'b0;
            Negative <= 1'b0;
            Overflow <= 1'b0;

        end
        else begin

            Y        <= alu_result;
            Carry    <= carry_temp;
            Overflow <= overflow_temp;

            Zero     <= (alu_result == 8'h00);
            Negative <= alu_result[7];

        end
    end

endmodule

