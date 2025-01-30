module ALU (
    input [19:0] input1,        
    input [19:0] input2,        
    input [2:0] aluop,          
    output reg [19:0] aluOutput, 
    output reg ZeroFlag,         
    output reg NegativeFlag,    
    output reg PF                
);

always @(*) begin
    
    aluOutput = 20'b0;
    ZeroFlag = 1'b0;
    NegativeFlag = 1'b0;
    PF = 1'b0;

    case (aluop)
        3'b000: aluOutput = input1 + input2;          
        3'b001: aluOutput = input1 - input2;          
        3'b010: aluOutput = input1 | input2;          
        3'b011: aluOutput = ~(input1 & input2);       
        3'b100: aluOutput = input1 << input2[4:0];   
        default: aluOutput = 20'b0;                   
    endcase

    
    ZeroFlag = (aluOutput == 20'b0) ? 1'b1 : 1'b0;

    
    NegativeFlag = aluOutput[19];

    
    PF = ~(^aluOutput); 
end

endmodule

