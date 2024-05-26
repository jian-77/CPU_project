.text
Test15:
   add x0,x0,x0
   add x0,x0,x0
   add x0,x0,x0
   addi x12,x12,10
   addi x2,x2,76
   add x4,x0,x0 #x4 作为fib第一个数
   add x5,x0,x0 #x5 作为fib第二个数
   add x6,x0,x0 #x6 作为中转
   add x7,x0,x0 #x7 记录入栈出栈数
 # 调用 Fibonacci 递归函数
    li x4, 0                      # x4 = fib(0)
    li x5, 1                      # x5 = fib(1)
    jal  fibonacci
    
     loop155: 
sw x7,(x19)
sw x7,(x19)
sw x7,(x19)
sw x7,(x19)
lw x11,(x20)  
bne x11,x18,loop155
loop:beq x0,x0,loop
   
    fibonacci:
    # 保存 ra 到栈
    addi x2, x2,8
    sw x4,0(x2)
    
    
    sw ra, -4(x2)
     # 入栈
    addi x7, x7, 1

    # 比较 a0 和输入数据
    bge x4, x12, end_recursion

    # 递归调用
    add x6,x0,x5
    add x5, x4, x5
    mv x4, x6
    jal  fibonacci
    
    end_recursion:
    # 恢复 ra 和寄存器
    lw x4,0(x2)
    lw ra, -4(x2)
     # 出栈
    addi x7, x7, 1
    addi x2, x2, -8
    jr ra