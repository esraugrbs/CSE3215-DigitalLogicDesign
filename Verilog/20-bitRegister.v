
module register_20bit (
    input wire clk,                  
    input wire enable,               
    input wire [19:0] Register,             
    output wire [19:0] RegisterOutput            
);
    
    wire [19:0] q;

    
    generate
        genvar i;
        for (i = 0; i < 20; i = i + 1) begin : flipflop_gen
            
            wire and_clk_enable;
            assign and_clk_enable = enable & clk;

            // D Flip-Flop
            dff dff_inst (
                .clk(and_clk_enable),
                .d(Register[i]),
                .q(RegisterOutput[i])
            );
        end
    endgenerate

    
    assign RegisterOutput = q;

endmodule

module dff (
    input wire clk,    
    input wire d,      
    output reg q       
);
    always @(posedge clk) begin
            q <= d;
    end
endmodule
