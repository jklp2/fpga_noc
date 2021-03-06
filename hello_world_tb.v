/*****
**  �ļ����ƣ�hello_world_tb.v
**  �� �� �ˣ�hsp
**  �������ڣ�2017-03-05
**  ����������һ��iverilog��GTKWaveʹ�÷�ʽ���ܵ�hello world����
*****/

// synopsys translate_off
`timescale 1 ns / 1 ps
// synopsys translate_on

module hello_world_tb;
    parameter PERI = 10;

    reg clk;
    reg rst_n;

    always #(PERI/2) clk = ~clk;

    initial
    begin
        $dumpfile("hello_world_tb.vcd");
        $dumpvars(0,hello_world_tb);
        $display("hello world!");
        clk = 0;
        rst_n = 0;
        repeat(10) @(posedge clk);
        rst_n = 1;
        repeat(100) @(posedge clk);
        $finish;
    end

endmodule