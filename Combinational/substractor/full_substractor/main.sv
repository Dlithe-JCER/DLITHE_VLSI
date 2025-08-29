module main(input a,b,c, output bor,diff);
    assign diff = a^b^c;
    assign bor = ((~a)&b) | ((~a)&c) | (b&c);
endmodule


module tb();
    logic a,b,c;
    logic bor,diff;

    main uut(a,b,c,bor,diff);

    initial begin
        $monitor("time=%g, {a,b,c}=%b, bor=%b,  diff=%b",$time, {a,b,c}, bor,diff);
        {a,b,c}=0;
        #10 $stop;
    end

    always #1 c=c+1;
    always #2 b=b+1;
    always #4 a=a+1;
  
endmodule
