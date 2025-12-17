module Uart_transmitter(
         
        input clk,
        input rst,
        input received,
        input receiving, 
        input [7:0] data,
        
        output reg tx,
        output reg transmitting,
        output reg transmitted,
        output reg [7:0] data_received,
        output reg [3:0] countt,
        output baud_tickt,
        output [15:0] counter
        // output reg [3:0] countt
        );
        
//        wire baud_tickt;
//        wire [15:0] counter;
//       reg [3:0] countt;
        // baud_generator mod1(clk,rst,baud_tickt,counter);
        
        
        reg [7:0] data1;  // copied data 
        reg flag;
//        always @(posedge clk or posedge rst) begin
//            if(rst) begin
//                transmitting <= 0;
//                transmitted <= 1;
//            end
            
//            if(received) begin
//                transmitting <= 1;
//                transmitted <= 0;
                
//            end
//        end
        
        always @(posedge clk or posedge rst) begin
                
//                if(!received) begin
//                      transmitted <= 0;
//                end
               
                if(received ) begin
                    flag <= 1;
                    transmitted <= 0;
               end
                if(rst) begin
                    tx <= 1;
                    data_received <= 0; // data which I have received on computer 
                     transmitting <= 0;
                     transmitted <= 1;
                    countt <= 0;
                    data1 <= 0;
                    flag <= 0;
                end  
                
                
                else if( baud_tickt && flag) begin
                          
                          
                          if(tx && !transmitting && !transmitted) begin
                                transmitting <= 1;
                                data_received <= 0;
                                countt <= 0;
                                tx<=0;
                                data1<=data;
                          end                          
                          
                          else if(transmitting) begin
                                tx <= data1[0];
                                data1 <= data1 >> 1;
                                countt <= countt +1;
                                
                                if(transmitting && !transmitted) begin
                                    data_received <= {tx,data_received[7:1]};
                                end
                          
                                if(countt == 8) begin
                                    transmitting <= 0;
                                    transmitted <= 1;
                                    countt <= 0;
                                    tx <= 1;
                                    flag <= 0;
                               end
                          end
                   end
           end
endmodule 
                       