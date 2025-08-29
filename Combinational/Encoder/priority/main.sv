module pri_encoder(input[3:0]a, output reg v,  output reg [1:0]out);
    always@(a)
        begin
            if(a==0)
                begin
                    v = 0;
                    out = 2'bxx;
                end
            else
                begin 
                    v = 1;
                    casex(a)
                    4'b0001 : out = 0;
                    4'b001x : out = 1;
                    4'b01xx : out = 2;
                    4'b1xxx : out = 3;
                    endcase
                end
        end
endmodule




module encoder_tb();
    reg [3:0]A;
    reg V;
    wire [1:0]OUT;

    pri_encoder uut(A, V, OUT);

    initial begin
     $monitor("time=%g,   V=%b,    A=%b,    OUT=%b",$time, V, A, OUT);
     A = 4'b0000;
     #20 $finish();
    end

    always #1 A[0] = A[0]+1;
    always #2 A[1] = A[1]+1;
    always #4 A[2] = A[2]+1;
    always #8 A[3] = A[3]+1;
endmodule
