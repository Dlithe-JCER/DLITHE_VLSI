module main(input clk,clear_n, input[3:0]in, input serial_R,serial_L,
            input [1:0]select, output reg [3:0]out);
        always_ff@(posedge clk or negedge clear_n)
        begin
            if(!clear_n)
                out<=0;
            else
                case(select)
                    2'b00  :    out<=out;

                    2'b01  :    out<={serial_R,out[3:1]};
                                    
                    2'b10  :    out<={out[2:0],serial_L};

                    2'b11  :    out<=in;

                    default:    out<=out;

                endcase       
         end
endmodule

 module tb;
        reg [3:0]in;
        reg clk,clear_n,serial_L,serial_R;
        reg [1:0]select;
        wire [3:0]out;

        main uut(clk,clear_n,in,serial_R, serial_L,select,out);


        always #2 clk=~clk;

        initial begin   
            $monitor("clk=%b,time=%0t,serial_L=%b, serial_R=%b, select=%b, clear_n=%b, in=%b, out=%b",clk,$time,serial_L,serial_R,select,clear_n,in,out); 

            clear_n=0;
            clk=0;
            in=0;
            #2  clear_n=1;
                serial_L=1;
                serial_R=0;
                in=8;
                select=2'b11;
            
            #4 clear_n=0;
            #4 select=2'b01;
                clear_n=1;
                repeat(4)
                begin
                serial_R=~serial_R;
                #4;
                end
            
            clear_n=0;
            
            #4  select = 2'b10;
                clear_n=1;
                repeat(4)
                begin
                    serial_L=~serial_L;
                    #4;
                end

            
                select=00;
                clear_n=1;

            #4 $finish;
        end
 endmodule
