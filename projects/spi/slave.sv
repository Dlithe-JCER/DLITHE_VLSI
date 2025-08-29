module slave_spi #(parameter width=8)(input MOSI,SS_n, SCLK, reset_n, output reg MISO);
    reg [width-1:0]slave_reg;
    always_ff@(posedge clk or negedge reset_n)
        begin
            slave_reg[width-1]   
        end

    master_spi slave_connected(.MOSI(MOSI), .SS_n(SS_n), .SCLK(SLCK), .reset_n(reset_n), .MISO(MISO));
                      begin
                                        if(SCLK==1)
                                            slave_reg[width-1-count:0]
                                    end
                                else if(CPHA==0 && SCLK==0)
                                    begin
                                        master_reg[width-1-count] <= MISO;
                                        count <= count +1;
                                        if(count == width-1)
                                            state <= done;      
                                    end

endmodule













