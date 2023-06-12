/* `default_nettype net_type: sets the default net type for implicit net declarations, net_type is one of:
   wire, tri, tri0, tri1, triand, trior, trireg, wand, wor, none */
`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
// `timescale <time_unit> / <time_precision>
`timescale 100 ns / 10 ns

module contador_ud_p_tb;

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 100;

//-- Clock signal. It is not used in this simulation
reg clk_test = 0;
always #1 clk_test = ~clk_test;

reg reset_test;
reg up_test, down_test;
wire [W_TEST-1:0] count_test;

localparam W_TEST = 2;

//-- Instantiate the unit to test
contador_ud_p #(.W(W_TEST)) UUT (
         .clk(clk_test),
         .reset(reset_test),
         .up(up_test),
         .down(down_test),
         .count(count_test)
         );

initial begin
    //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, contador_ud_p_tb);
  
  #1
  reset_test = 0;
  up_test = 0;
  down_test = 0;
  #1
  reset_test = 0;
  #1  
  up_test = 1'b1;
  down_test = 1'b0;
  #30
  up_test = 1'b0;
  down_test = 1'b1;
  

   #(DURATION) $display("End of simulation");
  $finish;
end




endmodule