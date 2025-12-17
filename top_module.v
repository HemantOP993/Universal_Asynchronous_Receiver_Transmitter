module top_module(
        
        input clk,
        input rst,
        input rx,
        output tx,
       output receiving,
       output received,
       output transmitting,
        output transmitted,
        output [7:0] data_received,  // data received at computer
        output [7:0] data,
        output [15:0] counter,
        output baud_tick,
        output [3:0] countt,
        output [3:0] countr
        );
        
//        wire receiving;
//        wire received;
//        wire transmitting;
//        wire transmitted;
//        wire [7:0] data_received;
//        wire [7:0] data;
//        wire [15:0] counter;
//        wire baud_tick;
//        wire [3:0] countt;
//        wire [3:0] countr;
        // controller mod0(clk,rst,receiving,received,transmitting,transmitted);
        baud_generator mod1(clk,rst,baud_tick,counter);
        Uart_Receiver mod2(clk,rst,rx,transmitted,transmitting,data,receiving,
                            received,baud_tick,counter,countr);
       
       Uart_transmitter mod3(clk,rst,received,receiving,data,tx,transmitting,
                            transmitted,data_received,countt,baud_tick);
                            
                            
endmodule