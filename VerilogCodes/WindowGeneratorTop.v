module WindowGeneratorTop(
    input clk,
    input rst,
    input [23:0]input_pixel,
    input input_is_valid,

    output wire [23:0] output_pixel_1,
    output wire [23:0] output_pixel_2,
    output wire [23:0] output_pixel_3,
    output wire [23:0] output_pixel_4,
    output wire [23:0] output_pixel_5,
    output wire [23:0] output_pixel_6,
    output wire [23:0] output_pixel_7,
    output wire [23:0] output_pixel_8,
    output wire [23:0] output_pixel_9,
    output wire output_is_valid
);

wire [23:0]dlb_out_1,dlb_out_2,dlb_out_3;
wire dlb_out_valid;

Double_LineBuffer DLB(
    .clk(clk),
    .rst(rst),
    .input_pixel(input_pixel),
    .input_is_valid(input_is_valid),

    .output_pixel_1(dlb_out_1),
    .output_pixel_2(dlb_out_2),
    .output_pixel_3(dlb_out_3),
    .output_is_valid(dlb_out_valid)
);

WindowGenerator WG(
    .clk(clk),
    .rst(rst),
        
    .input_pixel_1(dlb_out_1),
    .input_pixel_2(dlb_out_2),
    .input_pixel_3(dlb_out_3),
    .input_is_valid(dlb_out_valid),
    
    .output_pixel_1(output_pixel_1),
    .output_pixel_2(output_pixel_2),
    .output_pixel_3(output_pixel_3),
    .output_pixel_4(output_pixel_4),
    .output_pixel_5(output_pixel_5),
    .output_pixel_6(output_pixel_6),
    .output_pixel_7(output_pixel_7),
    .output_pixel_8(output_pixel_8),
    .output_pixel_9(output_pixel_9),
    .output_is_valid(output_is_valid)
    );

endmodule