//-------------------------------------------------------------------
//-- restador_completo_1_bit_tb.v
//-- Testbench
//-------------------------------------------------------------------
//-- Guido Sanchez
//-- GPL license
//-------------------------------------------------------------------

`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns
// timescale <time_unit> / <time_precision>

module restador_completo_1_bit_tb ();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 10;

//-- Clock signal. It is not used in this simulation
reg clk = 0;
always #0.5 clk = ~clk;

// restador_completo_1_bit ports
reg test_x, test_y, test_b_in;
wire test_d, test_b_out;

//-- Instantiate the unit to test
restador_completo_1_bit UUT (
            .x(test_x),
            .y(test_y),
            .b_in(test_b_in),
            .d(test_d),
            .b_out(test_b_out)
         );

integer i;
reg [2:0] i_b;

initial begin

  //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, restador_completo_1_bit_tb);

  for (i=0; i<8; i=i+1)
  begin

      $display ("Current loop # %0d", i);
      $display ("Current loop # %0b", i);
      
      #2
      i_b = i;

      test_x = i_b[0];
      test_y = i_b[1];
      test_b_in = i_b[2];

  end

   #(DURATION) $display("End of simulation");
  $finish;
end

endmodule
