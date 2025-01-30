module mux16to1_20bit (
    input wire [3:0] select,          
    input wire [19:0] data0,          
    input wire [19:0] data1,
    input wire [19:0] data2,
    input wire [19:0] data3,
    input wire [19:0] data4,
    input wire [19:0] data5,
    input wire [19:0] data6,
    input wire [19:0] data7,
    input wire [19:0] data8,
    input wire [19:0] data9,
    input wire [19:0] data10,
    input wire [19:0] data11,
    input wire [19:0] data12,
    input wire [19:0] data13,
    input wire [19:0] data14,
    input wire [19:0] data15,
    output wire [19:0] out            
);
    assign out = (select == 4'd0)  ? data0 :
                 (select == 4'd1)  ? data1 :
                 (select == 4'd2)  ? data2 :
                 (select == 4'd3)  ? data3 :
                 (select == 4'd4)  ? data4 :
                 (select == 4'd5)  ? data5 :
                 (select == 4'd6)  ? data6 :
                 (select == 4'd7)  ? data7 :
                 (select == 4'd8)  ? data8 :
                 (select == 4'd9)  ? data9 :
                 (select == 4'd10) ? data10 :
                 (select == 4'd11) ? data11 :
                 (select == 4'd12) ? data12 :
                 (select == 4'd13) ? data13 :
                 (select == 4'd14) ? data14 :
                 (select == 4'd15) ? data15 : 20'd0;
endmodule

