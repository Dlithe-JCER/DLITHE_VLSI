module half_substractor(input a,b, output reg borrow, difference);
    always_comb begin
        difference = a^b;
        borrow = (~a)&b; 
    end
endmodule


module sub();
    reg a,b;
    wire diff;

    half_substractor uut(a, b, bor, diff);

    initial begin
    $monitor("time=%g,  a=%b,  b=%b,  bor=%b,  diff=%b",$time,a,b,bor,diff);
        {a,b}=0;
        #1{a,b}=1;
        #1{a,b}=2;
        #1{a,b}=3;
        #1$finish;
    end
endmodule
