import sys, inspect
import Parser, CodeWriter
from os import listdir
from os.path import isfile, join

class VMTranslator:
    def __init__(self, folder_path):
        self.Parser = Parser.Parser()

        self.vmfiles = [join(folder_path,f) for f in listdir(folder_path) if isfile(join(folder_path, f)) and f.endswith(".vm")]
        self.file_path = folder_path
        hack_filepath = join(folder_path, str(self.file_path + ".asm"))
        self.hack_file = open(hack_filepath, 'w')
        self.CodeWriter = CodeWriter.CodeWriter(self.hack_file)
        
        sys_file = join(folder_path, "Sys.vm")
        if sys_file in self.vmfiles:
            self.vmfiles.remove(sys_file)
            self.vmfiles.append(sys_file)
            self.writeInit()
    
    def writeInit(self):
        line = f"""
        // adding basic addresses
        @256
        D=A
        @SP
        M=D
        // call Sys.init 0
        """
        line = inspect.cleandoc(line)
        self.hack_file.writelines(line + "\n" + "\n")
        self.CodeWriter.c_call("Sys.init", "0")

    def translatorPass(self):
        for vmfile in self.vmfiles:
            self.CodeWriter.static_file_name = vmfile.replace(".","").replace("\\",".").replace("vm","")
            file = open(vmfile, 'r')
            for line in file.readlines():
                if line.strip() != "":        
                    self.hack_file.writelines("// " + line + "\n")
                instruction, arg1, arg2 = self.Parser.instructionType(line)
                if instruction == "C_PUSH":
                    self.CodeWriter.c_push(arg1, arg2)
                elif instruction == "C_POP":
                    self.CodeWriter.c_pop(arg1, arg2)
                elif instruction == "C_ARITHMETIC":
                    self.CodeWriter.c_arithmetic(arg1)
                elif instruction == "C_LABEL":
                    self.CodeWriter.c_label(arg1)
                elif instruction == "C_GOTO":
                    self.CodeWriter.c_goto(arg1)
                elif instruction == "C_IF":
                    self.CodeWriter.c_if(arg1)
                elif instruction == "C_FUNCTION":
                    self.CodeWriter.c_function(arg1, arg2)
                elif instruction == "C_RETURN":
                    self.CodeWriter.c_return()
                elif instruction == "C_CALL":
                    self.CodeWriter.c_call(arg1, arg2)

                    
if len(sys.argv) < 2:
    print("Usage: python VMTranslator.py <file_folder>")
    sys.exit(1)

folderpath = sys.argv[1]
assembler = VMTranslator(folder_path=folderpath)
assembler.translatorPass()
assembler.hack_file.close()