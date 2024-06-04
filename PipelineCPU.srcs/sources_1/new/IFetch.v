module IFetch(
input clk,
input rst,
input [31:0] PC,
output  [31:0] instruction
);
    


 reg [13:0] addr; // Changed to reg type
       always @* begin // Changed to combinational block
           addr = PC[15:2];
       end
   InstMem imem(.clka(clk),.addra(addr),.douta(instruction));
    
   
    
    
endmodule