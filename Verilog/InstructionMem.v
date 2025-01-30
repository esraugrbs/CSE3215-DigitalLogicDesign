module InstructionMemory (
    input [11:0] Address,       
    input ReadEnable,           
    output reg [19:0] instruction 
);

    
    reg [19:0] memory [0:4095];

    
    initial begin
        $readmemh("output.hex", memory); 
    end

    
    always @(*) begin
        if (ReadEnable) begin
            instruction = memory[Address]; 
        end else begin
            instruction = 20'b0; 
        end
    end

endmodule

