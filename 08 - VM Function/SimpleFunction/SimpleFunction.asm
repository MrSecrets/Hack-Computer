// // This file is part of www.nand2tetris.org
// // and the book "The Elements of Computing Systems"
// // by Nisan and Schocken, MIT Press.
// // File name: projects/8/FunctionCalls/SimpleFunction/SimpleFunction.vm
// // Performs a simple calculation and returns the result.
// // argument[0] and argument[1] must be set by the caller.
// function SimpleFunction.test 2
(SimpleFunction.test)

// push 0
@SP
A=M
M=0
@SP
M=M+1

// push 0
@SP
A=M
M=0
@SP
M=M+1

// 	push local 0
@LCL
D=M
@0
D=D+A
A=D
D=M
@SP
A=M
M=D
@SP
M=M+1

// 	push local 1
@LCL
D=M
@1
D=D+A
A=D
D=M
@SP
A=M
M=D
@SP
M=M+1

// 	add
@SP
AM=M-1
D=M
A=A-1
M=D+M

// 	not
@SP
A=M-1
M=!M

// 	push argument 0
@ARG
D=M
@0
D=D+A
A=D
D=M
@SP
A=M
M=D
@SP
M=M+1

// 	add
@SP
AM=M-1
D=M
A=A-1
M=D+M

// 	push argument 1
@ARG
D=M
@1
D=D+A
A=D
D=M
@SP
A=M
M=D
@SP
M=M+1

// 	sub
@SP
AM=M-1
D=M
A=A-1
M=M-D

// 	return
// FRAME = LCL
@LCL
D=M
@frame
M=D
// RET = *(FRAME-5)
@5
D=D-A
A=D
D=M
@return
M=D
// *ARG = pop()
@SP
M=M-1
A=M
D=M
@ARG
A=M
M=D
// SP = ARG+1
@ARG
D=M+1
@SP
M=D
// THAT = *(FRAME-1)
@frame
D=M-1
A=D
D=M
@THAT
M=D
// THIS = *(FRAME-2)
@frame
D=M
@2
D=D-A
A=D
D=M
@THIS
M=D
// ARG = *(FRAME-3)
@frame
D=M
@3
D=D-A
A=D
D=M
@ARG
M=D
// LCL = *(FRAME-4)
@frame
D=M
@4
D=D-A
A=D
D=M
@LCL
M=D
// goto RET
@return
A=M
0;JMP

