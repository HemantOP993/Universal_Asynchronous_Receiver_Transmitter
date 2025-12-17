module controller(
        input clk,
        input rst,
        output reg receiving,
        output reg received,
        output reg transmitting, 
        output reg transmitted);
        
        always @(posedge clk or posedge rst) begin
            if(rst) begin
                receiving <= 0;
                received <= 0;
                transmitted <= 1;
                transmitting <= 0;
            end
            if(received) begin
                transmitted <= 0;
                transmitting <= 1;
            end
            
            if(transmitted) begin
                received <= 0;
                receiving <= 1;
            end
       end
endmodule