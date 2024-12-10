//------------------------------------------------------------------
//-- Hello world example
//-- Turn on all the leds
//-- This example has been tested on the following boards:
//--   * Lattice icestick
//--   * Icezum alhambra (https://github.com/FPGAwars/icezum)
//------------------------------------------------------------------

module leds(output logic LED0,
            output logic LED1,
            output logic LED2,
            output logic LED3);

assign LED0 = 1'b1;
assign LED1 = 1'b0;
assign LED2 = 1'b1;
assign LED3 = 1'b0;

endmodule
