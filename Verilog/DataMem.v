module DataMemory (
    input clock,                 
    input [11:0] Address,      
    input [19:0] DataInput,    
    input LoadEnable,          
    input WriteEnable,         
    output reg [19:0] DataOutput 
);

    
    reg [19:0] memory [0:4095];

    
    initial begin
        $readmemh("data_memory.hex(?)", memory); 
    end

    
    always @(posedge clock) begin
        if (WriteEnable) begin
            memory[Address] <= DataOutput; 
        end
    end

    
    always @(*) begin
        if (LoadEnable) begin
            DataOutput = memory[Address]; 
        end else begin
            DataOutput = 20'b0; 
        end
    end

endmodule

