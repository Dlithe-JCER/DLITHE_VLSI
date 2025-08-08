module encoder4_2(input [3:0]a,  output [1:0]out);
    assign out[0] = a[1] | a[3];
    assign out[1] = a[2] | a[3];
endmodule



module encoder_tb();
    reg [3:0]A;
    wire [1:0]OUT;

    encoder4_2 uut(A, OUT);

    initial begin
        $monitor("time = %g,   A=%b    OUT=%b", $time, A, OUT);
        A=4'b0001;
        #2 A=4'b0010;
        #2 A=4'b0100;
        #2 A=4'b1000;
        #20 $finish();
    end
endmodule
