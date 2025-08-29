module main(input clk, clear, output reg q0,q1,q2,q3);
    always_ff@(posedge clk or posedge clear)
        if(clear)
            {q3,q2,q1,q0} <= 0;
        else if({q3,q2,q1,q0} == 0)              
            {q3,q2,q1,q0} <= 3;
        else if({q3,q2,q1,q0} == 3)              
            {q3,q2,q1,q0} <= 5;
        else if({q3,q2,q1,q0} == 5)
            {q3,q2,q1,q0} <= 6;
        else     
            {q3,q2,q1,q0} <= 0;
    endmodule


module tb();
    reg clk,clear;
    wire q1,q2,q0,q3;

    main uut(clk,clear,q0,q1,q2,q3);
    
    always#2 clk=~clk;

    initial begin
        $monitor("time=%0t, clear=%b, q3=%b, q2=%b, q1=%b, q0=%b",$time,clear,q3,q2,q1,q0);
        clk=0;
        clear=1;
        #4 clear=0;
        #70 $stop;
    end
endmodule
