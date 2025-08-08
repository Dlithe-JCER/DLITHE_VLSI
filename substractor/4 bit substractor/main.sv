module main(input [3:0]a,b, input c,  output reg [3:0]diff, output reg bor);
    always_comb begin
        diff = a + ((~b) + c);//a+(2s compliment of b +1) = a-b
        if(a<b)               // bor=1 only if a<b
            bor = 1;
        else
            bor=0;
    end
endmodule



module tb();
    reg [3:0]a,b;
    reg c;
    wire [3:0]diff;
    wire bor;
    integer i,j;
    
    main uut(a,b,c,diff,bor);
    
    initial begin
        $monitor("time=%g, a=%b,  b=%b,  c=%b, diff=%0d,  bor=%b",$time,a,b,c,diff,bor);
        c=1;
        for(i=0; i<16; i++)
            begin
                a=i;
                for(j=0; j<16; j++)
                    begin
                    b=j;
                    #1;
                    end
            end
        #350 $stop;
    end
  endmodule

