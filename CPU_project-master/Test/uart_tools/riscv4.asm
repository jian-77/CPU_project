.text
Test15:
   add x0,x0,x0
   add x0,x0,x0
   add x0,x0,x0
   addi x12,x12,10
   addi x2,x2,76
   add x4,x0,x0 #x4 ��Ϊfib��һ����
   add x5,x0,x0 #x5 ��Ϊfib�ڶ�����
   add x6,x0,x0 #x6 ��Ϊ��ת
   add x7,x0,x0 #x7 ��¼��ջ��ջ��
 # ���� Fibonacci �ݹ麯��
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
    # ���� ra ��ջ
    addi x2, x2,8
    sw x4,0(x2)
    
    
    sw ra, -4(x2)
     # ��ջ
    addi x7, x7, 1

    # �Ƚ� a0 ����������
    bge x4, x12, end_recursion

    # �ݹ����
    add x6,x0,x5
    add x5, x4, x5
    mv x4, x6
    jal  fibonacci
    
    end_recursion:
    # �ָ� ra �ͼĴ���
    lw x4,0(x2)
    lw ra, -4(x2)
     # ��ջ
    addi x7, x7, 1
    addi x2, x2, -8
    jr ra