import sys, shutil
import Parser, Code, SymbolTable


class HackAssembler:
    def __init__(self, file_path):
        self.Code = Code.Code()
        self.Symbol = SymbolTable.SymbolTable()
        self.Parser = Parser.Parser()

        self.file_path = file_path
        self.line_number = 0
        self.memory_number = 16

    def labelPass(self):
        self.file = open(self.file_path, 'r')
        for line in self.file.readlines():
            instruction = self.Parser.instructionType(line)
            
            if instruction == "L":
                l_inst = self.Parser.symbol()
                if not self.Symbol.contains(l_inst):
                    self.Symbol.addEntry(l_inst, self.line_number)
            elif  instruction == "A":
                self.line_number +=1
            elif instruction == "C":
                self.line_number+=1

    def addressPass(self):
        self.file = open(self.file_path, 'r')
        for line in self.file.readlines():
            instruction = self.Parser.instructionType(line)
            
            if  instruction == "A":
                a_inst = self.Parser.symbol()
                if not self.Symbol.contains(a_inst):
                    if not a_inst.isdigit():
                        self.Symbol.addEntry(a_inst, a_inst)
                    else:
                        self.Symbol.addEntry(a_inst, self.memory_number)
                        self.memory_number+=1
                    self.line_number +=1
            elif instruction == "C":
                self.line_number+=1

    def codePass(self):
        temp_file = str(self.file_path.replace(".asm", ".hack"))
        with open(temp_file, 'w') as temp_file, open(self.file_path) as asm_file:
            for line in asm_file:
                instruction = self.Parser.instructionType(line)
                
                if  instruction == "C":
                    d,c,j = self.Parser.control()
                    line = self.Code.c_binary(d,c,j)
                    temp_file.write(line + '\n')

                elif instruction == "A":
                    a_inst = self.Parser.symbol()
                    if a_inst and a_inst.isdigit():
                        line = self.Code.a_binary(a_inst)
                    else:
                        address = self.Symbol.getAddress(a_inst)
                        line = self.Code.a_binary(address)
                    temp_file.write(line + '\n')

    


if len(sys.argv) < 2:
    print("Usage: python HackAssembler.py <filepath>")
    sys.exit(1)

filepath = sys.argv[1]
assembler = HackAssembler(file_path=filepath)
assembler.labelPass()
assembler.addressPass()
assembler.codePass()
