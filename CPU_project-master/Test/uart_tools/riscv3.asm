.data
input_value:    .word 8         # 这里是输入数据，表示要计算小于这个数的斐波那契数的数目

 .text
    # 加载输入数据
    la t0, input_value
    lw t1, 0(t0)                  # t1 = 输入数据

    # 调用 Fibonacci 递归函数
    li a0, 0                      # a0 = fib(0)
    li a1, 1                      # a1 = fib(1)
    jal ra, fibonacci

   mv a0,t3
    
    #显示数据
    li a7,1
    ecall

    # 程序结束
    li a7, 10                     # ecall 退出
    ecall

# 递归函数: fibonacci(a0, a1)
fibonacci:
    # 保存 ra 到栈
    addi sp, sp, -8
    sw a0,0(sp)
    sw ra, 4(sp)
     # 入栈
    addi t3, t3, 1

    # 比较 a0 和输入数据
    bge a0, t1, end_recursion



    # 递归调用
    add a3,x0,a1
    add a1, a0, a1
    mv a0, a3
    jal ra, fibonacci

end_recursion:
    # 恢复 ra 和寄存器
    lw a0,0(sp)
    lw ra, 4(sp)
     # 出栈
    addi t3, t3, 1
    
    addi sp, sp, 8
    jr ra