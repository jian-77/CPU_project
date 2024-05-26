
lui x4,0x7ffff
loop17: 
sw x4,(x19)
sw x4,(x19)
sw x4,(x19)
sw x4,(x19)
lw x11,(x20)  
bne x11,x18,loop17
loop:beq x0,x0,loop