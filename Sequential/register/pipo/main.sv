module main(input [3:0]in, input clk,clear_n,enable, output reg [3:0]out);
    always_ff@(posedge clk or negedge clear_n)
        begin
            if(!clear_n)
                out<=0;
            else if(enable)  
                out<=in;
            else
                out<=out;
        end
endmodule

module tb();
    reg[3:0]in;
    reg clk,clear_n,enable;
    wire [3:0]out;

    main uut(in,clk,clear_n,enable,out);

    always #2 clk=~clk;

    initial begin
        $monitor("time=%0t, clk=%b,clear_n=%b, enable=%b, in=%b, out=%b",$time,clk,clear_n, enable, in, out);
        clear_n=0;
        clk=0;
        enable=0;
        in=0;

        #2 clear_n=1;
        #4 enable=1; in=6;
        #2 enable=0;
        #2 enable=1; in=14;
        #8 $stop;           
    end
endmodule
