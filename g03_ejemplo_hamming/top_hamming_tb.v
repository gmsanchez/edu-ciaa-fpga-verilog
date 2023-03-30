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

module top_hamming_tb();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 10;

//-- Clock signal. It is not used in this simulation
reg clk = 0;
always #0.5 clk = ~clk;

// top_hamming ports
reg [3:0] test_d_in;
reg [6:0] test_error;
wire [3:0] test_d_out;

//-- Instantiate the unit to test
top_hamming UUT (
           .d_in(test_d_in),
           .error(test_error),
           .d_out(test_d_out)
         );

integer i, j;

initial begin

  //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, top_hamming_tb);

  for (i=0; i<16; i=i+1)
  begin

    for (j=0; j<8; j=j+1)
    begin

      $display ("Current loop # %0d", i);
      $display ("Current loop # %0b", i);
      
      #2
      test_d_in = i;

      test_error = 7'b000000;
      test_error[j-1] = 1;

    end

  end

   #(DURATION) $display("End of simulation");
  $finish;
end

endmodule