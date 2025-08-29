module main(input x, clk, clear, output reg out);
    reg [1:0]q;
    always_ff@(posedge clk or posedge clear)
        begin
            if(clear)
                q<=0;
            else
                begin
                    q[1] <= ~x & (q[1] ^ q[0]);
                    q[0] <= x | (q[1] & ~q[0]);
                    out <= x&q[1]&q[0];
                end
        end 
   
endmodule


module tb;
    reg clk, clear, x;
    wire out;

    main uut(x,clk,clear,out);

    always #2 clk=~clk;

   initial begin
        $monitor("time=%0t,clk=%b, x=%b, clear=%b, out=%b",$time,clk, x,clear, out);
        clk=0;
        clear=1;
        x=0;
        #2 clear = 0;
        #4 x=1; //5
        #4 x=0; //9
        #4 x=0; //13
        #4 x=1; //17
        #4 x=0; //21
        #4 x=0; 
        #4 x=1; 
        #4 x=1; 
        #4 x=1; 
        #4 x=0; 
        #4 x=1;        
         $finish;
    end 

endmodule

