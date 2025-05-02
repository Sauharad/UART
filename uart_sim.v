`timescale 1ns / 1ps


module uart_sim;

reg clk_p,clk_n,reset,en;
reg [7:0] tx_in;

wire baud_tick = UART.TX.baud_tick;

wire tx = UART.TX.tx;
wire rx = UART.RX.rx;

wire start_tx = UART.TX.start_tx;
wire tx_done_tick = UART.TX.tx_done_tick;
wire rx_done_tick = UART.RX.rx_done_tick;

wire [7:0] rx_out;
uart_toplevel UART(.SYSCLK_P(clk_p),.SYSCLK_N(clk_n),.reset(reset),.en(en),.tx_in(tx_in),.rx_out(rx_out));



initial
begin
    clk_p = 1'b0;
    forever #0.05 clk_p = ~clk_p;
end

initial
begin
    clk_n = 1'b1;
    forever #0.05 clk_n = ~clk_n;
end

initial
begin
    #1 reset = 1;
    #2 reset = 0;
    #1 tx_in = 8'b01010101;
    #2 en = 1;
    #1 en = 0;
end
endmodule
