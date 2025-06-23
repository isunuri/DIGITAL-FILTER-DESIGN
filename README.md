# DIGITAL-FILTER-DESIGN

*COMPANY* : CODTECH IT SOLUTIONS

*NAME* : Chetana Isunuri

*INTERN ID* : CT04DF2543

*DOMAIN* : VLSI

*DURATION* : 4 WEEKS

*MENTOR* : VAISHALI

# Task Objective:
The primary aim of this task was to design and simulate a Finite Impulse Response (FIR) filter using Verilog Hardware Description Language on Xilinx Vivado. FIR filters are widely used in Digital Signal Processing (DSP) systems due to their linear-phase property and inherent stability. This exercise is meant to introduce fundamental DSP design in hardware through shift registers, multiply-accumulate (MAC) operations, and real-time filtering.

# Architecture Design:
The designed FIR filter is a 4-tap filter, which means it processes the current and previous three input samples to generate the output. Each input sample is multiplied by a predefined constant (called a coefficient), and the results are added together to produce the final filtered output. The filter is implemented as a synchronous design, operating on the rising edge of the clock, and is reset using an active-high reset signal.

The structure of the filter is modeled after the Direct Form-I architecture, which is a common layout for FIR filters. The coefficients are hardcoded in the design, and the input is serially fed through a shift register array. The final computation involves a multiply-accumulate logic that forms the core of the filter.

# Technical Specifications:
-> Input Width: 8-bit signed

-> Output Width: 16-bit signed

-> Number of Taps: 4

-> Coefficients Used: {1, 2, 3, 4}

-> Clocked Architecture: Edge-triggered logic with pipeline-style shift register

-> Reset Type: Synchronous, active-high

# Implementation Environment:
HDL Language: Verilog

Development Tool: Xilinx Vivado (Simulator and Editor)

Simulation Timescale: 1 ns / 1 ps

Simulation Control: $monitor, #delay, and waveform dump ($dumpfile, $dumpvars) for post-analysis

Clock Period: 10 ns (generated using always #5 clk = ~clk)

# Key Learning Outcomes:
@ Digital Filtering Concepts:
Understood how FIR filters suppress or emphasize certain frequency components of a signal by weighted summation.

@ Shift Register Design:
Implemented a serial-in parallel-access 4-stage register using basic Verilog constructs.

@ MAC Unit Operation:
Designed and tested a multiply-accumulate structure in hardware, which is foundational in DSP processors.

@ Testbench Development:
Constructed a comprehensive testbench to validate functionality by applying a sequence of inputs and observing corresponding outputs.

@ Timing and Simulation:
Practiced accurate simulation timing and debugging using Vivado's simulation waveform viewer and console outputs.

# Practical Applications of FIR Filters:

1. Image Processing: Edge smoothing, sharpening, and feature detection use FIR filtering.

2. Communication Systems: Band-limiting filters in transmitters and receivers to eliminate out-of-band noise.

3. Biomedical Devices: Filtering ECG/EEG signals to remove muscle artifacts or power-line interference.

4. Seismic Data Analysis: Enhancing signal-to-noise ratio for accurate geological interpretation.

5. Audio and Speech Processing: FIR filters are used to remove noise or enhance certain sound frequencies.

# Design Advantages:
> Stability: FIR filters are always stable due to no feedback in design.

> Linear Phase: This filter maintains phase alignment of frequency components, making it suitable for applications where phase distortion is unacceptable.

> Simplicity: Easy to implement in hardware since it doesn’t require recursive computations.

> Scalability: Can be easily extended to more taps or variable coefficients.

# Possible Extensions:
Make coefficients programmable using memory-mapped registers.

Implement a coefficient loading mechanism via AXI or wishbone bus.

Extend design for real-time filtering with streaming ADC data.

Convert the FIR filter to a low-pass or high-pass configuration using digital design tools like MATLAB or Python for coefficient generation.

# Conclusion:
This task successfully demonstrated the real-time behavior of a basic FIR filter using Verilog and Xilinx Vivado. It connected theoretical DSP knowledge to practical digital hardware design. The project served as a stepping stone toward more complex signal processing cores and highlighted how Verilog can model even sophisticated numerical computations like filtering in an efficient and scalable way. Understanding FIR filter implementation in RTL also enhances the capability to work in domains like DSP hardware acceleration, FPGA-based signal conditioning, and embedded communication systems.

# Schematic & outputwaveforms
![Image](https://github.com/user-attachments/assets/afd93c46-60ce-4fe1-9794-1c2e5c26e011)
![Image](https://github.com/user-attachments/assets/bdb702a3-c24c-4a8c-861f-e706019aaf40)
