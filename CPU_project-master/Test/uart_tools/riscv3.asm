.data
input_value:    .word 8         # �������������ݣ���ʾҪ����С���������쳲�����������Ŀ

 .text
    # ������������
    la t0, input_value
    lw t1, 0(t0)                  # t1 = ��������

    # ���� Fibonacci �ݹ麯��
    li a0, 0                      # a0 = fib(0)
    li a1, 1                      # a1 = fib(1)
    jal ra, fibonacci

   mv a0,t3
    
    #��ʾ����
    li a7,1
    ecall

    # �������
    li a7, 10                     # ecall �˳�
    ecall

# �ݹ麯��: fibonacci(a0, a1)
fibonacci:
    # ���� ra ��ջ
    addi sp, sp, -8
    sw a0,0(sp)
    sw ra, 4(sp)
     # ��ջ
    addi t3, t3, 1

    # �Ƚ� a0 ����������
    bge a0, t1, end_recursion



    # �ݹ����
    add a3,x0,a1
    add a1, a0, a1
    mv a0, a3
    jal ra, fibonacci

end_recursion:
    # �ָ� ra �ͼĴ���
    lw a0,0(sp)
    lw ra, 4(sp)
     # ��ջ
    addi t3, t3, 1
    
    addi sp, sp, 8
    jr ra