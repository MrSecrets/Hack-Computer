import sys
import Parser, CodeWriter


class VMTranslator:
    def __init__(self, file_path):
        self.Parser = Parser.Parser()

        self.file_path = file_path
        hack_filepath = str(self.file_path.replace(".vm", ".asm"))
        file_name = str(str(self.file_path).split("\\")[-1].removesuffix(".vm"))
        # file_name = str(self.file_path.removesuffix(".vm"))
        self.hack_file = open(hack_filepath, 'w')
        self.CodeWriter = CodeWriter.CodeWriter(file_name, self.hack_file)

    def translatorPass(self):
        file = open(self.file_path, 'r')
        for line in file.readlines():           
            self.hack_file.write("// " + line)
            instruction, arg1, arg2 = self.Parser.instructionType(line)
            if instruction == "C_PUSH":
                self.CodeWriter.c_push(arg1, arg2)
            elif instruction == "C_POP":
                self.CodeWriter.c_pop(arg1, arg2)
            elif instruction == "C_ARITHMETIC":
                self.CodeWriter.c_arithmetic(arg1)

                    
                    

    
if len(sys.argv) < 2:
    print("Usage: python VMTranslator.py <filepath>")
    sys.exit(1)

filepath = sys.argv[1]
assembler = VMTranslator(file_path=filepath)
assembler.translatorPass()
assembler.hack_file.close()