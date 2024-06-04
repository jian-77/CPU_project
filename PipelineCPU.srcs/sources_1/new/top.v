
module top(
input oldclk,
input rst,
output [15:0] led,
input [15:0] switch,
input transit
    );
    
    cpuclk clk1( .clk_in1(oldclk), .clk_out1(clk) );
    
wire [31:0] instruction,instructionToID;
wire [4:0] rd,newRd,newRd2;
wire [31:0] dout,nextPC,ALUResult,newnextPC,newALUResult;
wire newRegWrite;
wire MemRead,MemWrite,MemtoReg,RegWrite;
wire newMemRead,newMemWrite,newMemtoReg;


    
IFetch ifetch(
.clk(clk),
.rst(rst),
.PC(newnextPC),
.instruction(instruction)
);

IFtoID iftoid(
clk,
rst,
instruction,
instructionToID
);  

wire [31:0] newread_data2,read_data2;
wire [31:0] newdout,newALUResult2;
wire [4:0] rs1, rs2;
wire [31:0] forwardResult1,forwardResult2;
wire [4:0] forwardReg1,forwardReg2;
ID id(
clk,
rst,
newRd2,
rd,
instructionToID, // 输入的32位指令地址
newdout,
newRegWrite2,newMemtoReg2,
MemRead,MemWrite,MemtoReg,RegWrite,
nextPC,
ALUResult,
newALUResult2,
read_data2,
rs1, rs2,
forwardResult1,
forwardReg1,
forward1,
forwardResult2,
forwardReg2,
forward2
);

Forwarding forwarding(
newRd,
newALUResult,
rs1, rs2,
forwardResult1,
forwardReg1,
forwardResult2,
forwardReg2,
forward1,
forward2,
newALUResult2,
newRd2,
newMemRead, 
dout,
newdout,
newMemtoReg2
     
    );




EXtoMEMorIFetch extomemorifetch(
clk,
rst,
MemRead,MemWrite,MemtoReg,RegWrite,
nextPC,
ALUResult,
rd,
newRd,
newMemRead,newMemWrite,newMemtoReg,newRegWrite,
newnextPC,
newALUResult,
read_data2,
newread_data2
);

wire [31:0] addr_out,write_data,m_rdata;

MemOrIO memorio( 
    .write(MemWrite),
    .addr_in(ALUResult),
    .r_rdata(read_data2),
    .io_wdata(led),
    .read(MemRead),
    .io_rdata(switch),
    .mRead(mRead),
    .mWrite(mWrite),
    .addr_out(addr_out),
    .write_data(write_data),
    .SwitchCtrl(SwitchCtrl)
);

DMem dmem(clk,rst,mRead,mWrite,addr_out,write_data,dout,SwitchCtrl,switch,transit);


MemtoWB memtowb(
clk,
rst,
newMemtoReg,newRegWrite,
newALUResult,
newRd,
newMemtoReg2,newRegWrite2,
newALUResult2,
newRd2,
dout,
newdout
);



    
endmodule
