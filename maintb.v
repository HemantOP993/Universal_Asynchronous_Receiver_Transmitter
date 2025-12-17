module maintb;
        
        reg clk;
        reg rst;
        reg rx;
        
        wire tx;
        wire receiving;
        wire received;
        wire transmitting;
        wire transmitted;
        wire [7:0] data_received;
        wire [7:0] data;
        wire [15:0] counter;
        wire baud_tick;
        wire [3:0] countt;
        wire [3:0] countr;
        
        top_module mod1(clk,rst,rx,tx,receiving,received,transmitting,
                        transmitted,data_received,data,counter,baud_tick,
                        countt,countr);
                        
       always #5 clk <= ~clk;
       
       initial begin
            clk=0;rst=1;rx=1;
            #2 rst =0;
            
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
            
            #108075
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