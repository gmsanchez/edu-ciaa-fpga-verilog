//-------------------------------------------------------------------
//-- hamming_emisor_tb.v
//-- Testbench
//-------------------------------------------------------------------
//-- Guido Sanchez
//-- GPL license
//-------------------------------------------------------------------

`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns
// timescale <time_unit> / <time_precision>

module hamming_emisor_tb();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 10;

//-- Clock signal. It is not used in this simulation
reg clk = 0;
always #0.5 clk = ~clk;

// hamming_emisor ports
reg [3:0] test_d_in;
wire [6:0] test_m_out;

hamming_emisor UUT(
    .d_in(test_d_in),
    .m_out(test_m_out)
);

integer i;

initial begin

    //-- File were to store the simulation results
    $dumpfile(`DUMPSTR(`VCD_OUTPUT));
    $dumpvars(0, hamming_emisor_tb);

    for (i=0; i<16; i=i+1)
    begin
        $display ("Current loop # %0d", i);
        $display ("Current loop # %0b", i);

        #2
        test_d_in = i;
    end

    #(DURATION) $display("End of simulation");
    $finish;
end

endmodule