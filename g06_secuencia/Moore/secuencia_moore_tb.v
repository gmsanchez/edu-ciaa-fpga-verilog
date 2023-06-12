/* `default_nettype net_type: sets the default net type for implicit net declarations, net_type is one of:
   wire, tri, tri0, tri1, triand, trior, trireg, wand, wor, none */
`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
// `timescale <time_unit> / <time_precision>
`timescale 100 ns / 10 ns

module secuencia_tb;

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 100;

//-- Clock signal. It is not used in this simulation
reg clk_test = 0;
always #1 clk_test = ~clk_test;

reg reset_test;
reg w_test;
wire z_test;

//-- Instantiate the unit to test
secuencia UUT (
         .clk(clk_test),
         .reset(reset_test),
         .w(w_test),
         .z(z_test)
         );

initial begin
    //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, secuencia_tb);
  
  #1
  reset_test = 1;
  w_test = 0;
  #1
  reset_test = 0;
  #1
  w_test = 1;

  #(DURATION) $display("End of simulation");
  $finish;
end




endmodule