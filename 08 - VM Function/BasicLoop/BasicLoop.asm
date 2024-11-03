// // This file is part of www.nand2tetris.org
// // and the book "The Elements of Computing Systems"
// // by Nisan and Schocken, MIT Press.
// // File name: projects/8/ProgramFlow/BasicLoop/BasicLoop.vm
// // Computes the sum 1 + 2 + ... + n and pushes the result onto
// // the stack. The value n is given in argument[0], which must be 
// // initialized by the caller of this code.
// 	push constant 0    
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// 	pop local 0         // sum = 0
@0
D=A
@LCL
D=D+M
@pop_default
M=D
@SP
AM=M-1
D=M
@pop_default
A=M
M=D

// label LOOP
(LOOP)

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

// 	add
@SP
AM=M-1
D=M
A=A-1
M=D+M

// 	pop local 0	        // sum = sum + n
@0
D=A
@LCL
D=D+M
@pop_default
M=D
@SP
AM=M-1
D=M
@pop_default
A=M
M=D

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

// 	push constant 1
@1
D=A
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

// 	pop argument 0      // n--
@0
D=A
@ARG
D=D+M
@pop_default
M=D
@SP
AM=M-1
D=M
@pop_default
A=M
M=D

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

// 	if-goto LOOP        // if n > 0, goto LOOP
@SP
M=M-1
A=M
D=M
@LOOP
D;JNE

// 	push local 0        // else, pushes sum to the stack's top
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

