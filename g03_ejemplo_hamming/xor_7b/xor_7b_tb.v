//-------------------------------------------------------------------
//-- xor_7b_tb.v
//-- Testbench
//-------------------------------------------------------------------
//-- Guido Sanchez
//-- GPL license
//-------------------------------------------------------------------

`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns
// timescale <time_unit> / <time_precision>

module xor_7b_tb ();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 10;

//-- Clock signal. It is not used in this simulation
reg clk = 0;
always #0.5 clk = ~clk;

// hamming_emisor ports
reg [6:0] test_d0, test_d1;
wire [6:0] test_o0;

xor_7b UUT(
    .d0(test_d0),
    .d1(test_d1),
    .o0(test_o0)
);

integer i, j;

initial begin

    //-- File were to store the simulation results
    $dumpfile(`DUMPSTR(`VCD_OUTPUT));
    $dumpvars(0, xor_7b_tb);

    for (i=0; i<128; i=i+1)
    begin

        for (j=0; j<128; j=j+1)
        begin
            $display ("Current loop i # %0d and j # %0d", i, j);
            $display ("Current loop i # %0b and j # %0b", i, j);

            #2
            test_d0 = i;
            test_d1 = j;
        end
    end

    #(DURATION) $display("End of simulation");
    $finish;
end

endmodule