`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:43:12 09/20/2015 
// Design Name: 
// Module Name:    Sync_test 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Sync_test( _clk_in, Botones_in, Botones_out);

	input _clk_in;
	input[4:0] Botones_in;
	output[4:0] Botones_out;
	
	Sincronizador test(
	._clk_(_clk_in),
	.boton_arriba_in(Botones_in[0]),
	.boton_abajo_in(Botones_in[1]),
	.boton_izq_in(Botones_in[2]),
	.boton_der_in(Botones_in[3]),
	.boton_elige_in(Botones_in[4]),
	.boton_arriba_out(Botones_out[0]),
	.boton_abajo_out(Botones_out[1]),
	.boton_izq_out(Botones_out[2]),
	.boton_der_out(Botones_out[3]),
	.boton_elige_out(Botones_out[4]));


endmodule
