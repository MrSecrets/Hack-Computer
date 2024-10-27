class CodeWriter:
    def __init__(self, file_name, hack_file):
        self.file_name = file_name
        self.hack_file = hack_file
        self.segments = {
            "local" : "LCL",
            "argument" : "ARG",
            "that" : "THAT",
            "this" : "THIS",
        }
        self.loop_counter = 0
            
    def c_push(self, segment, value):
        line = []

        if segment == "constant":
            line.append("@" + str(value))
            line.append("D=A")
            line.append("@SP")
            line.append("A=M")
            line.append("M=D")
            line.append("@SP")
            line.append("M=M+1")

        elif segment in self.segments:
            seg = self.segments[segment]
            line.append("@" + seg)
            line.append("D=M")
            line.append("@" + str(value))
            line.append("D=D+A")
            line.append("A=D" )
            line.append("D=M")
            line.append("@SP")
            line.append("A=M")
            line.append("M=D")
            line.append("@SP")
            line.append("M=M+1")

        elif segment == "static":
            line.append("@" + self.file_name + "." + str(value))
            line.append("D=M")
            line.append("@SP")
            line.append("A=M")
            line.append("M=D")
            line.append("@SP")
            line.append("M=M+1")

        elif segment == "temp":
            temp = str(5 + int(value))
            line.append("@" + temp)
            line.append("D=M")
            line.append("@SP")
            line.append("A=M")
            line.append("M=D")
            line.append("@SP")
            line.append("M=M+1")
        
        elif segment == "pointer":
            if value == "0":
                seg = self.segments["this"]
            else: 
                seg = self.segments["that"]
            line.append("@" + seg)
            line.append("D=M")
            line.append("@SP")
            line.append("A=M")
            line.append("M=D")
            line.append("@SP")
            line.append("M=M+1")      

        line.append("\n")
        self.hack_file.writelines('\n'.join(line))


    def c_pop(self, segment, value):
        line = []

        if segment in self.segments:
            seg = self.segments[segment]
            line.append("@" + str(value))
            line.append("D=A")
            line.append("@" + seg)
            line.append("D=D+M")
            line.append("@pop_default")
            line.append("M=D")
            line.append("@SP")
            line.append("AM=M-1")
            line.append("D=M")
            line.append("@pop_default")
            line.append("A=M")
            line.append("M=D")

        elif segment == "static":
            line.append("@SP")
            line.append("AM=M-1")
            line.append("D=M")
            line.append("@" + self.file_name + "." + str(value))
            line.append("M=D")

        elif segment == "temp":
            temp = str(5 + int(value))
            line.append("@SP")
            line.append("AM=M-1")
            line.append("D=M")
            line.append("@" + temp)
            line.append("M=D")

        elif segment == "pointer":
            if value == "0":
                seg = self.segments["this"]
            else: 
                seg = self.segments["that"]
            line.append("@SP")
            line.append("AM=M-1")
            line.append("D=M")
            line.append("@" + seg)
            line.append("M=D")


        line.append("\n")
        self.hack_file.writelines('\n'.join(line))

    def c_arithmetic(self, function):
        line =[]
        count = str(self.loop_counter)
        
        if function == "add":
            line.append("@SP")
            line.append("AM=M-1")
            line.append("D=M")
            line.append("A=A-1")
            line.append("M=D+M")

        if function == "sub":
            line.append("@SP")
            line.append("AM=M-1")
            line.append("D=M")
            line.append("A=A-1")
            line.append("M=M-D")

        if function == "neg":
            line.append("@SP")
            line.append("A=M-1")
            line.append("M=-M")
     
        if function == "eq":
            line.append("@SP")
            line.append("AM=M-1")
            line.append("D=M")
            line.append("A=A-1")
            line.append("D=M-D")
            line.append("@COMPARE_" + count)
            line.append("D;JEQ")
            line.append("@SP")
            line.append("A=M-1")
            line.append("M=0")
            line.append("@END_COMPARE_" + count)
            line.append("0;JMP")
            line.append("(COMPARE_" + count + ")")
            line.append("@SP")
            line.append("A=M-1")
            line.append("M=-1")
            line.append("(END_COMPARE_" + count + ")")
            self.loop_counter +=1

        if function == "gt":
            line.append("@SP")
            line.append("AM=M-1")
            line.append("D=M")
            line.append("A=A-1")
            line.append("D=M-D")
            line.append("@COMPARE_" + count)
            line.append("D;JGT")
            line.append("@SP")
            line.append("A=M-1")
            line.append("M=0")
            line.append("@END_COMPARE_" + count)
            line.append("0;JMP")
            line.append("(COMPARE_" + count + ")")
            line.append("@SP")
            line.append("A=M-1")
            line.append("M=-1")
            line.append("(END_COMPARE_" + count + ")")
            self.loop_counter +=1

        if function == "lt":
            line.append("@SP")
            line.append("AM=M-1")
            line.append("D=M")
            line.append("A=A-1")
            line.append("D=M-D")
            line.append("@COMPARE_" + count)
            line.append("D;JLT")
            line.append("@SP")
            line.append("A=M-1")
            line.append("M=0")
            line.append("@END_COMPARE_" + count)
            line.append("0;JMP")
            line.append("(COMPARE_" + count + ")")
            line.append("@SP")
            line.append("A=M-1")
            line.append("M=-1")
            line.append("(END_COMPARE_" + count + ")")
            self.loop_counter +=1

        if function == "and":
            line.append("@SP")
            line.append("AM=M-1")
            line.append("D=M")
            line.append("A=A-1")            
            line.append("M=D&M")

        if function == "or":
            line.append("@SP")
            line.append("AM=M-1")
            line.append("D=M")
            line.append("A=A-1")
            line.append("M=D|M")

        if function == "not":
            line.append("@SP")
            line.append("A=M-1")
            line.append("M=!M")

        line.append("\n")
        self.hack_file.writelines('\n'.join(line))