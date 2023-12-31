`default_nettype none
`timescale 1 ns / 10 ps

module sha_padder_tb;
	logic [511:0] padded;
	logic [23:0] message;
	logic [511:0] data;

	int fp;
	sha_padder uut (.message(message), .padded(padded));

	initial begin
    	$dumpfile("sha_padder_tb.vcd");
    	$dumpvars;
	fb = $fopen("refyfx.seed","r+");
	$fscanf(fb,"%h",data);
	$display("%x", data);
    	assign message = 24'b011000010110001001100011;
    	#5;
    	$display("FINISHED block_tb");
    	$finish;
	end
endmodule
