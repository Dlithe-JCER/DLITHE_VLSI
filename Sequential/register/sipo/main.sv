 module main(input in, clk, clear_n, output [4:1]out );
    reg q1,q2,q3,q4;
    reg [4:1]R;
    reg [1:0]count;
    always_ff@(posedge clk or negedge clear_n)
        begin
            if(!clear_n)
                begin
                    {q1,q2,q3,q4}<=0;
                    count<=0;
                    R<=0;
                end
            else
                begin
                    q1<=q2;
                    q2<=q3;
                    q3<=q4;
                    q4<=in;
                    count<=count+1;
                    if(count==3)
                        begin
                            R<={in,q4,q3,q2};
                        end
                end
        end
    assign out[1]=q1; 
    assign out[2]=q2;
    assign out[3]=q3;
    assign out[4]=q4;
    
  endmodule


 module tb;
        reg in ,clk,clear_n;
        wire[4:1]out;
        main uut(in, clk,clear_n,out);
        always #2 clk=~clk;

        initial begin   
            $monitor("time=%0t,clk=%b clear_n=%b, out=%b, in=%b",$time,clk,clear_n,out, in);
            clear_n=0;
            clk=0;
            in=0;
            #6  clear_n=1;
                repeat(20)
                #4 in = ($random%2!==in);
           #2 $finish;
        end
 endmodule
