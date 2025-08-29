module main(input j,k,clk,reset_n, output reg q,qbar);
    always_ff@(posedge clk  or negedge reset_n)
        begin
            if(reset_n==0)
                begin
                q<=0;
                qbar<=1;
                end
            else
                 case({j,k})
                   2'b00 : begin q<=q; qbar<=qbar; end
                   2'b01 : begin q<=0; qbar<=1; end
                   2'b10 : begin q<=1; qbar<=0; end
                   2'b11 : begin q<=~q; qbar<=~qbar; end
                endcase
              end
endmodule


module tb;
    reg clk,j,k,reset_n;
    wire q,qbar;

    main uttt(j,k,clk,reset_n,q,qbar);

    always#2 clk=~clk;

    initial begin
        $monitor("time=%0t, reset_n=%b, j=%b, k=%b, q=%b, q_bar=%b",$time, reset_n, j, k, q, qbar);
        clk=0;
       reset_n=0;
        #2 reset_n=1;
        {j,k}=00;
        #4{j,k}=01;
        #4{j,k}=10;
        #4{j,k}=11;
        #4 $stop;
   
   end
endmodule

