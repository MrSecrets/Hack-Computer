import inspect

class CodeWriter:
    def __init__(self, hack_file):
        self.hack_file = hack_file
        self.segments = {
            "local" : "LCL",
            "argument" : "ARG",
            "that" : "THAT",
            "this" : "THIS",
        }
        self.loop_counter = 0
        self.static_file_name = ""
            
    def c_push(self, segment, value):
        line = ""

        if segment == "constant":
            line = f"""
            @{value}
            D=A
            @SP
            A=M
            M=D
            @SP
            M=M+1
            """

        elif segment in self.segments:
            seg = self.segments[segment]
            line = f"""
            @{seg}
            D=M
            @{value}
            D=D+A
            A=D
            D=M
            @SP
            A=M
            M=D
            @SP
            M=M+1
            """

        elif segment == "static":
            line = f"""
            @{self.static_file_name}.{value}
            D=M
            @SP
            A=M
            M=D
            @SP
            M=M+1
            """

        elif segment == "temp":
            temp = str(5 + int(value))
            line = f"""
            @{temp}
            D=M
            @SP
            A=M
            M=D
            @SP
            M=M+1
            """
        
        elif segment == "pointer":
            if value == "0":
                seg = self.segments["this"]
            else: 
                seg = self.segments["that"]

            line = f"""
            @{seg}
            D=M
            @SP
            A=M
            M=D
            @SP
            M=M+1      
            """
        line = inspect.cleandoc(line)
        self.hack_file.writelines(line + "\n" + "\n")

    def c_pop(self, segment, value):
        line = ""

        if segment in self.segments:
            seg = self.segments[segment]
            line = f"""
            @{value}
            D=A
            @{seg}
            D=D+M
            @pop_default
            M=D
            @SP
            AM=M-1
            D=M
            @pop_default
            A=M
            M=D
            """
        elif segment == "static":
            line = f"""
            @SP
            AM=M-1
            D=M
            @{self.static_file_name}.{value}
            M=D
            """

        elif segment == "temp":
            temp = str(5 + int(value))
            line = f"""
            @SP
            AM=M-1
            D=M
            @{temp}
            M=D
            """

        elif segment == "pointer":
            if value == "0":
                seg = self.segments["this"]
            else: 
                seg = self.segments["that"]
            line = f"""
            @SP
            AM=M-1
            D=M
            @{seg}
            M=D
            """

        line = inspect.cleandoc(line)
        self.hack_file.writelines(line + "\n" + "\n")

    def c_arithmetic(self, function):
        line = ""
        count = str(self.loop_counter)
        
        if function == "add":
            line = f"""
            @SP
            AM=M-1
            D=M
            A=A-1
            M=D+M
            """
        elif function == "sub":
            line = f"""
            @SP
            AM=M-1
            D=M
            A=A-1
            M=M-D
            """

        elif function == "neg":
            line = f"""
            @SP
            A=M-1
            M=-M
            """
        
        elif function == "eq":
            line = f"""
            @SP
            AM=M-1
            D=M
            A=A-1
            D=M-D
            @COMPARE_{count})
            D;JEQ
            @SP
            A=M-1
            M=0
            @END_COMPARE_{count}
            0;JMP
            (COMPARE_{count})
            @SP
            A=M-1
            M=-1
            (END_COMPARE_{count}) 
            """
            self.loop_counter +=1
        
        elif function == "gt":
            line = f"""
            @SP
            AM=M-1
            D=M
            A=A-1
            D=M-D
            @COMPARE_{count}
            D;JGT
            @SP
            A=M-1
            M=0
            @END_COMPARE_{count}
            0;JMP
            (COMPARE_{count})
            @SP
            A=M-1
            M=-1
            (END_COMPARE_{count}
            """
            self.loop_counter +=1

        elif function == "lt":
            line = f"""
            @SP
            AM=M-1
            D=M
            A=A-1
            D=M-D
            @COMPARE_{count}
            D;JLT
            @SP
            A=M-1
            M=0
            @END_COMPARE_{count}
            0;JMP
            (COMPARE_{count})
            @SP
            A=M-1
            M=-1
            (END_COMPARE_{count})
            """
            self.loop_counter +=1

        elif function == "and":
            line = f"""
            @SP
            AM=M-1
            D=M
            A=A-1            
            M=D&M
            """

        elif function == "or":
           line = f"""
            @SP
            AM=M-1
            D=M
            A=A-1
            M=D|M
            """

        elif function == "not":
            line =f"""
            @SP
            A=M-1
            M=!M
            """

        line = inspect.cleandoc(line)
        self.hack_file.writelines(line + "\n" + "\n")

    def c_label(self, label):
        line = f"({label})"
        self.hack_file.writelines(line + "\n" + "\n")
    
    def c_goto(self, label):
        line = f"""
        @{label}
        0;JMP
        """
        line = inspect.cleandoc(line)
        self.hack_file.writelines(line + "\n" + "\n")

    def c_if(self, label):
        line = f"""
        @SP
        M=M-1
        A=M
        D=M
        @{label}
        D;JNE
        """
        line = inspect.cleandoc(line)
        self.hack_file.writelines(line + "\n" + "\n")

    def c_function(self, function, value):
        line = f"({function})"
        self.hack_file.writelines(line + "\n" + "\n")

        for _ in range(int(value)):
            line = f"""
            // push 0
            @SP
            A=M
            M=0
            @SP
            M=M+1
            """
            line = inspect.cleandoc(line)
            self.hack_file.writelines(line + "\n" + "\n")

    def c_return(self):
        line = f"""
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
        """
        line = inspect.cleandoc(line)
        self.hack_file.writelines(line + "\n" + "\n")

    def c_call(self, function, value):
        count = str(self.loop_counter)
        line = f"""
        // push return_address
        @{function}_Ret_{count}
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
        @{value}
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
        @{function}
        0;JMP
        // (return address)
        ({function}_Ret_{count})
        """
        self.loop_counter +=1
        line = inspect.cleandoc(line)
        self.hack_file.writelines(line + "\n" + "\n")