module main(input clk, clear, output reg Q0, Q1);
    always_ff@(negedge clk or negedge clear)
        Q0<=(clear)? ~Q0 : 0;

    always@(negedge Q0 or negedge clear)
        Q1<=(clear)? ~Q1 : 0;                
endmodule


module tb();
    wire q0, q1;
    reg clk, clear;

    main uut(clk,clear,q0,q1);
    
    always#2 clk=~clk;

     initial begin
        $monitor("time=%0t, clear=%b,  q1=%b, q0=%b",$time,clear,q1,q0);
        clk=0;
        clear=0;
        #2 clear=1;
        #20 $stop;
     end
endmodule
