module main(input clk,clear, output reg Q0, Q1, Q2, comb);
   
    always_ff@(negedge clk or negedge clear or negedge comb)
        Q0<=(!clear || !comb)? 0 : ~Q0;
            

    always_ff@(negedge Q0 or negedge clear or negedge comb)
         Q1<=(!clear || !comb)? 0 : ~Q1;

    
    always_ff@(negedge Q1 or negedge clear or negedge comb )
         Q2<=(!clear || !comb)? 0 : ~Q2;
        
    always_comb
        comb = ~(Q2&Q0);

endmodule

module tb;
    reg clk,clear;
    wire q1,q2,q0,comb;

    main uut(clk,clear,q0,q1,q2,comb);
    
    always #2 clk=~clk;

    initial begin
        $monitor("time=%0t, clear=%b, comb=%b, q2=%b, q1=%b, q0=%b",$time,clear,comb,q2,q1,q0);
        clk=0;
        clear=0;
        #4 clear=1;
        #30 $stop;
    end

endmodule

