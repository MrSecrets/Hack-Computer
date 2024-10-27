// // This file is part of www.nand2tetris.org
// // and the book "The Elements of Computing Systems"
// // by Nisan and Schocken, MIT Press.
// // File name: projects/7/StackArithmetic/StackTest/StackTest.vm
// 
// // Executes a sequence of arithmetic and logical operations on the stack. 
// 
// push constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1

// eq
@SP
AM=M-1
D=M
A=A-1
D=M-D
@COMPARE_0
D;JEQ
@SP
A=M-1
M=0
@END_COMPARE_0
0;JMP
(COMPARE_0)
@SP
A=M-1
M=-1
(END_COMPARE_0)

// push constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 16
@16
D=A
@SP
A=M
M=D
@SP
M=M+1

// eq
@SP
AM=M-1
D=M
A=A-1
D=M-D
@COMPARE_1
D;JEQ
@SP
A=M-1
M=0
@END_COMPARE_1
0;JMP
(COMPARE_1)
@SP
A=M-1
M=-1
(END_COMPARE_1)

// push constant 16
@16
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1

// eq
@SP
AM=M-1
D=M
A=A-1
D=M-D
@COMPARE_2
D;JEQ
@SP
A=M-1
M=0
@END_COMPARE_2
0;JMP
(COMPARE_2)
@SP
A=M-1
M=-1
(END_COMPARE_2)

// push constant 892
@892
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 891
@891
D=A
@SP
A=M
M=D
@SP
M=M+1

// lt
@SP
AM=M-1
D=M
A=A-1
D=M-D
@COMPARE_3
D;JLT
@SP
A=M-1
M=0
@END_COMPARE_3
0;JMP
(COMPARE_3)
@SP
A=M-1
M=-1
(END_COMPARE_3)

// push constant 891
@891
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 892
@892
D=A
@SP
A=M
M=D
@SP
M=M+1

// lt
@SP
AM=M-1
D=M
A=A-1
D=M-D
@COMPARE_4
D;JLT
@SP
A=M-1
M=0
@END_COMPARE_4
0;JMP
(COMPARE_4)
@SP
A=M-1
M=-1
(END_COMPARE_4)

// push constant 891
@891
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 891
@891
D=A
@SP
A=M
M=D
@SP
M=M+1

// lt
@SP
AM=M-1
D=M
A=A-1
D=M-D
@COMPARE_5
D;JLT
@SP
A=M-1
M=0
@END_COMPARE_5
0;JMP
(COMPARE_5)
@SP
A=M-1
M=-1
(END_COMPARE_5)

// push constant 32767
@32767
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1

// gt
@SP
AM=M-1
D=M
A=A-1
D=M-D
@COMPARE_6
D;JGT
@SP
A=M-1
M=0
@END_COMPARE_6
0;JMP
(COMPARE_6)
@SP
A=M-1
M=-1
(END_COMPARE_6)

// push constant 32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 32767
@32767
D=A
@SP
A=M
M=D
@SP
M=M+1

// gt
@SP
AM=M-1
D=M
A=A-1
D=M-D
@COMPARE_7
D;JGT
@SP
A=M-1
M=0
@END_COMPARE_7
0;JMP
(COMPARE_7)
@SP
A=M-1
M=-1
(END_COMPARE_7)

// push constant 32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1

// gt
@SP
AM=M-1
D=M
A=A-1
D=M-D
@COMPARE_8
D;JGT
@SP
A=M-1
M=0
@END_COMPARE_8
0;JMP
(COMPARE_8)
@SP
A=M-1
M=-1
(END_COMPARE_8)

// push constant 57
@57
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 31
@31
D=A
@SP
A=M
M=D
@SP
M=M+1

// push constant 53
@53
D=A
@SP
A=M
M=D
@SP
M=M+1

// add
@SP
AM=M-1
D=M
A=A-1
M=D+M

// push constant 112
@112
D=A
@SP
A=M
M=D
@SP
M=M+1

// sub
@SP
AM=M-1
D=M
A=A-1
M=M-D

// neg
@SP
A=M-1
M=-M

// and
@SP
AM=M-1
D=M
A=A-1
M=D&M

// push constant 82
@82
D=A
@SP
A=M
M=D
@SP
M=M+1

// or
@SP
AM=M-1
D=M
A=A-1
M=D|M

// not
@SP
A=M-1
M=!M

