`timescale 1ns / 1ps

module TopModule_tb;

    // Testbench Signals
    reg slow_clk;       // Slow clock signal for simulation
    reg reset;          // Reset signal
    wire [31:0] view;   // Output view signal for inspection

    // Instantiate the TopModule
    TopModule uut (
        .slow_clk(slow_clk),
        .reset(reset),
        .view(view)
    );

    // Clock generation for slow_clk (50MHz / 10 for slow simulation)
    initial begin
        slow_clk = 0;
        forever #10 slow_clk = ~slow_clk; // 20ns period -> 50MHz clock
    end

    // Test procedure
    initial begin
        // Initialize reset
        reset = 1;
        #200; // Hold reset for 100ns

        // Release reset and start test
        reset = 0;
        
        // Wait for a few clock cycles to allow the system to stabilize
        #200;

        // Apply test cases (if specific instruction/data are needed, mock specific input here)
        // For example, force specific values on the `instruction` memory
        // but this depends on the internal behavior of submodules and design requirements

        // Run the simulation for some time to observe output
        #100;
        // Additional test cases can be implemented here as needed

        $stop;
    end

    // Monitor view output for debugging
    initial begin
        $monitor("Time: %0dns, view = %h", $time, view);
    end

endmodule
