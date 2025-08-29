module main(input a, input [1:0]sel, output reg [3:0]out);
    always_comb begin
        out=0;
        case(sel)
        2'b00 : out[0]=a;
        2'b01 : out[1]=a;
        2'b10 : out[2]=a;
        2'b11 : out[3]=a;
        endcase 
    end
endmodule

module tb();
    reg A;
    reg [1:0]SEL;
    wire [3:0]OUT;

    main uut(.a(A),  .sel(SEL), .out(OUT));
    
    initial begin
        $monitor("time = %g,   A = %b,    SEL = %d,    OUT=%b",$time, A, SEL, OUT);
        SEL=0;
        A=0;
        #20 $finish();
    end

        always#4 SEL=SEL+1;
        always#1 A=A+1;
           
endmodule
