.text
Test15:
   add x0,x0,x0
   add x0,x0,x0
   add x0,x0,x0
   loop151: lw x12, (x19) #����a
lw x11,(x21)  #����ť������  mode0��1
bne x11,x15,loop151 #���û����ť���ظ�ѭ��
   addi x2,x2,76
   add x4,x0,x0 #x4 ��Ϊfib��һ����
   add x5,x0,x0 #x5 ��Ϊfib�ڶ�����
   add x6,x0,x0 #x6 ��Ϊ��ת
   add x7,x0,x0 #x7 ��¼��ջ��ջ��
   lui x8,0x02BDE
   addi x8,x8,0x780
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
    
add x9,x0,x0
loop2:sw x4, (x19) 
sw x4, (x19) 
sw x4, (x19) 
sw x4, (x19) 
addi x9,x9,1
blt x9,x8,loop2
    
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