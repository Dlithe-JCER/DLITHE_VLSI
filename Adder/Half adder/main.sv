module half_adder(input a,b, output reg sum, carry);
    always_comb begin
        sum = a+b;
        carry = a*b;
    end
endmodule


module half_adder_tb();
    reg a, b;
    wire sum, carry;
    int i;

    half_adder uut(a, b, sum, carry);

    initial begin
        $monitor("time=%g,  a=%b, b=%b, sum=%b, carry=%b",$time,a,b,sum,carry);
        for(i=0; i<4; i++)
            begin
                {a,b}=i;
                #1;
            end
    #20 $finish();        
    end

endmodule
