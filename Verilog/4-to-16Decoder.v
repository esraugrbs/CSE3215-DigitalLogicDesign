module decoder_4to16 (
    input wire [3:0] in,       
    output wire [15:0] out     
);
    assign out = 16'b0000000000000001 << in;
endmodule

