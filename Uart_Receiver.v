module Uart_Receiver (
        input clk,
        input rst, 
        input rx,
        input transmitted,
        input transmitting,
        output reg [7:0] data,
        output reg receiving,
        output reg received,
        output baud_tickr,
        output [15:0] counter,
        output reg [3:0] countr );
        
        // baud_generator mod1(clk,rst,baud_tickr,counter);
        // reg  [3:0] countr;
        
//        always @(posedge clk or posedge rst) begin
//            if(rst) begin
//                receiving <= 0;
//                received <= 0;
//            end
            
//        end
        
        always @(posedge clk or posedge rst) begin
//                if(transmitted) begin
//                    receiving <= 1;
//                end

//                if(transmitted && !transmitting) begin   
//                    if(!rx && !receiving) begin
//                        receiving <= 1;
                        
//                    end
//                    received <= 0;

//                end
                received <= 0;
                if(rst) begin
                    data <= 0; 
                     receiving <= 0;
                    countr <= 0;
                     received <= 0;
                end
                
                else if(baud_tickr ) begin
                        if(!rx && !receiving) begin
                            receiving <= 1;
                            data <= 0;
                        end
                        else if(receiving) begin 
                            data <= {rx,data[7:1]};
                            countr <= countr +1;
                            if(countr == 7) begin
                                receiving <= 0;
                                countr <= 0;
                                received <= 1;
                            end
                       end
                end
      end
      
endmodule 
                
                                   
                            
                            