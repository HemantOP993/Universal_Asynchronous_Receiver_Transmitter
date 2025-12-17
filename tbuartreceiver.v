module tbuartreceiver;
        
     reg clk;
     reg reset;
     reg rx;
     
     wire [7:0] data;
     wire receiving;
     wire baud_tickr;
     wire [15:0] counter;
     
     Uart_Receiver mod1(clk,reset,rx,data,receiving,baud_tickr,counter);
     
     always begin  
            #5 clk <= ~clk;
     end
     
     initial begin
            clk=0;reset=1;rx=1;
            #2 reset =0;
            
            // for A - 01000001
            // for B - 01000010
            #30000 rx=0; // start bit
            #8675 rx=1;
            #8675 rx=0;
            #8675 rx=0;
            #8675 rx=0;
            #8675 rx=0;
            #8675 rx=0;
            #8675 rx=1;
            #8675 rx=0;
            
            #8675 rx=1; // ideally
            
            
            #30000 rx=0; // start bit
            #8675 rx=0;
            #8675 rx=1;
            #8675 rx=0;
            #8675 rx=0;
            #8675 rx=0;
            #8675 rx=0;
            #8675 rx=1;
            #8675 rx=0;
            
            #8675 rx=1; // ideally
      end
     
endmodule