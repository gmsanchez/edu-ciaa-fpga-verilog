//-------------------------------------------------------------------
//-- comparador_4b_tb.v
//-- Testbench
//-------------------------------------------------------------------
//-- Juan Gonzalez (Obijuan)
//-- Jesus Arroyo Torrens
//-- GPL license
//-------------------------------------------------------------------
`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns

module comparador_4b_tb();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 10;

//-- Clock signal. It is not used in this simulation
reg clk = 0;
always #0.5 clk = ~clk;

//-- Leds port
reg [3:0] a_test, b_test;
wire G_test, L_test, E_test;

//-- Instantiate the unit to test
comparador_4b UUT (
           .a(a_test),
           .b(b_test),
           .G(G_test),
           .L(L_test),
           .E(E_test)
         );


initial begin

  //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, comparador_4b_tb);

  a_test = 4'd4;
  b_test = 4'd4;
  #1
  b_test = 4'd1;
  #1
  b_test = 4'd14;

  #(DURATION) $display("End of simulation");

  $finish;
end

endmodule
