module top
(
  // CLOCKS
  input CLOCK100,

  // LED ARRAY
  output [7:0]LED_ARRAY_IO
);

wire clock50, pll_reset_n;

altpll u0 (
  .clk_100_clk                     (CLOCK100),
  .reset_reset_n                   (),
  .altpll_areset_conduit_export    (),
  .altpll_locked_conduit_export    (pll_reset_n),
  .altpll_phasedone_conduit_export (),
  .altpll_50_clk                   (clock50),
  .altpll_pll_slave_read           (),
  .altpll_pll_slave_write          (),
  .altpll_pll_slave_address        (),
  .altpll_pll_slave_readdata       (),
  .altpll_pll_slave_writedata      ()
);

wire [31:0] identifier;
wire [31:0] value;

niosii nios_ii (
  .clock_50_clk                          (clock50),
  .reset_n_reset_n                       (pll_reset_n),
  .identifier_external_connection_export (identifier),
  .value_external_connection_export      (value)
);

assign LED_ARRAY_IO = value[7:0];

endmodule