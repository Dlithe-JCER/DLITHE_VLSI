module main(input [3:0]a,b, input c,  output reg [3:0]sum, output reg carry);
    always_comb begin
        if(c==1)
            begin
                sum = a + (~b+1);
                if(a<b)
                    carry=1;
                else
                    carry=0;
            end
        else 
            {carry,sum} = a + b;        
    end
endmodule




module tb();
    reg [3:0]a,b;
    reg c;
    wire [3:0]sum;
    wire carry;

    main uut(a,b,c,sum,carry);

    initial begin
        $monitor("time=%g, a=%b, b=%b,c=%b, sum=%b, carry=%b",$time,a,b,c,sum,carry);
        {a,b}=0;
        c=0;
    end

    always #1 b=b+1;
    always #4 a=a+1;

    initial begin
    #256 $display("____________________________________________________________");
         $display("_____________________substaction_______________________________________");
    c=1;
    #512 $stop;
    end

endmodule
