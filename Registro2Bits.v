`timescale 1ns / 1ps

module Registro2Bits(
	clk,
	datos_i,
	clear_i,
	salida_o
   );
	
	input clk, clear_i;
	input [1:0] datos_i;
	output reg [1:0] salida_o;
	
	always @(posedge clk) begin
		
		if(clear_i) 
			salida_o<=2'b00;
		else 
			salida_o <= datos_i | salida_o;
	end
	

endmodule

