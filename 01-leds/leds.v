//------------------------------------------------------------------
//-- Hello world example
//-- Turn on all the leds
//-- This example has been tested on the following boards:
//--   * Lattice icestick
//--   * Icezum alhambra (https://github.com/FPGAwars/icezum)
//------------------------------------------------------------------

module leds(output wire LED0,
            output wire LED1,
            output wire LED2,
            output wire LED3);

assign LED0 = 1'b1;
assign LED1 = 1'b1;
assign LED2 = 1'b1;
assign LED3 = 1'b1;

endmodule
