module RegisterFile (
    input clock,                
    input enable,             
    input writeEnable,        
    input [3:0] writeRegister, 
    input [19:0] WriteData,   
    input [3:0] ReadRegister1, 
    input [3:0] ReadRegister2, 
    output reg [19:0] ReadData1, 
    output reg [19:0] ReadData2  
);


    reg [19:0] registers [0:15];
    
    
    integer i;
    always @(posedge clock) begin
        if (writeEnable) begin
            registers[writeRegister] <= WriteData; 
        end
    end

    
    always @(*) begin
        ReadData1 = registers[ReadRegister1]; 
        ReadData2 = registers[ReadRegister2]; 
    end

endmodule

