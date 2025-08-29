module adder_4bit(input [3:0]a,b, input c,  output reg [3:0]sum, output reg carry);
    always_comb begin
        {carry,sum} = a + b + c;
    end
endmodule


module adder_tb();
    logic [3:0]a,b,sum;
    logic c;
    logic carry;
    int i,j;
    adder_4bit uut(a, b, c, sum, carry);

    initial begin
        $monitor("time=%g, a=%d, b=%d, c=%b, sum=%d, carry=%b", $time,a,b,c,sum,carry);
        c=0;
        #200 $finish;
    end

    initial begin
        for(i=0; i<16; i++)
            begin
                a=i;
                for(j=0; j<16 ; j++)
                    begin
                        b=j;
                        #1;
                    end
            end
    end




endmodule
