 module main(input [4:1]in,input load,clk,si, clear_n, output out);
    reg q4,q3,q2,q1;
    always_ff@(posedge clk or negedge clear_n)
        begin
            if(!clear_n)
                begin
                    q3<=0; q4<=0;
                    q1<=0; q2<=0;
                end
            else if(load==1)
                begin
                    q1<=in[1];
                    q2<=in[2];
                    q3<=in[3];
                    q4<=in[4];                       
                end
           else
               begin
               q4<=si;
               q3<=q4;
               q2<=q3;
               q1<=q2;
               end
        end
    assign out=q1;

endmodule


 module tb;
        reg [4:1]in ;
        reg clk,clear_n,load,si;
        wire out;

        main uut(in,load, clk,si,clear_n,out); 

        always #2 clk=~clk;

        initial begin    
            $monitor("clk=%b,time=%0t, clear_n=%b,load=%b,in=%b, out=%b",clk,$time,clear_n,load,in,out);
            clear_n=0;
            clk=0;
            in=0;
            si=0;
            load=0;

            #6  clear_n=1;
                load=1;
                in = 10;
            #2 load=0;
            #18 load=1;
                in = 12;
            #2 load=0;
            #20$stop;                            
        end
 endmodule
