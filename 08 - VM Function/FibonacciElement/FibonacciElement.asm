// adding basic addresses
@256
D=A
@SP
M=D
// call Sys.init 0

// push return_address
@return_address_FibonacciElement_0
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
(return_address_FibonacciElement_0)

// // This file is part of www.nand2tetris.org

// // and the book "The Elements of Computing Systems"

// // by Nisan and Schocken, MIT Press.

// // File name: projects/8/FunctionCalls/FibonacciElement/Main.vm

// // Contains one function: Main.fibonacci.

// // Computes the n'th element of the Fibonacci series, recursively.

// // n is given in argument[0]. Called by the Sys.init function 

// // (part of the Sys.vm file), which sets argument[0] to an input

// // value and then calls Main.fibonacci.

// function Main.fibonacci 0

(Main.fibonacci)

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

// 	push constant 2

@2
D=A
@SP
A=M
M=D
@SP
M=M+1

// 	lt                     

@SP
AM=M-1
D=M
A=A-1
D=M-D
@COMPARE_1
D;JLT
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

// 	if-goto N_LT_2        

@SP
M=M-1
A=M
D=M
@N_LT_2
D;JNE

// 	goto N_GE_2

@N_GE_2
0;JMP

// label N_LT_2               // if n < 2 returns n

(N_LT_2)

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

// label N_GE_2               // if n >= 2 returns fib(n - 2) + fib(n - 1)

(N_GE_2)

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

// 	push constant 2

@2
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

// 	call Main.fibonacci 1  // computes fib(n - 2)

// push return_address
@return_address_FibonacciElement_2
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
@1
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
@Main.fibonacci
0;JMP
// (return address)
(return_address_FibonacciElement_2)

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

// 	call Main.fibonacci 1  // computes fib(n - 1)

// push return_address
@return_address_FibonacciElement_3
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
@1
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
@Main.fibonacci
0;JMP
// (return address)
(return_address_FibonacciElement_3)

// 	add                    // returns fib(n - 1) + fib(n - 2)

@SP
AM=M-1
D=M
A=A-1
M=D+M

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

// // File name: projects/8/FunctionCalls/FibonacciElement/Sys.vm

// // Containts one function: Sys.init.

// // Pushes a constant n onto the stack, and calls the Main.fibonacii

// // function, which computes the n'th element of the Fibonacci series.

// // Note that by convention, the Sys.init function is called "automatically" 

// // by the bootstrap code generated by the VM translator.

// function Sys.init 0

(Sys.init)

//     // Computes fibonacci(4)

// 	push constant 4

@4
D=A
@SP
A=M
M=D
@SP
M=M+1

// 	// Calls the function, informing that one argument was pushed onto the stack

// 	call Main.fibonacci 1

// push return_address
@return_address_FibonacciElement_4
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
@1
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
@Main.fibonacci
0;JMP
// (return address)
(return_address_FibonacciElement_4)

// label END  

(END)

// 	goto END  // loops infinitely
@END
0;JMP

