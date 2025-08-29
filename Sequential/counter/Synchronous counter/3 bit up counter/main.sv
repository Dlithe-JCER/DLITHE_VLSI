module main(input clk,clear, output reg q2,q1,q0);
    always_ff@(posedge clk or posedge clear)
        begin
            {q2,q1,q0} <= (clear)?  0 : {q2,q1,q0}+1; 
        end
endmodule

module tb();
    reg clk,clear;
    wire q1,q2,q0;

    main uut(clk,clear,q2,q1,q0);
    
    always#2 clk=~clk;

    initial begin
        $monitor("time=%0t, clear=%b, q2=%b, q1=%b, q0=%b",$time,clear,q2,q1,q0);
        clk=0;
        clear=1;
        #4 clear=0;
        #40 $stop;
    end
endmodule

