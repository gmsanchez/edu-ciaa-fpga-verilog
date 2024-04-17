`default_nettype none

module tb_cd40147_always;
reg clk;


reg [9:0] i_tb;
wire [3:0] o_tb;

cd40147_always UUT
(
    .i (i_tb),
    .o (o_tb)
);

localparam CLK_PERIOD = 10;
always #(CLK_PERIOD/2) clk=~clk;

initial begin
    $dumpfile("cd40147_always_tb.vcd");
    $dumpvars(0, tb_cd40147_always);
end

initial begin

    #1 i_tb = 10'b0000000000;
    #1 i_tb = 10'b0000000001;
    #1 i_tb = 10'b0000000010;
    #1 i_tb = 10'b0000000100;
    #1 i_tb = 10'b0000001000;
    #1 i_tb = 10'b0000010000;
    #1 i_tb = 10'b0000100000;
    #1 i_tb = 10'b0001000000;
    #1 i_tb = 10'b0010000000;
    #1 i_tb = 10'b0100000000;
    #1 i_tb = 10'b1000000000;
    #1 i_tb = 10'b1100000000;
    #1 i_tb = 10'b0111111111;
    #1 i_tb = 10'b0000000000;
    #5;
    $finish(2);
end

endmodule
`default_nettype wire