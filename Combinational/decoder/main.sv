module main(input [1:0]a, output reg[3:0]out);
    always_comb begin
    case(a)
        2'b00 : out = 4'b0001;
        2'b01 : out = 4'b0010;
        2'b10 : out = 4'b0100;
        2'b11 : out = 4'b1000;
        default : out = 4'b0000;
    endcase
    end
endmodule


module tb();
    reg [1:0]a;
    wire [3:0]out;

    main uut(a,out);

    initial begin
        $monitor("time=%0t, a=%b,  out=%b",$time,a,out);
        a=0;
        #10 $finish;
    end
    
    always#1 a=a+1;
endmodule
