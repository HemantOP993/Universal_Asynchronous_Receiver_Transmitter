module baud_generator(
        input clk,
        input rst
        ,output reg baud_tick
        ,output reg [15:0] counter 
        );
        
        // reg [16:0] counter; 
        
//        reg baud_tick;
//        reg [15:0] counter;
        
        always @(posedge clk or posedge rst) begin
            if(rst) begin
                counter <= 0;
                baud_tick <= 0;
            end
            else if (counter == 16'd867) begin
                baud_tick <= 1;
                counter <= counter +1;
            end
            
            else if(counter == 16'd868) begin
                  baud_tick <= 0;
                  counter <= 0;
            end
            
            else begin
                counter <= counter + 1;
            end
            
       end
endmodule
