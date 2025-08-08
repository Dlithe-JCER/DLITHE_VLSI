module mux_4_1(input a,b,c,d, input [1:0]sel, output out);
    assign out = (sel == 0) ? a :
                (sel == 1) ? b :
                (sel == 2) ? c : d;
endmodule



module mux_tb();
    reg A,B,C,D;
    reg [1:0]SEL;
    wire OUT;

    mux_4_1 uut(.a(A),  .b(B),  .c(C),  .d(D),  .sel(SEL), .out(OUT));
    
    initial begin
        {A,B,C,D} = 4'b1010;
        SEL = 0;
        $monitor("time = %g,   {A,B,C,D} = %b,    SEL = %d,    OUT=%b",$time, {A,B,C,D}, SEL, OUT);
       #20 $finish;
    end

    always #2 {A,B,C,D} <= {A,B,C,D} + 1;
    always #2 SEL[0] <= SEL[0]+1;
    always #4 SEL[1] <= SEL[1]+1;

endmodule
