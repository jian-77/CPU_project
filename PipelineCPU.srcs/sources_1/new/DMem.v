module DMem(
input clk,
input rst,
input MemRead,MemWrite,
input [31:0] addr,
input [31:0] din,
output [31:0] dout,
input SwitchCtrl,
input[15:0] io_rdata,
input transit
    );
 reg [15:0] io_out,newio_out;
 wire [31:0] memout;
 reg newSwitchCtrl;
always @* begin
    if(SwitchCtrl)begin
        if(transit==1&&addr[0])io_out<=16'h123;
        else io_out<=io_rdata;
    end
end
always@(posedge clk)begin
    newio_out<=io_out;
    newSwitchCtrl<=SwitchCtrl;
end
    
    assign dout= newSwitchCtrl==1?newio_out:memout;
    
    DRAM udram(.clka(clk), .wea(MemWrite), .addra(addr[15:2]), .dina(din), .douta(memout));
endmodule