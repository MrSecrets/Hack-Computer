import re

class Parser:
    def __init__(self):

        self.current_line = ""
        self.instruction = ""


    def instructionType(self, line):

        self.current_line = line.strip()
        if self.current_line.startswith("@"):
            self.instruction = "A"
            return "A" # a instruction
        elif self.current_line.startswith("("):
            self.instruction = "L"
            return "L" # label
        elif self.current_line.startswith("//"):
            self.instruction = "H"
            return "H" # comment
        elif self.current_line == "":
            self.instruction = "B"
            return "B" # blank
        else:
            self.instruction = "C"
            return "C" # c instruction
        
    def symbol(self):
        if self.instruction == "A":
            a_instruction = self.current_line.split(" ")[0]
            return a_instruction.split('@')[1].strip()
        elif self.instruction == "L":
            label0 = re.search(r'\(.*?\)', self.current_line)
            label = str(label0.group(0).strip())
            label=label.replace("(","")
            label=label.replace(')','')
            return label
        return False
    
    def _dest(self):
        if '=' in self.current_line:
            inst1 = self.current_line.split("=")
            dest = inst1[0].split("/")[0].strip()
        else:
            # dest = self.current_line.split(';')[0].split("/")[0].strip()
            dest = False

        return dest
    
    def _comp(self):
        return self.current_line.split('=')[-1].split(';')[0].split("/")[0].strip()
    
    def _jump(self):
        if ';' in self.current_line:
            return self.current_line.split(';')[1].split("/")[0].strip()
        return False
    
    def control(self):
        dest, comp, jump = False, False, False

        if self.instruction == "C":
            dest = self._dest()
            comp = self._comp()
            jump = self._jump()


        return dest, comp, jump



        