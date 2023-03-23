//-------------------------------------------------------------------
//-- g02_e09_tb.v
//-- Testbench
//-------------------------------------------------------------------
//-- Guido Sanchez
//-- GPL license
//-------------------------------------------------------------------

`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns
// timescale <time_unit> / <time_precision>

module g02_e09_tb();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 10;

//-- Clock signal. It is not used in this simulation
reg clk = 0;
always #0.5 clk = ~clk;

// g02_e09 ports
reg [3:0] test_a;
wire test_z;

//-- Instantiate the unit to test
g02_e09 UUT (
           .a(test_a),
           .z(test_z)
         );

integer i;

initial begin

  //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, g02_e09_tb);

  for (i=0; i<16; i=i+1)
  begin
    $display ("Current loop # %0d", i);
    $display ("Current loop # %0b", i);
    
    #2
    test_a = i;
  end

   #(DURATION) $display("End of simulation");
  $finish;
end

endmodule