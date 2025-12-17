module tbuarttransmitter;

        reg clk;
        reg rst;
        reg received;
        reg [7:0] data; 
        
        wire tx;
        wire transmitting;
        wire transmitted;
        wire [7:0] data_received;
        wire baud_tickt;
        wire [15:0] counter;
        wire [3:0] countt;
        
        Uart_transmitter mod1(clk,rst,received,data,tx,transmitting,transmitted,
                                data_received,countt,baud_tickt,counter);
        
        always #5 clk <= ~clk;
        
        initial begin
                clk=0;rst=1;received=0;
                #2 rst=0;
                data=8'h42;
                
                #3 received=1;
                
                #130125 received =0;
                
                #5 data=8'h41;
                #10 received =1;
                #130125 received =0;
                
                
        end
        
endmodule
                