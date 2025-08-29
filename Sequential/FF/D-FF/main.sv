module main(input D,clk,reset_n, output reg Q, Qbar);
    always_ff@(posedge clk or negedge reset_n)
        begin
        if(!reset_n)
            begin
                Q <= 0;
                Qbar <= 0;
            end
        else
            case(D)
                0 :  begin Q <= 0;  Qbar <= 1; end
                1 :  begin Q <= 1;  Qbar <= 0; end
            endcase
        end
endmodule


module tb();
    reg d,clk,reset_n;
    wire q,qbar;
    
    main uut(d,clk,reset_n,q,qbar);
    
    always #2clk=~clk;
    
    initial begin
        $monitor("time=%0t,reset_n=%0b, d=%0b, q=%b, qbar=%b",$time,reset_n, d,q,qbar);
        clk=0;
        reset_n=0;
        #2 reset_n=1;
           d=0;
        #4 d=1;
        #10 $stop;
     end

endmodule
