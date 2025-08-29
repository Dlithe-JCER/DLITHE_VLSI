module main(input T,clk,clear, output reg Q, Qbar);
    always_ff@(posedge clk or posedge clear)
        begin
            if(clear==1)
                begin
                    Q<=0;
                    Qbar<=1;
                end
            else
                begin
                    Q <= (T)? ~Q: Q;
                    Qbar <= (T)? ~Qbar : Qbar;
                end
                
        end
endmodule


module tb;
    reg t,clk,clear;
    wire q, qbar;

    main uut(t,clk,clear,q,qbar);  

    initial begin
        $monitor("time=%0t, t=%b, q=%b, qbar=%b, clear=%b",$time,t,q,qbar,clear);
        clk=0; 
        clear=1;
        #2 clear=0;t=0;
        #4 t=1;
        #10 $finish;
    end

    initial 
          forever #2 clk=~clk;          

endmodule



