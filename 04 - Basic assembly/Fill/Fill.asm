// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

//// Replace this comment with your code.

@SCREEN
D=A

@current_loc
M=D

@8192
D=D+A
@max
M=D

(CHECK)
    @KBD
    D=M
    @SET_BLACK
    D;JNE

    @CHECK
    0;JMP

(SET_BLACK)
    @current_loc
    D=M
    @max
    D=M-D
    @RESET_SCREEN
    D;JEQ

    @current_loc
    A=M
    M=-1

    @current_loc
    M=M+1

    @SET_BLACK
    0;JMP


(RESET_SCREEN)
    @SCREEN
    D=A
    @current_loc
    M=D

    @SET_WHITE
    0;JMP

(SET_WHITE)

    @current_loc
    D=M
    @max
    D=M-D
    @RESET_CURRENT
    D;JEQ

    @current_loc
    A=M
    M=0

    @current_loc
    M=M+1

    @SET_WHITE
    0;JMP

(RESET_CURRENT)
    @SCREEN
    D=A
    @current_loc
    M=D

    @CHECK
    0;JMP