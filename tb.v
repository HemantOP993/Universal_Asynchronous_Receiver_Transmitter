module tb;

    reg clk;
    reg reset;
    wire baud_tick;
    wire [15:0] counter;
    
    baud_generator mod1(clk,reset,baud_tick,counter);
    
    always #5 clk=~clk;
    
    initial begin
        clk=0;reset=1;
        
        #2 reset=0;
   end
   
   initial #100000 $finish;
endmodule 