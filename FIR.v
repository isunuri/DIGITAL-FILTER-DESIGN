module fir_filter (
    input clk,                            // Clock input
    input rst,                            // Asynchronous reset
    input signed [7:0] x_in,              // 8-bit signed input sample
    output reg signed [15:0] y_out        // 16-bit signed output (filter result)
);

    // Filter Coefficients (Fixed values for this example)
    localparam signed [7:0] h0 = 8'd1;    // Coefficient for x[n]
    localparam signed [7:0] h1 = 8'd2;    // Coefficient for x[n-1]
    localparam signed [7:0] h2 = 8'd3;    // Coefficient for x[n-2]
    localparam signed [7:0] h3 = 8'd4;    // Coefficient for x[n-3]

    reg signed [7:0] x[0:3];              // 4-sample shift register for input data
    integer i;                            // Loop variable

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            // On reset, clear all input samples and output
            for (i = 0; i < 4; i = i + 1)
                x[i] <= 0;
            y_out <= 0;
        end else begin
            // Shift previous samples
            x[3] <= x[2];                 // x[n-3] <= x[n-2]
            x[2] <= x[1];                 // x[n-2] <= x[n-1]
            x[1] <= x[0];                 // x[n-1] <= x[n]
            x[0] <= x_in;                 // x[n] <= new input

            // Compute FIR filter output using MAC (Multiply-Accumulate)
            y_out <= x[0]*h0 + x[1]*h1 + x[2]*h2 + x[3]*h3;
        end
    end
endmodule


module tb_fir_filter;
    // Declare simulation signals
    reg clk;
    reg rst;
    reg signed [7:0] x_in;
    wire signed [15:0] y_out;

    // Instantiate the FIR filter
    fir_filter uut (.clk(clk),.rst(rst),.x_in(x_in),.y_out(y_out) );
    // Clock generation: toggles every 5 ns to create 10 ns period
    always #5 clk = ~clk;

    initial begin
        // Initialize signals
        clk = 0;
        rst = 1;
        x_in = 0;

        // Hold reset for 10 ns
        #10 rst = 0;

        // Apply input samples (can be modified to test different inputs)
        #10 x_in = 8'd1;
        #10 x_in = 8'd2;
        #10 x_in = 8'd3;
        #10 x_in = 8'd4;
        #10 x_in = 8'd0;
        #10 x_in = 8'd1;
        #10 x_in = 8'd0;
        #10 x_in = 8'd0;

        // Allow time for final outputs
        #50 $finish; // End simulation
    end

    // Print output and input values at each time step
    initial begin
        $monitor("Time=%0t | x_in=%d | y_out=%d", $time, x_in, y_out);
    end

endmodule

