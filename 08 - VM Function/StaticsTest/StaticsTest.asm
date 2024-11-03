// adding basic addresses
@256
D=A
@SP
M=D
// call Sys.init 0

// push return_address
@Sys.init_Ret_0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// push ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// push THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// push THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1        
//ARG = SP-n-5
@SP
D=M
@0
D=D-A
@5
D=D-A
@ARG
M=D
//LCL = SP
@SP
D=M
@LCL
M=D
// goto function
@Sys.init
0;JMP
// (return address)
(Sys.init_Ret_0)

// // This file is part of www.nand2tetris.org

// // and the book "The Elements of Computing Systems"

// // by Nisan and Schocken, MIT Press.

// // File name: projects/8/FunctionCalls/StaticsTest/Class1.vm

// // Stores two supplied arguments in static[0] and static[1].

// function Class1.set 0

(Class1.set)

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

// 	pop static 0

@SP
AM=M-1
D=M
@.StaticsTest.Class1.0
M=D

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

// 	pop static 1

@SP
AM=M-1
D=M
@.StaticsTest.Class1.1
M=D

// 	push constant 0

@0
D=A
@SP
A=M
M=D
@SP
M=M+1

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

// // Returns static[0] - static[1].

// function Class1.get 0

(Class1.get)

// 	push static 0

@.StaticsTest.Class1.0
D=M
@SP
A=M
M=D
@SP
M=M+1

// 	push static 1

@.StaticsTest.Class1.1
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

// // This file is part of www.nand2tetris.org

// // and the book "The Elements of Computing Systems"

// // by Nisan and Schocken, MIT Press.

// // File name: projects/8/FunctionCalls/StaticsTest/Class2.vm

// // Stores two supplied arguments in static[0] and static[1].

// function Class2.set 0

(Class2.set)

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

// 	pop static 0

@SP
AM=M-1
D=M
@.StaticsTest.Class2.0
M=D

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

// 	pop static 1

@SP
AM=M-1
D=M
@.StaticsTest.Class2.1
M=D

// 	push constant 0

@0
D=A
@SP
A=M
M=D
@SP
M=M+1

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

// // Returns static[0] - static[1].

// function Class2.get 0

(Class2.get)

// 	push static 0

@.StaticsTest.Class2.0
D=M
@SP
A=M
M=D
@SP
M=M+1

// 	push static 1

@.StaticsTest.Class2.1
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

// // This file is part of www.nand2tetris.org

// // and the book "The Elements of Computing Systems"

// // by Nisan and Schocken, MIT Press.

// // File name: projects/8/FunctionCalls/StaticsTest/Sys.vm

// // Tests that different functions, stored in two different 

// // class files, manipulate the static segment correctly. 

// function Sys.init 0

(Sys.init)

// 	push constant 6

@6
D=A
@SP
A=M
M=D
@SP
M=M+1

// 	push constant 8

@8
D=A
@SP
A=M
M=D
@SP
M=M+1

// 	call Class1.set 2

// push return_address
@Class1.set_Ret_1
D=A
@SP
A=M
M=D
@SP
M=M+1
// push LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// push ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// push THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// push THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1        
//ARG = SP-n-5
@SP
D=M
@2
D=D-A
@5
D=D-A
@ARG
M=D
//LCL = SP
@SP
D=M
@LCL
M=D
// goto function
@Class1.set
0;JMP
// (return address)
(Class1.set_Ret_1)

// 	pop temp 0 // dumps the return value

@SP
AM=M-1
D=M
@5
M=D

// 	push constant 23

@23
D=A
@SP
A=M
M=D
@SP
M=M+1

// 	push constant 15

@15
D=A
@SP
A=M
M=D
@SP
M=M+1

// 	call Class2.set 2

// push return_address
@Class2.set_Ret_2
D=A
@SP
A=M
M=D
@SP
M=M+1
// push LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// push ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// push THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// push THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1        
//ARG = SP-n-5
@SP
D=M
@2
D=D-A
@5
D=D-A
@ARG
M=D
//LCL = SP
@SP
D=M
@LCL
M=D
// goto function
@Class2.set
0;JMP
// (return address)
(Class2.set_Ret_2)

// 	pop temp 0 // dumps the return value

@SP
AM=M-1
D=M
@5
M=D

// 	call Class1.get 0

// push return_address
@Class1.get_Ret_3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// push ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// push THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// push THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1        
//ARG = SP-n-5
@SP
D=M
@0
D=D-A
@5
D=D-A
@ARG
M=D
//LCL = SP
@SP
D=M
@LCL
M=D
// goto function
@Class1.get
0;JMP
// (return address)
(Class1.get_Ret_3)

// 	call Class2.get 0

// push return_address
@Class2.get_Ret_4
D=A
@SP
A=M
M=D
@SP
M=M+1
// push LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// push ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// push THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// push THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1        
//ARG = SP-n-5
@SP
D=M
@0
D=D-A
@5
D=D-A
@ARG
M=D
//LCL = SP
@SP
D=M
@LCL
M=D
// goto function
@Class2.get
0;JMP
// (return address)
(Class2.get_Ret_4)

// label END

(END)

// 	goto END
@END
0;JMP

