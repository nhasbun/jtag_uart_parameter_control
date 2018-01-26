// altpll.v

// Generated using ACDS version 13.0sp1 232 at 2018.01.26.14:55:07

`timescale 1 ps / 1 ps
module altpll (
		input  wire        clk_100_clk,                     //                  clk_100.clk
		input  wire        reset_reset_n,                   //                    reset.reset_n
		input  wire        altpll_areset_conduit_export,    //    altpll_areset_conduit.export
		output wire        altpll_locked_conduit_export,    //    altpll_locked_conduit.export
		output wire        altpll_phasedone_conduit_export, // altpll_phasedone_conduit.export
		output wire        altpll_50_clk,                   //                altpll_50.clk
		input  wire        altpll_pll_slave_read,           //         altpll_pll_slave.read
		input  wire        altpll_pll_slave_write,          //                         .write
		input  wire [1:0]  altpll_pll_slave_address,        //                         .address
		output wire [31:0] altpll_pll_slave_readdata,       //                         .readdata
		input  wire [31:0] altpll_pll_slave_writedata       //                         .writedata
	);

	wire    rst_controller_reset_out_reset; // rst_controller:reset_out -> ALTPLL:reset

	altpll_ALTPLL altpll (
		.clk       (clk_100_clk),                     //       inclk_interface.clk
		.reset     (rst_controller_reset_out_reset),  // inclk_interface_reset.reset
		.read      (altpll_pll_slave_read),           //             pll_slave.read
		.write     (altpll_pll_slave_write),          //                      .write
		.address   (altpll_pll_slave_address),        //                      .address
		.readdata  (altpll_pll_slave_readdata),       //                      .readdata
		.writedata (altpll_pll_slave_writedata),      //                      .writedata
		.c0        (altpll_50_clk),                   //                    c0.clk
		.areset    (altpll_areset_conduit_export),    //        areset_conduit.export
		.locked    (altpll_locked_conduit_export),    //        locked_conduit.export
		.phasedone (altpll_phasedone_conduit_export)  //     phasedone_conduit.export
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS        (1),
		.OUTPUT_RESET_SYNC_EDGES ("deassert"),
		.SYNC_DEPTH              (2),
		.RESET_REQUEST_PRESENT   (0)
	) rst_controller (
		.reset_in0  (~reset_reset_n),                 // reset_in0.reset
		.clk        (clk_100_clk),                    //       clk.clk
		.reset_out  (rst_controller_reset_out_reset), // reset_out.reset
		.reset_req  (),                               // (terminated)
		.reset_in1  (1'b0),                           // (terminated)
		.reset_in2  (1'b0),                           // (terminated)
		.reset_in3  (1'b0),                           // (terminated)
		.reset_in4  (1'b0),                           // (terminated)
		.reset_in5  (1'b0),                           // (terminated)
		.reset_in6  (1'b0),                           // (terminated)
		.reset_in7  (1'b0),                           // (terminated)
		.reset_in8  (1'b0),                           // (terminated)
		.reset_in9  (1'b0),                           // (terminated)
		.reset_in10 (1'b0),                           // (terminated)
		.reset_in11 (1'b0),                           // (terminated)
		.reset_in12 (1'b0),                           // (terminated)
		.reset_in13 (1'b0),                           // (terminated)
		.reset_in14 (1'b0),                           // (terminated)
		.reset_in15 (1'b0)                            // (terminated)
	);

endmodule