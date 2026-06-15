`timescale 1ns/1ps

module tb_sequence_detector;

    reg clk;
    reg rst;
    reg din;
    wire detected;

    sequence_detector uut(
        .clk(clk),
        .rst(rst),
        .din(din),
        .detected(detected)
    );

    always #5 clk = ~clk;

    initial
    begin
        clk = 0;
        rst = 1;
        din = 0;

        #15;
        rst = 0;

        // Input Stream: 1101011011

        din = 1; #10;
        din = 1; #10;
        din = 0; #10;
        din = 1; #10;
        din = 0; #10;
        din = 1; #10;
        din = 1; #10;   // Detects 1011

        din = 0; #10;
        din = 1; #10;
        din = 1; #10;   // Detects again

        #20;

        $finish;
    end

endmodule
