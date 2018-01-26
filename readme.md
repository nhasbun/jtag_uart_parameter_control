# Uart Parameter Control #

Small project to control internal parameters of an FPGA circuit using JTAG-UART connection. 

It receives two consecutives integer numbers which is interpreted as the following actions:

* Identifier signal
* Value signal

Both signals are preserved until the next change.

## Notes

Quartus II 13.1 sp1 is used as the design software together with a Nios II gen 1 processor.

