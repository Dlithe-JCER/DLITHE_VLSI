module main(input a,b,  output reg equal, greater, lesser);

    always_comb begin
    equal=0; lesser=0; greater=0;
        if(a==b)
            equal=1;
        else if(a<b)
            lesser=1;
        else
            greater=1;
    end

endmodule


module tb();
    reg a,b;
    wire equal, lesser, greater;

    main uut(a,b,equal,greater,lesser);
    
    initial begin
        $monitor("time=%g, a=%b  b=%b, equal=%b, greater=%b, lesser=%b",$time,a,b,equal,greater,lesser);
        {a,b}=0;
        #2{a,b}=2'b01;
        #2{a,b}=2'b10;
        #2{a,b}=2'b11;
        #10 $stop;
    end

endmodule
