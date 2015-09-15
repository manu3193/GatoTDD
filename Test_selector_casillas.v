`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:53:51 09/14/2015
// Design Name:   Selector_Casillas
// Module Name:   C:/Users/Arturo/Desktop/Proyecto Corto 1 14Set/Gato/Test_selector_casillas.v
// Project Name:  Gato
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Selector_Casillas
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_selector_casillas;

	// Inputs
	reg boton_arriba;
	reg boton_abajo;
	reg boton_izq;
	reg boton_der;
	reg boton_elige;
	reg turno_p1;
	reg turno_p2;

	// Outputs
	wire [1:0] guarda_c1;
	wire [1:0] guarda_c2;
	wire [1:0] guarda_c3;
	wire [1:0] guarda_c4;
	wire [1:0] guarda_c5;
	wire [1:0] guarda_c6;
	wire [1:0] guarda_c7;
	wire [1:0] guarda_c8;
	wire [1:0] guarda_c9;
	wire p1_mm;
	wire p2_mm;
	wire [3:0] cuadro;
	wire [3:0] circulo;
	wire [3:0] equis;

	// Instantiate the Unit Under Test (UUT)
	Selector_Casillas uut (
		.boton_arriba(boton_arriba), 
		.boton_abajo(boton_abajo), 
		.boton_izq(boton_izq), 
		.boton_der(boton_der), 
		.boton_elige(boton_elige), 
		.turno_p1(turno_p1), 
		.turno_p2(turno_p2), 
		.guarda_c1(guarda_c1), 
		.guarda_c2(guarda_c2), 
		.guarda_c3(guarda_c3), 
		.guarda_c4(guarda_c4), 
		.guarda_c5(guarda_c5), 
		.guarda_c6(guarda_c6), 
		.guarda_c7(guarda_c7), 
		.guarda_c8(guarda_c8), 
		.guarda_c9(guarda_c9), 
		.p1_mm(p1_mm), 
		.p2_mm(p2_mm), 
		.cuadro(cuadro), 
		.circulo(circulo), 
		.equis(equis)
	);

	initial begin
		// Initialize Inputs
		boton_arriba = 0;
		boton_abajo = 0;
		boton_izq = 0;
		boton_der = 0;
		boton_elige = 0;
		turno_p1 = 0;
		turno_p2 = 0;

		// Wait 100 ns for global reset to finish
		#10;
		boton_arriba = 1;
		boton_abajo = 0;
		boton_izq = 0;
		boton_der = 0;
		boton_elige = 0;
		
		#10;
		boton_arriba = 0;
		boton_abajo = 1;
		boton_izq = 0;
		boton_der = 0;
		boton_elige = 0;
		
		#10;
		boton_arriba = 0;
		boton_abajo = 0;
		boton_izq = 1;
		boton_der = 0;
		boton_elige = 0;
		
		#10;
		boton_arriba = 0;
		boton_abajo = 1;
		boton_izq = 0;
		boton_der = 0;
		boton_elige = 0;
		
		#10;
		boton_arriba = 0;
		boton_abajo = 0;
		boton_izq = 0;
		boton_der = 1;
		boton_elige = 0;
		
		#10;
		boton_arriba = 0;
		boton_abajo = 0;
		boton_izq = 0;
		boton_der = 0;
		boton_elige = 0;
		
		#10;
		boton_arriba = 0;
		boton_abajo = 0;
		boton_izq = 0;
		boton_der = 1;
		boton_elige = 0;
		
		#10;
		boton_arriba = 1;
		boton_abajo = 0;
		boton_izq = 0;
		boton_der = 0;
		boton_elige = 0;
		
		#10;
		boton_arriba = 0;
		boton_abajo = 0;
		boton_izq = 0;
		boton_der = 0;
		boton_elige = 1;
		turno_p1 = 1;
		turno_p2 = 0;
		
		#10;
		boton_arriba = 0;
		boton_abajo = 0;
		boton_izq = 0;
		boton_der = 0;
		boton_elige = 0;
		turno_p1 = 0;
		turno_p2 = 0;
		
		#10;
		boton_arriba = 1;
		boton_abajo = 0;
		boton_izq = 0;
		boton_der = 0;
		boton_elige = 0;
		turno_p1 = 0;
		turno_p2 = 0;
		
		#10;
		boton_arriba = 0;
		boton_abajo = 0;
		boton_izq = 0;
		boton_der = 0;
		boton_elige = 1;
		turno_p1 = 0;
		turno_p2 = 1;
        
		// Add stimulus here

	end
      
endmodule

