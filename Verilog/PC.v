module ProgramCounter (
    input clock,                   
    input reset,                
    input pcWrite,               
    input branch,
    input enableJump,         
    input [19:0] pcIn,          
    input [19:0] branchAddress,
    input [19:0] JumpAddress, 
    output reg [19:0] pcOut      
);

    always @(posedge clock or posedge reset) begin
        if (reset) begin
            pcOut <= 20'b0; 
        end else if (branch | enableJump) begin
		if(branch)begin
		pcOut <= branchAddress;
		end else if(enableJump)begin
		pcOut <= JumpAddress; end 
        end else if (pcWrite) begin
            pcOut <= pcIn + 1; 
        end
    end

endmodule

