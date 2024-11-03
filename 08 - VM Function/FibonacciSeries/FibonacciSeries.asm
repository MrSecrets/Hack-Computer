// // This file is part of www.nand2tetris.org
// // and the book "The Elements of Computing Systems"
// // by Nisan and Schocken, MIT Press.
// // File name: projects/8/ProgramFlow/FibonacciSeries/FibonacciSeries.vm
// // Puts the first n elements of the Fibonacci series in the memory,
// // starting at address addr. n and addr are given in argument[0] and
// // argument[1], which must be initialized by the caller of this code.
// 	push argument 1         // sets THAT, the base address of the
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

// 	pop pointer 1           // that segment, to argument[1]
@SP
AM=M-1
D=M
@THAT
M=D

// 	push constant 0         // sets the series' first and second
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// 	pop that 0              // elements to 0 and 1, respectively       
@0
D=A
@THAT
D=D+M
@pop_default
M=D
@SP
AM=M-1
D=M
@pop_default
A=M
M=D

// 	push constant 1   
@1
D=A
@SP
A=M
M=D
@SP
M=M+1

// 	pop that 1              
@1
D=A
@THAT
D=D+M
@pop_default
M=D
@SP
AM=M-1
D=M
@pop_default
A=M
M=D

// 	push argument 0         // sets n, the number of remaining elements
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

// 	push constant 2         // to be computed, to argument[0] minus 2,
@2
D=A
@SP
A=M
M=D
@SP
M=M+1

// 	sub                     // since 2 elements were already computed.
@SP
AM=M-1
D=M
A=A-1
M=M-D

// 	pop argument 0          
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

// 	if-goto COMPUTE_ELEMENT // if n > 0, goto COMPUTE_ELEMENT
@SP
M=M-1
A=M
D=M
@COMPUTE_ELEMENT
D;JNE

// 	goto END                // otherwise, goto END
@END
0;JMP

// label COMPUTE_ELEMENT
(COMPUTE_ELEMENT)

//     // that[2] = that[0] + that[1]
// 	push that 0
@THAT
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

// 	push that 1
@THAT
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

// 	pop that 2
@2
D=A
@THAT
D=D+M
@pop_default
M=D
@SP
AM=M-1
D=M
@pop_default
A=M
M=D

// 	// THAT += 1 (updates the base address of that)
// 	push pointer 1
@THAT
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

// 	add
@SP
AM=M-1
D=M
A=A-1
M=D+M

// 	pop pointer 1 
@SP
AM=M-1
D=M
@THAT
M=D

// 	// updates n-- and loops          
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

// 	pop argument 0          
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

// 	goto LOOP
@LOOP
0;JMP

// label END
(END)

