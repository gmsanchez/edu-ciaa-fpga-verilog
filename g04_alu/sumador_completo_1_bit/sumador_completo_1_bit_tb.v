//-------------------------------------------------------------------
//-- sumador_completo_1_bit_tb.v
//-- Testbench
//-------------------------------------------------------------------
//-- Guido Sanchez
//-- GPL license
//-------------------------------------------------------------------

`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns
// timescale <time_unit> / <time_precision>

module sumador_completo_1_bit_tb ();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 10;

//-- Clock signal. It is not used in this simulation
reg clk = 0;
always #0.5 clk = ~clk;

// sumador_completo_1_bit ports
reg test_x, test_y, test_c_in;
wire test_s, test_c_out;

//-- Instantiate the unit to test
sumador_completo_1_bit UUT (
            .x(test_x),
            .y(test_y),
            .c_in(test_c_in),
            .s(test_s),
            .c_out(test_c_out)
         );

integer i;
reg [2:0] i_b;

initial begin

  //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, sumador_completo_1_bit_tb);

  for (i=0; i<8; i=i+1)
  begin

      $display ("Current loop # %0d", i);
      $display ("Current loop # %0b", i);
      
      #2
      i_b = i;

      test_x = i_b[0];
      test_y = i_b[1];
      test_c_in = i_b[2];

  end

   #(DURATION) $display("End of simulation");
  $finish;
end

endmodule
