module generatormatrix(
    input clk,
    input reset,
    input enb,
    input dataIn,
    input en,
    output reg dataOut_0,
    output reg dataOut_1,
    output reg dataOut_2
);
    // Define a 7-bit shift register
    reg [6:0] shiftReg;

    // Update the shift register on the rising edge of the clock or reset
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            shiftReg <= 7'b0;  // Clear shift register on reset
        end else if (enb && en) begin
            shiftReg <= {shiftReg[5:0], dataIn};  // Shift in the new bit from dataIn
        end
    end

    // Calculate the output bits based on the generator matrix using XOR gates
    always @* begin
        // Generator matrix implementation using XOR of specific bits
        dataOut_0 = shiftReg[6] ^ shiftReg[4] ^ shiftReg[3] ^ shiftReg[0];
        dataOut_1 = shiftReg[6] ^ shiftReg[5] ^ shiftReg[4] ^ shiftReg[0];
        dataOut_2 = shiftReg[6] ^ shiftReg[5] ^ shiftReg[4] ^ shiftReg[2] ^ shiftReg[0];
    end

endmodule
