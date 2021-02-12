#.data
#y:.word 10
#.text

#addi $s1,$zero,20
#la $t1 ,y
 #addi $a0 ,$a0 ,2
 # addi $v0 ,$v0 ,1
#syscall



.data
A:        .word 0:61 #first array         request a
B:        .word 0:61# last array         request b
C:        .word 0:61#  the third array            request c
D:        .word 0:61#  the fourth array                  request d
index1:   .word 0#   index of array1
index2:   .word 0#  index of array 2
index3:   .word 0#index of array 3
index4:   .word 0#index of array 4
w:        .word 0#
s:        .word 80# number of empty element in the four array
max:      .word 0 #in update function
op:.word #
counter: .word 0# numer the item that enter by user
i:.word 0#counter of for loop
top:.word 0# in ffoorr loop
top2:.word 0#in ffoorr loop
top3:.word 0#in ffoorr loop
top4:.word 0#in ffoorr loop
nameP:.word #
SearchP:.word#

x:.word # case 1 value 1or 2 or 3 number of case in case 1
massage1 :.asciiz "please enter number of item"          # printf("enter number of item: ") 
massage2 :.asciiz "enter requests name"
massage3 :.asciiz "enter requests priority"
massage4 :.asciiz "enter requests date"
massage5 :.asciiz "1.Search                    2.EmptyLists all            3.join             4.update Request          enter your Choose 1 to 4  "
message6 : .asciiz "Empty lists succesfully.\n"
message7 : .asciiz "Updata scassfully\n"
case1massage1:.asciiz "Search on specific Request use Binary Search on lists, searching criteria can be request data itself or priority or both." #
case1massage2:.asciiz "enter x=1 ,2 or 3"
case1massage3:.asciiz " Enter the value to find:"
case1massage4:.asciiz "Enter the value to find:"
case1massage5:.asciiz " Enter the value to find:"
case1massage6:.asciiz "Enter the value int to find:"
case4massage1:.asciiz "Enter the Request name:                                                            "
case4massage2:.asciiz "Enter the priority to updata:                                                       "
defualt1:.asciiz "Error! operator is not correct"
#error:.asciiz "error           "
enter:.asciiz "enter: number  1 to try agein "
.text
la $s1 ,A # load address of array A                                      a.top=-1; 
#add $t7,$t7,$s1
li $t1 ,-1  # load -1 to rigester $t1
sw $t1 ,0($s1) # load the value is in the rigester $t1 to first element in array A in memory    a.top=-1;
la $s1 ,B  # load address of array B 
sw $t1 ,0($s1) # load the value is in the rigester $t1 to first element in array B in memory    b.top=-1;
la $s1 ,C  # load address of array C 
sw $t1 ,0($s1) # load the value is in the rigester $t1 to first element in array C in memory    c.top=-1;
la $s1 ,D  # load address of array D 
sw $t1 ,0($s1) # load the value is in the rigester $t1 to first element in array D in memory    d.top=-1;
la $t1 ,w    #load address of w to rigester $t1  

lw $t2,0($t1)#$t2
while: 
li $v0,4  # To prepare the program to print a message
la $a0,massage1  # load address of massage to print 
syscall # print the massage1     printf("enter number of item: ");
li $v0,5  # To prepare the program to  get  number by user  
syscall #          scanf("%d",&size);
la $s1 ,counter  # load address of  labal  cunter to save number is  
sw $v0,0($s1)#$t1= counter 
lw $t1,0($s1)

la $s1 ,s#load address of $s1  
lw $t2,0($s1)# s is number of avaiable item to enter of four array
bgt $t1 ,$t2 ,else1 #if (counter >s )if number of item greder than number of avaiable item  than eeror massage ales complite  the program
forLoop:
la $s1, i# lood address of i to $s1
lw $t2,0($s1)# $t2 = i
la $s1, counter# lood address of i to $s1
lw $t1,0($s1)# $t1 = counter
beq $t2,$t1 ,endforloop # if ($t2==$t1) end the loop  if(i==counter)
la $s1,A # load address of array A 
lw $t0,0($s1)#load the top of array A
li $t1,19 # max element save in first array
 bgt $t0, $t1, then  #if (top <=18) countenue
 addi $t0,$t0,1   #top++
 sw $t0,0($s1)#save change of top
li $v0,4  # To prepare the program to print a message
la $a0,massage2  # load address of massage to print 
syscall # print the massage1  printf("enter requests name:"); 
  la $s5,index1  #load address of indes1
  lw $t5,0($s5)#load number that in the indes1
  addi $t5,$t5,4 #index1=indes1+4
 add $s1 ,$s1,$t5 # index of areey index =index+value of arrayA
 	li $v0,8 # To prepare the program to  get  string by user  
	la $a0,0($s1)# The place where I will write
	li $a1,15#max charcter
syscall
 
li $v0,4  # To prepare the program to print a message
la $a0,massage3  # load address of massage to print 
syscall # print the massage1    
	addi $t5,$t5,4  #index1=indes1+4
	la $s1,A    
	 add $s1 ,$s1,$t5 # index of areey index =index+value of array A
	li $v0,8 # To prepare the program to  get  string by user  
	la $a0,0($s1) # The place where I will write
	li $a1,15 #max charcter
syscall

li $v0,4  # To prepare the program to print a message2
la $a0,massage4  # load address of massage to print 
syscall # print the massage1   
li $v0,5  # To prepare the program to print a message2
syscall # print the massage1  printf("enter requests name:");  
	 addi $t5,$t5,4 #index1=indes1+4
	 la $s1,A  #load address of array A
	 add $s1 ,$s1,$t5 # index of areey index =index+value
sw $v0 ,0($s1)#save number in array 
sw $t5,0($s5)#save change in index
la $s1, i# lood address of i to $s1
lw $t2,0($s1)# $t2 = i
addi $t2,$t2,1#I=i+1
sw $t2,0($s1) #save change in i
j forLoop
           
then: 
la $s1,B  # load address of array  B
lw $t0,0($s1)#load the top of array B
li $t1,19 # max element save in last array
 bgt $t0, $t1, then2  #if (top <=18) countenue
 addi $t0,$t0,1   #top++ 
 sw $t0,0($s1) #save change of top
li $v0,4  # To prepare the program to print a message2
la $a0,massage2  # load address of massage to print 
syscall # print the massage2   
  la $s5,index2 #load address of indes2
  lw $t5,0($s5)#load number that in the indes2
  addi $t5,$t5,4 #index2=indes2+4
 add $s1 ,$s1,$t5 # index of areey index =index+value
 	li $v0,8   # To prepare the program to  get  string by user  
	la $a0,0($s1)# The place where I will write
	li $a1,15  #max charcter
syscall
 
li $v0,4  # To prepare the program to print a message2
la $a0,massage3  # load address of massage to print 
syscall # print the massage 3  
	addi $t5,$t5,4  #index2=indes2+4
	 add $s1 ,$s1,$t5 # index of areey index =index+value
	li $v0,8   # To prepare the program to  get  string by user  
	la $a0,0($s1)# The place where I will write
	li $a1,15  #max charcter
syscall

li $v0,4  # To prepare the program to print a message2
la $a0,massage4  # load address of massage to print 
syscall # print the massage4  
li $v0,5  # To prepare the program to print a message2
syscall # print the massage4
	 addi $t5,$t5,4  #index2=indes2+4
	 add $s1 ,$s1,$t5 # index of areey index =index+value
sw $v0 ,0($s1)#save number in array 
sw $t5,0($s5) #save change in index
la $s1, i# lood address of i to $s1  
lw $t2,0($s1)# $t2 = i
addi $t2,$t2,1  #I=i+1
sw $t2,0($s1)   #save change in i
j forLoop
then2:

la $s1,C  # load address of array  c
lw $t0,0($s1) #load the top of array c
li $t1,19  # max element save in last array
 bgt $t0, $t1, then3  #if (top <=18) countenue
 addi $t0,$t0,1   #top++ 
 sw $t0,0($s1)#save change of top
li $v0,4  # To prepare the program to print a message2
la $a0,massage2  # load address of massage to print 
syscall # print the massage2   
  la $s5,index3  #load address of indes3
  lw $t5,0($s5)#load number that in the indes3
  addi $t5,$t5,4 #index3=indes3+4
  la $s1,C      # load address of array  c
 add $s1 ,$s1,$t5 # index of areey index =index+value
 	li $v0,8  # To prepare the program to  get  string by user  
	la $a0,0($s1) # The place where I will write
	li $a1,15  #max charcter
syscall
 
li $v0,4  # To prepare the program to print a message3
la $a0,massage3  # load address of massage to print 
syscall # print the massage3
	addi $t5,$t5,4  #index3=indes3+4
	la $s1,C# load address of array  c
	 add $s1 ,$s1,$t5 # index of areey index =index+value
	li $v0,8   # To prepare the program to  get  string by user  
	la $a0,0($s1)# The place where I will write
	li $a1,15 #max charcter
syscall

li $v0,4  # To prepare the program to print a message4
la $a0,massage4  # load address of massage to print 
syscall # print the massage4  
li $v0,5  # To prepare the program to get number by user
syscall 
	 addi $t5,$t5,4   #index3=indes3+4
	 la $s1,C  # load address of array  c
	 add $s1 ,$s1,$t5 # index of areey index =index+value
sw $v0 ,0($s1)#save number in array
sw $t5,0($s5)#save change in index
la $s1, i# lood address of i to $s1
lw $t2,0($s1)# $t2 = i
addi $t2,$t2,1  #I=i+1
sw $t2,0($s1) #save change in i
j forLoop



then3:
la $s1,D  # load address of array  D
lw $t0,0($s1)#load the top of array D
li $t1,19 # max element save in last array
 bgt $t0, $t1, forLoop #if (top <=18) countenue
 addi $t0,$t0,1  #top++ 
 sw $t0,0($s1)#save change of top
li $v0,4  # To prepare the program to print a message2
la $a0,massage2  # load address of massage to print 
syscall # print the massage2 
  la $s5,index4 #load address of indes4
  lw $t5,0($s5)#load number that in the indes3
  addi $t5,$t5,4 #index4=indes4+4
  la $s1,D  # load address of array  D
 add $s1 ,$s1,$t5 # index of areey index =index+value
 	li $v0,8 # To prepare the program to  get  string by user 
	la $a0,0($s1) # The place where I will write
	li $a1,15 #max charcter
syscall
 
li $v0,4  # To prepare the program to print a message3
la $a0,massage3  # load address of massage to print 
syscall # print the massage 3  
	addi $t5,$t5,4  #index4=indes4+4
	la $s1,D  # load address of array  D
	 add $s1 ,$s1,$t5 # index of areey index =index+value
	li $v0,8  # To prepare the program to  get  string by user 
	la $a0,0($s1) # The place where I will write
	li $a1,15#max charcter
syscall

li $v0,4  # To prepare the program to print a message4
la $a0,massage4  # load address of massage to print 
syscall # print the massage4 
li $v0,5   # To prepare the program to get number by user
syscall   
	 addi $t5,$t5,4  #index3=indes3+4
	 la $s1,D# load address of array  D
	 add $s1 ,$s1,$t5 # index of areey index =index+value
sw $v0,0($s1)#save number in array
sw $t5,0($s5)#save change in index
la $s1, i# lood address of i to $s1
lw $t2,0($s1)# $t2 = i
addi $t2,$t2,1#i=i+1
sw $t2,0($s1) #save change in i
j forLoop

endforloop:
la $s1, i# lood address of i to $s1
add $t2,$zero,$zero  # i =0
sw $t2,0($s1) #restart i to 0

li $v0,4  # To prepare the program to print a message5
la $a0,massage5  # load address of massage to print 
syscall # print the massage1  
li $v0,5 # To prepare the program to get number by  user 
syscall 
la $s1 ,op  # lood address of op to $s1
sw $v0,0($s1)#save option in op
lw $t1,0($s1) #load option in $t1
bne $t1,1,equction1  #if (op == 1) case1 alse equction1
j case1
equction1:
bne $t1,2,equction2 #if (op == 2) case1 alse equction2
j case2
equction2:
bne $t1,3,equction3#if (op == 3) case1 alse equction3
j case3

equction3:#if (op == 4) case1 alse equction3
bne $t1,4,default
j case4


case1 : # Search
j exit


case2 : 
la $t7,s #load address of s =>number of element empty
li $t6, 80    #s=80
sw $t6,0($t7)
la $t7,counter #load address of s =>number of element or item
li $t6, 0  #counter =0
sw $t6,0($t7)

la $t7,index1 #load address of s =>number of element or item
li $t6, 0  #index1= 0
sw $t6,0($t7)
la $t7,index2 #load address of s =>number of element or item
li $t6, 0  #index2= 0
sw $t6,0($t7)
la $t7,index3 #load address of s =>number of element or item
li $t6, 0  #index3= 0
sw $t6,0($t7)
la $t7,index4 #load address of s =>number of element or item
li $t6, 0  #index4= 0
sw $t6,0($t7)
jal EmptyLists
j exit
 EmptyLists:
  
   la $sp,A   #top
   li $t1 ,-1  # load -1 to rigester $t1
   sw $t1 ,0($sp)
  
 
   la $sp,B   #top
   li $t1 ,-1  # load -1 to rigester $t1
   sw $t1 ,0($sp)
   
   la $sp,C         #top
 li $t1 ,-1  # load -1 to rigester $t1
   sw $t1 ,0($sp)  
 
   la $sp,D          #top
   li $t1 ,-1  # load -1 to rigester $t1
   sw $t1 ,0($sp)
   
   li $v0,4          # To prepare the program to print a message6
   la $a0,message6   # load address of massage to print 
   syscall
   jr $ra





case3 : 
j exit



case4 :
li $v0,4  # To prepare the program to print a message2
la $a0,case4massage1  # load address of massage to print 
syscall
li $v0,8  # To prepare the program to  get  string by user  
la $a0,nameP # The place where I will write
li $a1,15#max character
syscall
li $v0,4  # To prepare the program to print a message2
la $a0,case4massage2  # load address of massage to print 
syscall
li $v0,8 # To prepare the program to  get  string by user  
la $a0,SearchP# The place where I will write
li $a1,15#max character
syscall
#jal UpdateRequest
#j exit

 
   #UpdateRequest:
 la $s1,top          # top&11
 li $s2,0
 sw $s2,0($s1) 
 la $s1,top2
 li $s2,0
 sw $s2,0($s1) 
 la $s1,top3
 li $s2,0
 sw $s2,0($s1) 
 la $s1,top4
 li $s2,0
 sw $s2,0($s1)  

ffoorr:

la $s1,top
lw $s2,0($s1)
la $s1,A                       #load address of A &s1
lw $s3,0($s1)
bge $s2,$s3,ffoorr2            
mul $s5,$s2,12
addi $s5,$s5,4
add $s5,$s5,$s1
lw $sp,0($s5)
la $s1,nameP
lw $s2,0($s1)


strcmp:
add $t0,$zero,$zero
add $t1,$zero,$s1
add $t2,$zero,$s5
loop:
lb $t3($t1)  #load a byte from each string
lb $t4($t2)
beqz $t3,checkt2 #str1 end
beqz $t4,missmatch
slt $t5,$t3,$t4  #compare two bytes
bnez $t5,missmatch
addi $t1,$t1,1  #t1 points to the next byte of str1
addi $t2,$t2,1
j loop

missmatch: 
addi $v0,$zero,1
j endfunction
checkt2:
bnez $t4,missmatch
add $v0,$zero,$zero


beq $v0,$zero,changep
la $s1,top
lw $s2,0($s1)
addi $s2,$s2,1
sw $s2,0($s1)
j ffoorr
changep:
la $s1,SearchP
lw $s2,0($s1)
addi $s5,$s5,4
sw $s2,0($s5)

 la $s1,top
lw $s2,0($s1)
addi $s2,$s2,1
sw $s2,0($s1)
j ffoorr
endfunction:
j exit
ffoorr2:




la $s1,top2
lw $s2,0($s1)
la $s1,B
lw $s3,0($s1)
bge $s2,$s3,ffoorr3
mul $s5,$s2,12
addi $s5,$s5,4
add $s5,$s5,$s1
lw $sp,0($s5)
la $s1,nameP
lw $s2,0($s1)
beq $sp,$s2,changep2
la $s1,top2
lw $s2,0($s1)
addi $s2,$s2,1
sw $s2,0($s1)
j ffoorr2
changep2:
la $s1,SearchP
lw $s2,0($s1)
addi $s5,$s5,4
sw $s2,0($s5)
 la $s1,top2
lw $s2,0($s1)
addi $s2,$s2,1
sw $s2,0($s1)
j ffoorr2


ffoorr3:
la $s1,top3
lw $s2,0($s1)
la $s1,C
lw $s3,0($s1)
bge $s2,$s3,ffoorr4
mul $s5,$s2,12
addi $s5,$s5,4
add $s5,$s5,$s1
lw $sp,0($s5)
la $s1,nameP
lw $s2,0($s1)
beq $sp,$s2,changep3
la $s1,top3
lw $s2,0($s1)
addi $s2,$s2,1
sw $s2,0($s1)
j ffoorr3
changep3:
la $s1,SearchP
lw $s2,0($s1)
addi $s5,$s5,4
sw $s2,0($s5)

 la $s1,top3
lw $s2,0($s1)
addi $s2,$s2,1
sw $s2,0($s1)
j ffoorr3


ffoorr4:
la $s1,top4
lw $s2,0($s1)
la $s1,D
lw $s3,0($s1)
bge $s2,$s3,exitt
mul $s5,$s2,12
addi $s5,$s5,4
add $s5,$s5,$s1
lw $sp,0($s5)
la $s1,nameP
lw $s2,0($s1)
beq $sp,$s2,changep4
la $s1,top4
lw $s2,0($s1)
addi $s2,$s2,1
sw $s2,0($s1)
j ffoorr4
changep4:
la $s1,SearchP
lw $s2,0($s1)
addi $s5,$s5,4
sw $s2,0($s5)

 la $s1,top4
lw $s2,0($s1)
addi $s2,$s2,1
sw $s2,0($s1)
j ffoorr4

exitt:
li $v0,4          # To prepare the program to print a message6
   la $a0,message7   # load address of massage to print 
   syscall
#jr $ra
j exit



default:







la $s1,top       # load top address at s1
 li $s2,0        # top =0
 sw $s2,0($s1)    # save top at s2
 la $s1,top2      # load top2 address at s1
 li $s2,0         # top =0
 sw $s2,0($s1)     # save top2 at s2
 la $s1,top3     # load top3 address at s1
 li $s2,0       # top =0
 sw $s2,0($s1)   # save top3 at s2
 la $s1,top4   # load top4 address at s1
 li $s2,0      # top =0
 sw $s2,0($s1)   # save top4 at s2

foorr:
la $s1,top        # load top address at s1
lw $s2,0($s1)     #load top at s2
la $s1,A           #array address in s1          
lw $s3,0($s1)      #load array A at s3
bgt  $s2,$s3,ffoorr2        #if s2 bigger than s3 go to ffoorr2 
mul $s5,$s2,12               # go to next data
addi $s5,$s5,4         # increase s5 by 4
add $s5,$s5,$s1          # go to next element
li $v0,4# code 4 == print string
addi $a0,$s5,0 # $a0 == address of the string
syscall 
addi $s5,$s5,4        #inreasing s5 by 4
li $v0,4# code 4 == print string
addi $a0,$s5,0 # $a0 == address of the string
syscall 
addi $s5,$s5,4        #inreasing s5 by 4
li $v0,1# code 4 == print string
lw $s2,0($s5)
addi $a0,$s2,0 # $a0 == address of the string
syscall 
 la $s1,top               #load top address at s1
lw $s2,0($s1)             #l   
addi $s2,$s2,1           # increasig s2 by 1
sw $s2,0($s1)          
j foorr

foorr2:
la $s1,top2      # load top2 address at s1
lw $s2,0($s1)     #load top2 at s2
la $s1,B            #array address in s1
lw $s3,0($s1)        #load array B at s3
bgt $s2,$s3,ffoorr3   #if s2 bigger than s3 go to ffoorr2 
mul $s5,$s2,12         # go to next data
addi $s5,$s5,4         # increase s5 by 4
add $s5,$s5,$s1           # go to next element
li $v0,4# code 4 == print string
addi $a0,$s5,0 # $a0 == address of the string
syscall 
addi $s5,$s5,4
li $v0,4# code 4 == print string
addi $a0,$s5,0 # $a0 == address of the string
syscall 
addi $s5,$s5,4
li $v0,1# code 4 == print string
lw $s2,0($s5)
addi $a0,$s2,0 # $a0 == address of the string
syscall 
 la $s1,top2       #load top2 address at s1
lw $s2,0($s1)
addi $s2,$s2,1      # increasig s2 by 1
sw $s2,0($s1)
j foorr2


foorr3:
la $s1,top3      # load top3address at s1
lw $s2,0($s1)    #load top3at s2
la $s1,C            #array address in s1
lw $s3,0($s1)       #load array C at s3
bgt $s2,$s3,ffoorr4   #if s2 bigger than s3 go to ffoorr4 
mul $s5,$s2,12        # go to next data
addi $s5,$s5,4        # increase s5 by 4
add $s5,$s5,$s1      # go to next element
li $v0,4# code 4 == print string
addi $a0,$s5,0 # $a0 == address of the string
syscall 
addi $s5,$s5,4
li $v0,4# code 4 == print string
addi $a0,$s5,0 # $a0 == address of the string
syscall 
addi $s5,$s5,4
li $v0,1# code 4 == print string
lw $s2,0($s5)
addi $a0,$s2,0 # $a0 == address of the string
syscall 
 la $s1,top3       #load top3 address at s1
lw $s2,0($s1)
addi $s2,$s2,1      # increasig s2 by 1
sw $s2,0($s1)
j foorr3


foorr4:
la $s1,top4      # load top4 address at s1
lw $s2,0($s1)    #load top at s2
la $s1,D          #array address in s1
lw $s3,0($s1)     #load array D at s3
bgt $s2,$s3,exit   #if s2 bigger than s3 go to exit
mul $s5,$s2,12      # go to next data
addi $s5,$s5,4       # increase s5 by 4
add $s5,$s5,$s1      # go to next element
li $v0,4# code 4 == print string
addi $a0,$s5,0 # $a0 == address of the string
syscall 
addi $s5,$s5,4
li $v0,4# code 4 == print string
addi $a0,$s5,0 # $a0 == address of the string
syscall 
addi $s5,$s5,4
li $v0,1# code 4 == print string
lw $s2,0($s5)
addi $a0,$s2,0 # $a0 == address of the string
syscall 
 la $s1,top4      #load top4 address at s1
lw $s2,0($s1)
addi $s2,$s2,1    # increasig s2 by 1
sw $s2,0($s1)
j exit

exit:
la $s1,s #load address of s => number of element empty
lw $t1,0($s1)#load number in s
la $s2,counter #load address of counter
lw $t2,0($s2)			#$t2=counter
sub $t3,$t1,$t2 #s=s-counter
sw $t3 , 0($s1)

else1: 

#li $v0,4  # To prepare the program to print a message
#la $a0, error # load address of massage to print 
#syscall
li $v0,4  # To prepare the program to print a message
la $a0,enter  # load address of massage to print 
syscall


li $v0,5 # to  prepare the program to get number by  user
syscall 
la $s1 ,w # load address of w 
sw $v0,0($s1)#w= 1 or no
lw $t2,0($s1)
beq $t2,1,while #if (w==1 )try agein







