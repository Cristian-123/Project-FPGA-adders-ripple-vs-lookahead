# Project-FPGA-adders-ripple-vs-lookahead
Project Objective:
This project compares two 4-bit adder architectures, the Ripple Carry Adder (RCA) and the Carry Lookahead Adder (LCA), implemented in VHDL. The analysis is performed using Post-Synthesis Simulation in Vivado to evaluate the propagation delay of the Final Carry ($C_{out}$) and demonstrate the influence of specialized FPGA hardware.

Key Finding:
For a small 4-bit adder, the theoretical advantage of the LCA's parallelism is nearly negated by the FPGA's hardware optimization.
1. RCA (secuencial): Vivado synthesis maps the RCA structure to the FPGA's dedicated, ultra-fast routes (CARRY4 blocks), known as the Fast Carry Chain. This dedicated hardware minimizes the sequential propagation delay.
2. LCA (parallel): Although the LCA eliminates sequential dependency, the calculation of its final carry ($C_4$) requires complex, high-fan-in logic gates (AND/OR of up to 5 inputs). This complex calculation introduces logic depth delay which almost matches the optimized speed of the RCA's sequential propagation.

The difference of 0.35 ps is the small, residual advantage of the LCA's inherent parallelism over the highly optimized sequential RCA path.

The minimal difference observed in this 4-bit design does not reflect the performance at larger bit widths (e.g., 32 or 64 bits).
1. RCA Delay: Even when utilizing the CARRY4 blocks, the delay grows linearly ($O(N)$) with the number of bits, as blocks must be chained sequentially.
2. LCA Delay: The delay grows only logarithmically ($O(\log N)$) because the carry calculation is structured in hierarchical parallel stages (group carries).

Therefore, for larger summators, the time difference becomes significantly more pronounced in favor of the LCA, which maintains high speed regardless of width.
