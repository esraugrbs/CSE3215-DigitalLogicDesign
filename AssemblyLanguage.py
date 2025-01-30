class Assembler:
    def __init__(self):
        
        self.opcodes = {
            "BGE": "10001",
            "BLE": "10000",
            "BGT": "01111",
            "BLT": "01110",
            "BEQ": "01101",
            "JUMP": "01100",
            "ST": "01011",
            "LD": "01010",
            "SLLI": "01001",
            "SUBI": "01000",
            "NANDI": "00111",
            "ORI": "00110",
            "ADDI": "00101",
            "SLL": "00100",
            "NAND": "00011",
            "OR": "00010",
            "SUB": "00001",
            "ADD": "00000"
        }

    def register_to_binary(self, reg):
        
        if not reg.startswith("R"):
            raise ValueError(f"Invalid registration: {reg}")
        reg_num = int(reg[1:])
        if reg_num < 0 or reg_num > 15:
            raise ValueError(f"Register number must be between 0-15: {reg}")
        return f"{reg_num:05b}"

    def immediate_to_binary(self, imm):
        
        imm = int(imm)
        if imm < -16 or imm > 15:
            raise ValueError(f"The immediate value must be between -16 and 15: {imm}")
        return f"{imm & 0b11111:05b}"

    def assemble_instruction(self, instruction):
        
        parts = instruction.replace(",", " ").split()
        if len(parts) < 2:
            raise ValueError(f"Invalid instruction: {instruction}")

        opcode = self.opcodes.get(parts[0].upper())
        if not opcode:
            raise ValueError(f"Unknown command: {parts[0]}")

        if parts[0].upper() in ["ADD", "SUB", "OR", "NAND", "SLL"]:
            dest = self.register_to_binary(parts[1])
            src1 = self.register_to_binary(parts[2])
            src2 = self.register_to_binary(parts[3])
            return opcode + dest + src1 + src2

        elif parts[0].upper() in ["ADDI", "ORI", "NANDI", "SUBI", "SLLI"]:
            dest = self.register_to_binary(parts[1])
            src1 = self.register_to_binary(parts[2])
            imm = self.immediate_to_binary(parts[3])
            return opcode + dest + src1 + imm

        elif parts[0].upper() == "LD":
            dest = self.register_to_binary(parts[1])
            addr = self.immediate_to_binary(parts[2])
            return opcode + dest + addr + "00000"

        elif parts[0].upper() == "ST":
            src = self.register_to_binary(parts[1])
            addr = self.immediate_to_binary(parts[2])
            return opcode + src + addr + "00000"

        elif parts[0].upper() == "JUMP":
            imm = self.immediate_to_binary(parts[1])
            return opcode + "00000" + "00000" + imm

        elif parts[0].upper() in ["BEQ", "BLT", "BGT", "BLE", "BGE"]:
            src1 = self.register_to_binary(parts[1])
            src2 = self.register_to_binary(parts[2])
            imm = self.immediate_to_binary(parts[3])
            return opcode + src1 + src2 + imm

        else:
            raise ValueError(f"Unknown or unsupported instruction: {instruction}")

    def assemble(self, assembly_code):
        
        machine_code = []
        for line in assembly_code.strip().split("\n"):
            line = line.split("#")[0].strip()  
            if line:
                machine_code.append(self.assemble_instruction(line))
        return machine_code

    def format_hex_output(self, machine_code):
       
        return [f"{int(code, 2):05x}" for code in machine_code]


input_file = "input.txt"
output_file = "output.hex"

with open(input_file, "r") as infile:
    assembly_code = infile.read()

assembler = Assembler()
machine_code = assembler.assemble(assembly_code)
hex_output = assembler.format_hex_output(machine_code)

with open(output_file, "w") as outfile:
    outfile.write("v2.0 raw\n")
    outfile.write(" ".join(hex_output) + "\n")
