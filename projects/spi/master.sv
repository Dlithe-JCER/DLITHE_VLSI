 module master_spi #(parameter width=8, parameter div=5, parameter num_slaves = 1)(
                  input MISO,
                  input reset_n, 
                  input clk, duplex_mode,
                  input [1:0]clk_mode,
                  input read_half_duplex,
                  input [width-1:0]tx_data,
                  input start,
                  output reg MOSI,SCLK,
                  output [num_slaves-1:0]SS_n,
                  output reg [width-1:0]rx_data
                  );

    reg [width-1:0]master_reg;
    reg [$clog2(width)-1:0]count; //$clog2(width) gives the number of bits required to count 0-7, so $clog2(width)=3, it is sv system function.
    typedef enum logic[1:0]{ idle,  transfer,  done } fsm;        
    fsm state;
    reg [7:0]clk_div;
    reg phase;
    
    logic CPOL,CPHA;
    assign {CPOL,CPHA} = clk_mode;
    always_ff@(posedge clk or negedge reset_n)
        begin
            if(!reset_n)
                begin
                    MOSI<=0;
                    SCLK<=0;
                    SS_n<=1;
                    count<=0;
                    master_reg<=0;
                    state<=idle;
                    phase<=0;
                    clk_div<=0;
                    rx_data<=0;
                end
             else
                 case(state)
                    idle    :   begin 
                                    if(start==0)
                                        begin
                                            MOSI<=0; 
                                            SCLK<=CPOL;
                                            count<=0;
                                            master_reg<=0;
                                            SS_n<=1;
                                            clk_div<=0;
                                            phase<=0;
                                            clk_div<=0;
                                        end
                                    else if(start==1)
                                        begin
                                            state<=transfer;
                                            SS_n<=0;
                                            master_reg<=tx_data;
                                        end
                                end

                    transfer:   begin
                                    if(SS_n==0)
                                        begin
                                             SCLK<=CPOL^phase;
                                            if(clk_div == div-1)
                                                begin
                                                    clk_div <= 0;
                                                    phase <= ~phase;
                                                 /*   if(phase==1)
                                                        begin
                                                            if(count==width-1)
                                                                begin
                                                                     count<=0;
                                                                    state<=done;
                                                                end
                                                            else                                                           
                                              
                                              count<=count+1;
                                                        end*/
                                                end
                                            else
                                                begin
                                                    clk_div <= clk_div + 1;   
                                                end
                                       end
                                   end//new line added
                               /*    
                                        if(duplex_mode)
                                            begin
                                                if(clk_mode==0)
                                                    begin
                                                        if(phase==1)
                                                            master_reg[width-1-count] <= MISO; 
                                                        else
                                                            MOSI <= master_reg[width-1-count];
                                                    end

                                                else
                                                    begin
                                                        if(phase==0)
                                                            master_reg[width-1-count] <= MISO; 
                                                        else
                                                            MOSI <= master_reg[width-1-count];
                                                    end                                                        
                                            end
                                        else
                                            begin
                                                if(read_half_duplex)
                                                    master_reg[width-1-count]<= MISO;
                                                else
                                                    MOSI <= master_reg[width-1-count];
                                            end
                                end*/
                           
     /*               done    :   begin
                                    rx_data<=master_reg;
                                    SS_n<=1;
                                    if(start==0)
                                    state<=idle;
                                end
                 endcasse*/

        always_ff@(posedge SCLK)
            begin

            end
        end   
    endmodule


