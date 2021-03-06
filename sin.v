`timescale 1 ps/ 1 ps

module sin;
	reg clk;
	reg rst_n;
	reg [11:0] phi_inc_i;
	reg [13:0] fsin_o;
	reg [13:0] sin_rom [0:4095];
	reg [11:0] addr;
	parameter PERI = 10;
	always #(PERI/2) clk = ~clk;
	//initial $readmemh("sin_hex.txt",sin_rom);
	initial
	begin
		$dumpfile("sin.vcd");
		$dumpvars(0,sin);
		$display("sin!");
		$readmemh("sin_hex.txt",sin_rom);
		clk = 0;
		addr = 12'b000000000000;
		phi_inc_i = 12'b000000000001;
		rst_n = 1;
		
		
		//#10000000 $stop;
		
		#10000000 $finish;
	end 

	always@(posedge clk)
		if(!rst_n)
			fsin_o <= 0;
		else
			fsin_o <= sin_rom[addr];

	always@(posedge clk)
		if(!rst_n)
			addr <= 0;
		else
			addr <= addr + phi_inc_i;

endmodule

/*
module sin(
input clk,
input rst_n,
input[11:0] phi_inc_i,
output reg[13:0] fsin_o
);

	reg [13:0] sin_rom [0:4095];
	reg [11:0] addr;
	parameter PERI = 10;
	initial $readmemh("sin_hex.txt",sin_rom);


	always@(posedge clk,negedge rst_n)
		if(!rst_n)
			fsin_o <= 0;
		else
			fsin_o <= sin_rom[addr];

	always@(posedge clk,negedge rst_n)
		if(!rst_n)
			addr <= 0;
		else
			addr <= addr + phi_inc_i;

endmodule*/