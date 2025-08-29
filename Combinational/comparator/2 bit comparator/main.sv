module main(input [1:0]a,b,  output reg equal, greater, lesser);
    always_comb begin
        equal=0;
        greater=0;
        lesser=0;

        if(a==b)
            equal=0;
        else if(a<b)
            lesser=1;
        else
            greater=1;
    end
endmodule




module tb();
    reg [1:0]a, b;
    wire equal,greater,lesser;
    
    main uut(a,b,equal,greater,lesser);

    initial begin
        $monitor("time=%g, a=%d, b=%d, equal=%b, greater=%b, lesser=%b",$time,a,b,equal,greater,lesser);
        {a,b}=0;
        #25 $stop;
    end

        always #1 b=b+1;
        always #4 a=a+1;

endmodule
