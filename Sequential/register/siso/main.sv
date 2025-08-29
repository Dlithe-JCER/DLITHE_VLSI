 module main(input in, clk, clear_n, output out );
    reg q1,q2,q3,q4;
   
     
    always_ff@(posedge clk or negedge clear_n)
        begin
            if(!clear_n)
                begin
                    {q1,q2,q3,q4}<=0;
                end
            else
                begin
                   q1<=q2;
                   q2<=q3;
                   q3<=q4;
                   q4<=in;
                end

        end
    assign out=q1;

 endmodule


 module tb;
        reg in ,clk,clear_n;
        wire out;
        main uut(in, clk,clear_n,out);

        always #2 clk=~clk;

        initial begin   
            $monitor("time=%0t,clk=%b clear_n=%b, out=%b, in=%b",$time,clk,clear_n,out, in);
            clear_n=0;
            clk=0;
            in=0;
            #6  clear_n=1;
                repeat(20)
                #4 in = $random%2;
           #100 $finish;
        end
 endmodule
