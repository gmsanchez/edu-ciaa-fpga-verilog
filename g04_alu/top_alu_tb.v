//-------------------------------------------------------------------
//-- top_alu_tb.v
//-- Testbench
//-------------------------------------------------------------------
//-- Guido Sanchez
//-- GPL license
//-------------------------------------------------------------------

`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns
// timescale <time_unit> / <time_precision>

module top_alu_tb ();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 10;

//-- Clock signal. It is not used in this simulation
reg clk = 0;
always #0.5 clk = ~clk;

// top_alu ports
reg test_a, test_b, test_c_in;
reg [2:0] test_op_code;
wire test_o, test_p, test_z, test_c_out;

//-- Instantiate the unit to test
top_alu UUT (
           .a(test_a),
           .b(test_b),
           .c_in(test_c_in),
           .op_code(test_op_code),
           .o(test_o),
           .p(test_p),
           .z(test_z),
           .c_out(test_c_out)
         );

integer i, j;
reg [2:0] i_b;

initial begin

  //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, top_alu_tb);

  for (i=0; i<8; i=i+1)
  begin

    for (j=0; j<8; j=j+1)
    begin

      $display ("Current loop # %0d", i);
      $display ("Current loop # %0b", i);
      
      #2
      i_b = i;

      test_a = i_b[2];
      test_b = i_b[1];
      test_c_in = i_b[0];
      test_op_code = j;

    end

  end

   #(DURATION) $display("End of simulation");
  $finish;
end

endmodule
