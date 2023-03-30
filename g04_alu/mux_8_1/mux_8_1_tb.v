//-------------------------------------------------------------------
//-- mux_8_1_tb.v
//-- Testbench
//-------------------------------------------------------------------
//-- Guido Sanchez
//-- GPL license
//-------------------------------------------------------------------

`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns
// timescale <time_unit> / <time_precision>

module mux_8_1_tb ();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 10;

//-- Clock signal. It is not used in this simulation
reg clk = 0;
always #0.5 clk = ~clk;

// mux_8_1 ports
reg test_d0, test_d1, test_d2, test_d3, test_d4, test_d5, test_d6, test_d7;
reg [2:0] test_sel;
wire test_o0;

//-- Instantiate the unit to test
mux_8_1 UUT (
            .d0(test_d0),
            .d1(test_d1),
            .d2(test_d2),
            .d3(test_d3),
            .d4(test_d4),
            .d5(test_d5),
            .d6(test_d6),
            .d7(test_d7),
            .sel(test_sel),
            .o0(test_o0)
         );

integer i, j;
reg [7:0] i_b;

initial begin

  //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, mux_8_1_tb);

  for (i=0; i<256; i=i+1)
  begin

    for (j=0; j<8; j=j+1)
    begin

      $display ("Current loop # %0d", i);
      $display ("Current loop # %0b", i);
      
      #2
      i_b = i;

      test_d0 = i_b[0];
      test_d1 = i_b[1];
      test_d2 = i_b[2];
      test_d3 = i_b[3];
      test_d4 = i_b[4];
      test_d5 = i_b[5];
      test_d6 = i_b[6];
      test_d7 = i_b[7];
      test_sel = j;

    end

  end

   #(DURATION) $display("End of simulation");
  $finish;
end

endmodule
