module main(input a,sel,  output reg out1, out2);
    always_comb begin
        if(sel==0)
            out1=a;
        else
            out2=a;
    end
endmodule



module tb();
    reg a, sel;
    wire out1,out2;
    
    mux_2_1 uut(a,sel,out1,out2);

    initial begin
        $monitor("time=%g,   a=%b,   sel=%b,   out1=%b,  out2=%b",$time, a,sel,out1,out2);
        a=0; sel=0;
        #5 sel=1;
        #5 $stop;
    end

    always #1 a=a+1;
endmodule
