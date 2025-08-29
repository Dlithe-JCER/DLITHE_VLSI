module fulladder(input a,b,c, output reg carry, sum);
    always_comb begin
        sum = a^b^c;
        carry = (a&b) + (a&c) + (b&c);
    end
endmodule


module full_adder_tb();
    reg a, b ,c;
    wire sum, carry;

    fulladder uut(a, b, c, carry, sum);

    initial begin
        $monitor("time = %g,   {a,b,c}=%b, sum=%b, carry=%b", $time, {a,b,c},  sum, carry);
        {a,b,c} = 0;
        #20 $finish();
    end
        always #1 c=c+1;
        always #2 b=b+1;
        always #4 a=a+1;
  

endmodule
