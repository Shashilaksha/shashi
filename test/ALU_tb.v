module ALU_tb;

    // Inputs
    reg [2:0] Op_code;
    reg [31:0] A, B;

    // Output
    wire [31:0] Y;

    // Instantiate the ALU module
    ALU uut (
        .Op_code(Op_code),
        .A(A),
        .B(B),
        .Y(Y)
    );

    initial begin
        // Test case 1: Pass A
        A = 32'hA5A5A5A5; B = 32'h5A5A5A5A; Op_code = 3'b000;
        #10; // Wait 10 ns

        // Test case 2: A + B
        A = 32'h0000000A; B = 32'h00000005; Op_code = 3'b001;
        #10;

        // Test case 3: A - B
        A = 32'h0000000A; B = 32'h00000005; Op_code = 3'b010;
        #10;

        // Test case 4: A & B
        A = 32'hF0F0F0F0; B = 32'h0F0F0F0F; Op_code = 3'b011;
        #10;

        // Test case 5: A | B
        A = 32'hF0F0F0F0; B = 32'h0F0F0F0F; Op_code = 3'b100;
        #10;

        // Test case 6: A + 1
        A = 32'h0000000A; B = 32'hXXXXXXXX; Op_code = 3'b101;
        #10;

        // Test case 7: A - 1
        A = 32'h0000000A; B = 32'hXXXXXXXX; Op_code = 3'b110;
        #10;

        // Test case 8: Pass B
        A = 32'hXXXXXXXX; B = 32'h12345678; Op_code = 3'b111;
        #10;

        // Default case: Invalid opcode
        A = 32'h00000000; B = 32'h00000000; Op_code = 3'bXXX;
        #10;

        $stop; // End simulation
    end

    initial begin
        $monitor("Time = %0t | Op_code = %b | A = %h | B = %h | Y = %h",
                 $time, Op_code, A, B, Y);
    end

endmodule
