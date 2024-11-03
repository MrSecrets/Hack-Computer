// // Sys.vm. Tested by the NestedCall test script.
// // Consists of three functions: Sys.init, Sys.main, and Sys.add12.
// // Calls Sys.main() and stores a return value in temp 1.
// // Does not return (enters infinite loop).
// // The VM implementation starts running the Sys.init function, by default.
// function Sys.init 0
(Sys.init)

// 	push constant 4000	// tests that THIS and THAT are handled correctly
@4000
D=A
@SP
A=M
M=D
@SP
M=M+1

// 	pop pointer 0
@SP
AM=M-1
D=M
@THIS
M=D

// 	push constant 5000
@5000
D=A
@SP
A=M
M=D
@SP
M=M+1

// 	pop pointer 1
@SP
AM=M-1
D=M
@THAT
M=D

// 	call Sys.main 0
// push return_address
@return_address_NestedCall_0
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
@Sys.main
0;JMP
// (return address)
(return_address_NestedCall_0)

// 	pop temp 1
@SP
AM=M-1
D=M
@6
M=D

// 	label LOOP
(LOOP)

// 	goto LOOP
@LOOP
0;JMP

// // Sets locals 1, 2 and 3 to some values. Leaves locals 0 and 4 unchanged, 
// // to test that the 'function' VM command initliazes them to 0 (the test 
// // script sets them to -1 before this code starts running).
// // Calls Sys.add12(123) and stores the return value (should be 135) in temp 0.
// // Returns local 0 + local 1 + local 2 + local 3 + local 4 (should be 456), to 
// // confirm that locals were not mangled by the function call.
// function Sys.main 5
(Sys.main)

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

// push 0
@SP
A=M
M=0
@SP
M=M+1

// 	push constant 4001
@4001
D=A
@SP
A=M
M=D
@SP
M=M+1

// 	pop pointer 0
@SP
AM=M-1
D=M
@THIS
M=D

// 	push constant 5001
@5001
D=A
@SP
A=M
M=D
@SP
M=M+1

// 	pop pointer 1
@SP
AM=M-1
D=M
@THAT
M=D

// 	push constant 200
@200
D=A
@SP
A=M
M=D
@SP
M=M+1

// 	pop local 1
@1
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

// 	push constant 40
@40
D=A
@SP
A=M
M=D
@SP
M=M+1

// 	pop local 2
@2
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

// 	push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1

// 	pop local 3
@3
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

// 	push constant 123
@123
D=A
@SP
A=M
M=D
@SP
M=M+1

// 	call Sys.add12 1
// push return_address
@return_address_NestedCall_1
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
@Sys.add12
0;JMP
// (return address)
(return_address_NestedCall_1)

// 	pop temp 0
@SP
AM=M-1
D=M
@5
M=D

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

// 	push local 2
@LCL
D=M
@2
D=D+A
A=D
D=M
@SP
A=M
M=D
@SP
M=M+1

// 	push local 3
@LCL
D=M
@3
D=D+A
A=D
D=M
@SP
A=M
M=D
@SP
M=M+1

// 	push local 4
@LCL
D=M
@4
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

// 	add
@SP
AM=M-1
D=M
A=A-1
M=D+M

// 	add
@SP
AM=M-1
D=M
A=A-1
M=D+M

// 	add
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

// // Returns (argument 0) + 12.
// function Sys.add12 0
(Sys.add12)

// 	push constant 4002
@4002
D=A
@SP
A=M
M=D
@SP
M=M+1

// 	pop pointer 0
@SP
AM=M-1
D=M
@THIS
M=D

// 	push constant 5002
@5002
D=A
@SP
A=M
M=D
@SP
M=M+1

// 	pop pointer 1
@SP
AM=M-1
D=M
@THAT
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

// 	push constant 12
@12
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

