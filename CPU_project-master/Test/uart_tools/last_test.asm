add x0,x0,x0
add x0,x0,x0
lui x19, 0x000fffff #00 ������
addi x20,x19,1 #01
addi x21,x20,1 #10

addi x15, x0, 0x000001ff#�����˳�ѭ��
addi x16, x0, 0x000002ff#�����˳�ѭ��
addi x17, x0, 0x000003ff#�����˳�ѭ��
addi x18, x0, 0x000004ff#�����˳�ѭ��
addi x3,x0,1#��Ӧ����1
sw x3,12(x0) 
addi x3,x0,2#��Ӧ����2
sw x3,16(x0) 
addi x3,x0,3#��Ӧ����2
sw x3,20(x0) 
addi x3,x0,4#��Ӧ����2
sw x3,24(x0) 
addi x3,x0,5#��Ӧ����2
sw x3,28(x0) 
addi x3,x0,6#��Ӧ����2
sw x3,32(x0) 
addi x3,x0,7#��Ӧ����2
sw x3,36(x0) 
addi x3,x0,8#��Ӧ����2
sw x3,40(x0) 
addi x3,x0,9#��Ӧ����2
sw x3,44(x0) 
addi x3,x0,10#��Ӧ����2
sw x3,48(x0) 
addi x3,x0,11#��Ӧ����2
sw x3,52(x0) 
addi x3,x0,12#��Ӧ����2
sw x3,56(x0) 
addi x3,x0,13#��Ӧ����2
sw x3,60(x0) 
addi x3,x0,14#��Ӧ����2
sw x3,64(x0) 
addi x3,x0,15#��Ӧ����2
sw x3,68(x0) 
addi x3,x0,16#��Ӧ����2
sw x3,72(x0) 



loop:
lw x10, (x19) #x10����ѡ���������
lw x11,(x20)  #����ť������  
bne x11,x17,loop #���û����ť���ظ�ѭ��
lw x3,12(x0) 
beq x10,x3,Test1#x10����ȷ��ģʽ��ѡ��
lw x3,16(x0) 
beq x10,x3,Test2
lw x3,20(x0) 
beq x10,x3,Test3
lw x3,24(x0) 
beq x10,x3,Test4
lw x3,28(x0) 
beq x10,x3,Test5
lw x3,32(x0) 
beq x10,x3,Test6
lw x3,36(x0) 
beq x10,x3,Test7
lw x3,40(x0) 
beq x10,x3,Test8
lw x3,44(x0) 
beq x10,x3,Test9
lw x3,48(x0) 
beq x10,x3,Test10
lw x3,52(x0) 
beq x10,x3,Test11
lw x3,56(x0) 
beq x10,x3,Test12
lw x3,60(x0) 
beq x10,x3,Test13
lw x3,64(x0) 
beq x10,x3,Test14
lw x3,68(x0) 
beq x10,x3,Test15
beq x0,x0,loop



Test1: 
loop1: lw x12, (x19) #�����뿪������   
lw x11,(x21)  #����ť������  mode0��1
bne x11,x15,loop1 #���û����ť���ظ�ѭ��

sw x12,4(x0) #�����뿪�ص����ݴ���ڴ�
lw x12,4(x0) #��ȡ�ڴ��е�����

loop2:sw x12, (x19) #���ڴ����ݸ���LED 
sw x12, (x19) #���ڴ����ݸ���LED 
sw x12, (x19) #���ڴ����ݸ���LED 
sw x12, (x19) #���ڴ����ݸ���LED 
sw x12, (x19) #���ڴ����ݸ���LED 
sw x12, (x19) #���ڴ����ݸ���LED 
sw x12, (x19) #���ڴ����ݸ���LED 
lw x11,(x21)  #����ť������  mode0��1
bne x11,x16,loop2 # ѭ��������

loop3: lw x14, (x19) #�����뿪������ 
lw x11,(x21)  #����ť������  
bne x11,x15,loop3 #���û����ť���ظ�ѭ��

sw x14,4(x0) #�����뿪�ص����ݴ���ڴ�
lw x14,4(x0) #��ȡ�ڴ��е�����

loop4:sw x14, (x19) #���ڴ����ݸ���LED 
sw x14, (x19) #���ڴ����ݸ���LED 
sw x14, (x19) #���ڴ����ݸ���LED 
sw x14, (x19) #���ڴ����ݸ���LED 
sw x14, (x19) #���ڴ����ݸ���LED 
sw x14, (x19) #���ڴ����ݸ���LED 
lw x11,(x21)  #����ť������  
bne x11,x16,loop4 

loop5:lw x11,(x20)  
bne x11,x18,loop5
beq x0,x0,loop

Test2:
loop21: lw x12, (x19) 
lw x11,(x21)  #����ť������  mode0��1
bne x11,x15,loop21 #���û����ť���ظ�ѭ��

sw x12,4(x0) #�����뿪�ص����ݴ���ڴ� 4
lb x12,4(x0) #��ȡ�ڴ��е�����

loop22:sw x12, (x19) #���ڴ����ݸ���LED 
sw x12, (x19) #���ڴ����ݸ���LED 
sw x12, (x19) #���ڴ����ݸ���LED 
sw x12, (x19) #���ڴ����ݸ���LED 
lw x11,(x21)  #����ť������  mode0��1
bne x11,x16,loop22 # ѭ��������

loop23:lw x11,(x20)  
bne x11,x18,loop23
beq x0,x0,loop


Test3:
loop31: lw x12, (x19) 
lw x11,(x21)  #����ť������  mode0��1
bne x11,x15,loop31 #���û����ť���ظ�ѭ��

sw x12,8(x0) #�����뿪�ص����ݴ���ڴ� 8
lbu x12,8(x0) #��ȡ�ڴ��е�����

loop32:sw x12, (x19) #���ڴ����ݸ���LED 
sw x12, (x19) #���ڴ����ݸ���LED 
sw x12, (x19) #���ڴ����ݸ���LED 
sw x12, (x19) #���ڴ����ݸ���LED 
lw x11,(x21)  #����ť������  mode0��1
bne x11,x16,loop32 # ѭ��������

loop33:lw x11,(x20)  #�˳�
bne x11,x18,loop33
beq x0,x0,loop

Test4:
lb x12,4(x0)
lbu x14,8(x0)

beq x12,x14,loop41

add x22,x0,x0
loop42: 
sw x22,(x19)
lw x11,(x20)  
bne x11,x18,loop42
beq x0,x0,loop

loop41:
addi x22,x0,1
loop43: 
sw x22,(x19)
sw x22,(x19)
sw x22,(x19)
sw x22,(x19)
lw x11,(x20)  
bne x11,x18,loop43
beq x0,x0,loop

Test5:
lb x12,4(x0)

loop54:sw x12, (x19) #���ڴ����ݸ���LED 
sw x12, (x19) #���ڴ����ݸ���LED 
sw x12, (x19) #���ڴ����ݸ���LED 
sw x12, (x19) #���ڴ����ݸ���LED 
lw x11,(x21)  #����ť������  mode0��1
bne x11,x15,loop54 # ѭ��������

lbu x14,8(x0)

loop55:sw x14, (x19) #���ڴ����ݸ���LED 
sw x14, (x19) #���ڴ����ݸ���LED 
sw x14, (x19) #���ڴ����ݸ���LED 
sw x14, (x19) #���ڴ����ݸ���LED 
lw x11,(x21)  #����ť������  mode0��1
bne x11,x16,loop55 # ѭ��������

blt x12,x14,loop51

add x22,x0,x0
loop52: 
sw x22,(x19)
lw x11,(x20)  
bne x11,x18,loop52
beq x0,x0,loop

loop51:
addi x22,x0,1
loop53: 
sw x22,(x19)
sw x22,(x19)
sw x22,(x19)
sw x22,(x19)
lw x11,(x20)  
bne x11,x18,loop53
beq x0,x0,loop


Test6:
lb x12,4(x0)

loop64:sw x12, (x19) #���ڴ����ݸ���LED 
sw x12, (x19) #���ڴ����ݸ���LED 
sw x12, (x19) #���ڴ����ݸ���LED 
sw x12, (x19) #���ڴ����ݸ���LED 
lw x11,(x21)  #����ť������  mode0��1
bne x11,x15,loop64 # ѭ��������

lbu x14,8(x0)

loop65:sw x14, (x19) #���ڴ����ݸ���LED 
sw x14, (x19) #���ڴ����ݸ���LED 
sw x14, (x19) #���ڴ����ݸ���LED 
sw x14, (x19) #���ڴ����ݸ���LED 
lw x11,(x21)  #����ť������  mode0��1
bne x11,x16,loop65 # ѭ��������

lbu x14,8(x0)
bge x12,x14,loop61

add x22,x0,x0
loop62: 
sw x22,(x19)
lw x11,(x20)  
bne x11,x18,loop62
beq x0,x0,loop

loop61:
addi x22,x0,1
loop63: 
sw x22,(x19)
sw x22,(x19)
sw x22,(x19)
sw x22,(x19)
lw x11,(x20)  
bne x11,x18,loop63
beq x0,x0,loop

Test7:
lb x12,4(x0)

loop74:sw x12, (x19) #���ڴ����ݸ���LED 
sw x12, (x19) #���ڴ����ݸ���LED 
sw x12, (x19) #���ڴ����ݸ���LED 
sw x12, (x19) #���ڴ����ݸ���LED 
lw x11,(x21)  #����ť������  mode0��1
bne x11,x15,loop74 # ѭ��������

lbu x14,8(x0)

loop75:sw x14, (x19) #���ڴ����ݸ���LED 
sw x14, (x19) #���ڴ����ݸ���LED 
sw x14, (x19) #���ڴ����ݸ���LED 
sw x14, (x19) #���ڴ����ݸ���LED 
lw x11,(x21)  #����ť������  mode0��1
bne x11,x16,loop75 # ѭ��������

lbu x14,8(x0)
bltu x12,x14,loop71

add x22,x0,x0
loop72: 
sw x22,(x19)
lw x11,(x20)  
bne x11,x18,loop72
beq x0,x0,loop

loop71:
addi x22,x0,1
loop73: 
sw x22,(x19)
sw x22,(x19)
sw x22,(x19)
sw x22,(x19)
lw x11,(x20)  
bne x11,x18,loop73
beq x0,x0,loop

Test8:
lb x12,4(x0)

loop84:sw x12, (x19) #���ڴ����ݸ���LED 
sw x12, (x19) #���ڴ����ݸ���LED 
sw x12, (x19) #���ڴ����ݸ���LED 
sw x12, (x19) #���ڴ����ݸ���LED 
lw x11,(x21)  #����ť������  mode0��1
bne x11,x15,loop84 # ѭ��������

lbu x14,8(x0)

loop85:sw x14, (x19) #���ڴ����ݸ���LED 
sw x14, (x19) #���ڴ����ݸ���LED 
sw x14, (x19) #���ڴ����ݸ���LED 
sw x14, (x19) #���ڴ����ݸ���LED 
lw x11,(x21)  #����ť������  mode0��1
bne x11,x16,loop85 # ѭ��������

lbu x14,8(x0)
bgeu x12,x14,loop81

add x22,x0,x0
loop82: 
sw x22,(x19)
lw x11,(x20)  
bne x11,x18,loop82
beq x0,x0,loop

loop81:
addi x22,x0,1
loop83: 
sw x22,(x19)
sw x22,(x19)
sw x22,(x19)
sw x22,(x19)
lw x11,(x20)  
bne x11,x18,loop83
beq x0,x0,loop

Test9:
loop91: lw x12, (x19) 
lw x11,(x21)  #����ť������  mode0��1
bne x11,x15,loop91 #���û����ť���ظ�ѭ��

addi x5,x0,8
add x4,x0,x0
loop92:
srli x12,x12,1
addi x4,x4,1
bne x12,x0,loop92

sub x4,x5,x4

loop93: 
sw x4,(x19)
sw x4,(x19)
sw x4,(x19)
sw x4,(x19)
lw x11,(x20)  
bne x11,x18,loop93
beq x0,x0,loop

Test10:
loop101: lw x12, (x19) # ��ȡ�����ݴ���x12
lw x11,(x21)  
bne x11,x15,loop101 
# ���õ��ļĴ�������
add x4,x0,x0
add x5,x0,x0
add x6,x0,x0
add x7,x0,x0
add x8,x0,x0
add x9,x0,x0
add x10,x0,x0
addi x22,x0,1
srli x4,x12, 15            # x4 = ����λ 0 or 1
slli x5, x12, 17          
srli x5, x5, 17             # x5 = ָ����β��
andi x6, x5, 0x3ff         # x6= β����10λ��  1_10_0101_0000
srli x7, x5, 10            # x7 = ָ����5λ��

#��������
ori x6,x6,0x400 #�����ص�1�ӻ��� 11bit 
addi x7, x7, -15          # ָ��-bias

bge x7,x0,jump101

sub x7, zero, x7 #�����෴��
srl x8,x6,x7
beq x0,x0,jump102


jump101:
sll x8,x6,x7
jump102:
andi x9, x8,0x3ff#ȡ��ʮλΪС��λ
srli x10,x8,10#ǰ22λΪ����λ

beq x4,x22,negative10
beq x9,x0,loop103
addi x10,x10,1
beq x0,x0,loop103



negative10:
sub x10,x0,x10


loop103: 
sw x10,(x19)
sw x10,(x19)
sw x10,(x19)
sw x10,(x19)
lw x11,(x20)  
bne x11,x18,loop103
beq x0,x0,loop

Test11:
loop111: lw x12, (x19) # ��ȡ�����ݴ���x12
lw x11,(x21)  
bne x11,x15,loop111 
# ���õ��ļĴ�������
add x4,x0,x0
add x5,x0,x0
add x6,x0,x0
add x7,x0,x0
add x8,x0,x0
add x9,x0,x0
add x10,x0,x0
addi x22,x0,1
srli x4,x12, 15            # x4 = ����λ 0 or 1
slli x5, x12, 17          
srli x5, x5, 17             # x5 = ָ����β��
andi x6, x5, 0x3ff         # x6= β����10λ��  1_10_0101_0000
srli x7, x5, 10            # x7 = ָ����5λ��

#��������
ori x6,x6,0x400 #�����ص�1�ӻ��� 11bit 
addi x7, x7, -15          # ָ��-bias

bge x7,x0,jump111

sub x7, zero, x7 #�����෴��
srl x8,x6,x7
beq x0,x0,jump112


jump111:
sll x8,x6,x7
jump112:
andi x9, x8,0x3ff#ȡ��ʮλΪС��λ
srli x10,x8,10#ǰ22λΪ����λ

bne x4,x22,loop113

sub x10,x0,x10
beq x9,x0,loop113 #С��λΪ0
addi x10,x10,-1
beq x0,x0,loop113

loop113: 
sw x10,(x19)
sw x10,(x19)
sw x10,(x19)
sw x10,(x19)
lw x11,(x20)  
bne x11,x18,loop113
beq x0,x0,loop

Test12:
loop121: lw x12, (x19) # ��ȡ�����ݴ���x12
lw x11,(x21)  
bne x11,x15,loop121 
# ���õ��ļĴ�������
add x4,x0,x0
add x5,x0,x0
add x6,x0,x0
add x7,x0,x0
add x8,x0,x0
add x9,x0,x0
add x10,x0,x0
addi x22,x0,1
add x23,x0,x0
srli x4,x12, 15            # x4 = ����λ 0 or 1
slli x5, x12, 17          
srli x5, x5, 17             # x5 = ָ����β��
andi x6, x5, 0x3ff         # x6= β����10λ��  1_10_0101_0000
srli x7, x5, 10            # x7 = ָ����5λ��

#��������
ori x6,x6,0x400 #�����ص�1�ӻ��� 11bit 
addi x7, x7, -15          # ָ��-bias

bge x7,x0,jump121
sub x7, zero, x7 #�����෴��
srl x8,x6,x7
beq x0,x0,jump122


jump121:
sll x8,x6,x7
jump122:
andi x9, x8,0x3ff#ȡ��ʮλΪС��λ
srli x23,x9,9#ȡС���ĵ�һλ
srli x10,x8,10#ǰ22λΪ����λ

beq x23,x0,round_down

beq x4,x22,negative12
beq x9,x0,loop123
addi x10,x10,1
beq x0,x0,loop123

negative12:
sub x10,x0,x10
beq x0,x0,loop123



round_down:
bne x4,x22,loop123
sub x10,x0,x10
beq x9,x0,loop123 #С��λΪ0
addi x10,x10,-1
beq x0,x0,loop123


loop123: 
sw x10,(x19)
sw x10,(x19)
sw x10,(x19)
sw x10,(x19)
lw x11,(x20)  
bne x11,x18,loop123
beq x0,x0,loop

Test13:
loop131: lw x12, (x19) #����a
lw x11,(x21)  #����ť������  mode0��1
bne x11,x15,loop131 #���û����ť���ظ�ѭ��


loop132:sw x12, (x19) 
sw x12, (x19) 
sw x12, (x19) 
sw x12, (x19)
sw x12, (x19) 
sw x12, (x19) 
sw x12, (x19) 
lw x11,(x21)  
bne x11,x16,loop132 

loop133: lw x14, (x19) #����b
lw x11,(x21)  #����ť������  
bne x11,x15,loop133 #���û����ť���ظ�ѭ��


loop134:sw x14, (x19) 
sw x14, (x19) 
sw x14, (x19) 
sw x14, (x19)
sw x14, (x19) 
sw x14, (x19) 
lw x11,(x21)  
bne x11,x16,loop134 

add x13,x0,x0
add x4,x0,x0

add x13,x12,x14
srli x4,x13,8 #���Ƿ��н�λ

beq x4,x0,jump13
#���н�λ
andi x13,x13,0xff
addi x13,x13,1
jump13:
xori x13,x13,0xff

loop135: 
sw x13,(x19)
sw x13,(x19)
sw x13,(x19)
sw x13,(x19)
lw x11,(x20)  
bne x11,x18,loop135
beq x0,x0,loop

Test14:
loop141: lw x12, (x19) # ��ȡ�����ݴ���x12
lw x11,(x21)  
bne x11,x15,loop141 

andi x13,x12,0xff#ȡ��8bit
slli x13,x13,4
srli x14,x12,4
add x14,x14,x13

loop142: 
sw x14,(x19)
sw x14,(x19)
sw x14,(x19)
sw x14,(x19)
lw x11,(x20)  
bne x11,x18,loop142
beq x0,x0,loop



Test15:
   add x0,x0,x0
   add x0,x0,x0
   add x0,x0,x0
   loop151: lw x12, (x19) #����a
lw x11,(x21)  #����ť������  mode0��1
bne x11,x15,loop151 #���û����ť���ظ�ѭ��
   
  
   addi x2,x0,76
   add x1,x0,x0 #ra
   add x4,x0,x0 #x4 ��Ϊfib��һ����
   add x5,x0,x0 #x5 ��Ϊfib�ڶ�����
   add x6,x0,x0 #x6 ��Ϊ��ת
   add x7,x0,x0 #x7 ��¼��ջ��ջ��
 # ���� Fibonacci �ݹ麯��
    li x4, 0                  # x4 = fib(0)
    li x5, 1                      # x5 = fib(1)
    jal  fibonacci
    
   loop155: 
sw x7,(x19)
sw x7,(x19)
sw x7,(x19)
sw x7,(x19)
lw x11,(x20)  
bne x11,x18,loop155
beq x0,x0,loop
   
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



