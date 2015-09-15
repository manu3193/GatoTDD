`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:49:26 09/14/2015
// Design Name:   Controlador_Gato
// Module Name:   C:/Users/Arturo/Desktop/Proyecto Corto 1 14Set/Gato/Pruebas_Controlador_Gato.v
// Project Name:  Gato
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Controlador_Gato
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Pruebas_Controlador_Gato;

	// Inputs
	reg clk;
	reg reset_all;
	reg reset_game;
	reg boton_arriba_reg;
	reg boton_abajo_reg;
	reg boton_izq_reg;
	reg boton_der_reg;
	reg boton_elige_reg;

	// Outputs
	wire [3:0] cuadro;
	wire [3:0] circulo;
	wire [3:0] equis;
	wire [1:0] vertical;
	wire [1:0] horizontal;
	wire [1:0] cruzada;
	wire [2:0] state;
	wire turno_p1_wire;
	wire turno_p2_wire;
	wire win_game;
	wire loss_game;
	wire tie_game;

	// Instantiate the Unit Under Test (UUT)
	Controlador_Gato uut (
		.clk(clk), 
		.reset_all(reset_all), 
		.reset_game(reset_game), 
		.cuadro(cuadro), 
		.circulo(circulo), 
		.equis(equis), 
		.vertical(vertical), 
		.horizontal(horizontal), 
		.cruzada(cruzada), 
		.state(state), 
		.boton_arriba_reg(boton_arriba_reg), 
		.boton_abajo_reg(boton_abajo_reg), 
		.boton_izq_reg(boton_izq_reg), 
		.boton_der_reg(boton_der_reg), 
		.boton_elige_reg(boton_elige_reg), 
		.turno_p1_wire(turno_p1_wire), 
		.turno_p2_wire(turno_p2_wire), 
		.win_game(win_game), 
		.loss_game(loss_game), 
		.tie_game(tie_game)
	);
	
	always
		#5 clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 0;
		reset_all = 0;
		reset_game = 0;
		boton_arriba_reg = 0;
		boton_abajo_reg = 0;
		boton_izq_reg = 0;
		boton_der_reg = 0;
		boton_elige_reg = 0;

		#10;
		boton_arriba_reg = 0;
		boton_abajo_reg = 1;
		boton_izq_reg = 0;
		boton_der_reg = 0;
		boton_elige_reg = 0;
		
		#10;
		boton_arriba_reg = 0;
		boton_abajo_reg = 0;
		boton_izq_reg = 1;
		boton_der_reg = 0;
		boton_elige_reg = 0;
		
		#10;
		boton_arriba_reg = 0;
		boton_abajo_reg = 0;
		boton_izq_reg = 0;
		boton_der_reg = 0;
		boton_elige_reg = 1;
		
		#10;
		boton_arriba_reg = 0;
		boton_abajo_reg = 0;
		boton_izq_reg = 0;
		boton_der_reg = 1;
		boton_elige_reg = 0;
		
		#10;
		boton_arriba_reg = 1;
		boton_abajo_reg = 0;
		boton_izq_reg = 0;
		boton_der_reg = 0;
		boton_elige_reg = 0;
		
		#10;
		boton_arriba_reg = 0;
		boton_abajo_reg = 0;
		boton_izq_reg = 0;
		boton_der_reg = 0;
		boton_elige_reg = 1;
		
		#10;
		boton_arriba_reg = 0;
		boton_abajo_reg = 1;
		boton_izq_reg = 0;
		boton_der_reg = 0;
		boton_elige_reg = 0;
		
		#10;
		boton_arriba_reg = 0;
		boton_abajo_reg = 0;
		boton_izq_reg = 0;
		boton_der_reg = 0;
		boton_elige_reg = 1;
		
		#10;
		boton_arriba_reg = 1;
		boton_abajo_reg = 0;
		boton_izq_reg = 0;
		boton_der_reg = 0;
		boton_elige_reg = 0;
		
		#10;
		boton_arriba_reg = 0;
		boton_abajo_reg = 0;
		boton_izq_reg = 0;
		boton_der_reg = 0;
		boton_elige_reg = 0;
		
		#10;
		boton_arriba_reg = 1;
		boton_abajo_reg = 0;
		boton_izq_reg = 0;
		boton_der_reg = 0;
		boton_elige_reg = 0;
		
		#10;
		boton_arriba_reg = 0;
		boton_abajo_reg = 0;
		boton_izq_reg = 0;
		boton_der_reg = 0;
		boton_elige_reg = 1;
		
		#10;
		boton_arriba_reg = 0;
		boton_abajo_reg = 1;
		boton_izq_reg = 0;
		boton_der_reg = 0;
		boton_elige_reg = 0;
		
		#10;
		boton_arriba_reg = 0;
		boton_abajo_reg = 0;
		boton_izq_reg = 0;
		boton_der_reg = 1;
		boton_elige_reg = 0;
		
		#10;
		boton_arriba_reg = 0;
		boton_abajo_reg = 1;
		boton_izq_reg = 0;
		boton_der_reg = 0;
		boton_elige_reg = 0;
		
		#10;
		boton_arriba_reg = 0;
		boton_abajo_reg = 0;
		boton_izq_reg = 0;
		boton_der_reg = 0;
		boton_elige_reg = 1;
		
		#10;
		boton_arriba_reg = 0;
		boton_abajo_reg = 0;
		boton_izq_reg = 0;
		boton_der_reg = 0;
		boton_elige_reg = 0;

	end
      
endmodule

