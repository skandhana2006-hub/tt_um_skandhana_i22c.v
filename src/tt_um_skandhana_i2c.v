module tt_um_skandhana_i2c (
    input  wire [7:0] ui_in,
    output wire [7:0] uo_out,
    input  wire [7:0] uio_in,
    output wire [7:0] uio_out,
    output wire [7:0] uio_oe,

    input  wire ena,
    input  wire clk,
    input  wire rst_n
);

    // I2C signals
    wire scl;
    wire sda;

    assign scl = ui_in[0];
    assign sda = ui_in[1];

    reg [7:0] shift_reg;

    always @(posedge scl or negedge rst_n) begin
        if (!rst_n)
            shift_reg <= 8'b00000000;
        else
            shift_reg <= {shift_reg[6:0], sda};
    end

    assign uo_out = shift_reg;

    assign uio_out = 8'b00000000;
    assign uio_oe  = 8'b00000000;

endmodule
