module Alu(input [3:0]a,b,sel,   output reg [4:0]out);
    always@(*) begin
        case(sel);
            0 : {carry,out} = a+b;
            1 : out = a-b;
            2 : out = a+1;
            3 : out = a-1;
            4 : out = a*b;
            5 : out = a&b;
            6 : out = a|b;
            7 : out = a^b;
            8 : out = ~a;
            9 : out = a<<1;
            10: out = a>>1;
            11: out = (a<b)?1:0;
            12: out = (a>b)?1:0;
            default: out = 0;
        endcase
    end
endmodule

