import re

class Parser:
    def __init__(self):

        self.current_line = ""
        self.instruction = ""
        self.C_ARITHMETIC = {"add", "sub", "neg", "eq", "lt", "gt", "or", "and", "not"}


    def instructionType(self, line):

        self.current_line = line.strip()
        args = self.current_line.split()

        if len(args)==0:
            return None, None, None
        
        command = args[0]
        if command in self.C_ARITHMETIC:
            return "C_ARITHMETIC", command, 0
        elif command == "push":
            return "C_PUSH", args[1], args[2]
        elif command == "pop":
            return "C_POP", args[1], args[2]
        else:
            return None, None, None

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



        