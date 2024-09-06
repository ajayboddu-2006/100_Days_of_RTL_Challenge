`timescale 1ns/1ns
module adder_test;
    reg a, b;
    wire sum, carry;
    adder DUT(.a(a), .b(b), .sum(sum), .carry(carry));
    initial begin
        $dumpfile("adder.vcd");
        $dumpvars(0, adder_test);
        $monitor($time, "  a = %b, b = %b, sum = %b, carry = %b", a, b, sum, carry);
        #5 a = 0; b = 0;  // 00 -> 0 sum, 0 carry
        #5 a = 1; b = 0;  // 01 -> 1 sum, 0 carry
        #5 a = 1; b = 1;  // 11 -> 0 sum, 1 carry
        #5 a = 0; b = 1;  // 10 -> 1 sum, 0 carry
        #5 a = 1; b = 1;  // 11 -> 0 sum, 1 carry
        #5 a = 0; b = 0;  // 00 -> 0 sum, 0 carry
        #5 $finish;
    end
endmodule
