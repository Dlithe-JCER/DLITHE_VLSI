module main(input serial_r, serial_l, select, clk, clear_n,output out);
    reg [3:0]q;
    always_ff@(posedge clk or negedge clear_n)
        begin
            if(!clear_n)
                q<=0;
            else
                q<=(select)? {serial_r, q[3:1]} : {q[2:0],serial_l}; 
        end
        assign out = select? q[0] : q[3] ;
endmodule



 module tb;
        reg select,serial_r,serial_l ,clk,clear_n;
        wire out;

        main uut(serial_r, serial_l,select, clk, clear_n,out);

        always #2 clk=~clk;

        initial begin   
            $monitor("time=%0t,clk=%b, clear_n=%b, select=%b, serial_r=%b, serial_l=%b, out=%b",$time,clk,clear_n,select,serial_r,serial_l,out);
            clear_n=0;
            clk=0;
            serial_r=0;
            serial_l=1;
            
            #6  clear_n=1;
                select=1;
                repeat(4)
                    begin
                        serial_r = ~serial_r;
                        #4;
                    end

          #12   clear_n=0;

            #4  clear_n=1;
                select=0;
                repeat(4)
                    begin
                        serial_l=~serial_l;
                        #4;
                    end
            #12  $finish;
        end
 endmodule
