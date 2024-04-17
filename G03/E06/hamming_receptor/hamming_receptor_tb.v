//-------------------------------------------------------------------
//-- hamming_receptor_tb.v
//-- Testbench
//-------------------------------------------------------------------
//-- Guido Sanchez
//-- GPL license
//-------------------------------------------------------------------

`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns
// timescale <time_unit> / <time_precision>

module hamming_receptor_tb();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 10;

//-- Clock signal. It is not used in this simulation
reg clk = 0;
always #0.5 clk = ~clk;

// hamming_receptor ports
reg [6:0] test_m_in;
wire [3:0] test_d_out;

hamming_receptor UUT(
    .m_in(test_m_in),
    .d_out(test_d_out)
);

integer i;

initial begin

    //-- File were to store the simulation results
    $dumpfile(`DUMPSTR(`VCD_OUTPUT));
    $dumpvars(0, hamming_receptor_tb);

    for (i=0; i<128; i=i+1)
    begin
        $display ("Current loop # %0d", i);
        $display ("Current loop # %0b", i);

        #2
        test_m_in = i;
    end

    #(DURATION) $display("End of simulation");
    $finish;
end

endmodule