
module tb(
    );
    reg oldClk;
    reg rst;
    reg transit;
    wire [15:0]led;
    reg [15:0] switch;
   top dut(oldClk,rst,led,switch,transit);
    
    initial begin
    rst=1'b0;
    #2500 rst=1'b1;
    #1 rst=1'b0;
    end
    initial begin
      
    oldClk = 1'b0;
    forever #5 oldClk=~oldClk;
    end
    
    initial begin
    transit=1'b0;
    #2550 transit=1'b1;
    #160 transit=1'b0;
    
    end
    
    initial begin
    #30 switch= 16'habb;
    end
endmodule