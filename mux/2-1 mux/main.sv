module mux_2_1(input a,b,sel,  output reg out);
    always_comb
    begin
        out <= sel ? b : a;
    end
endmodule


module mux_tb();
    reg a, b;
    reg sel;
    wire out;
    
    mux_2_1 uut(a,b,sel,out);

    initial begin
        $monitor("time=%g,   a=%b,   b=%b,   sel=%b,   out=%b",$time, a,b,sel,out);
        a=0; b=0; sel=0;
        #20 $finish();
    end
        always #1 a=a+1;
        always #2 b=b+1;
        always #1 sel=sel+1;
         
endmodule
