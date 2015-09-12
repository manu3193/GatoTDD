`timescale 1ns / 1ps


module Test_selector_casillas;

	// Inputs
	reg boton_arriba;
	reg boton_abajo;
	reg boton_izq;
	reg boton_der;
	reg boton_elige;
	reg turno_p1;

	// Outputs
	wire [3:0] p1_mm;
	wire [3:0] p2_mm;
	wire [3:0] cuadro;

	// Instantiate the Unit Under Test (UUT)
	Selector_Casillas uut (
		.boton_arriba(boton_arriba), 
		.boton_abajo(boton_abajo), 
		.boton_izq(boton_izq), 
		.boton_der(boton_der), 
		.boton_elige(boton_elige), 
		.turno_p1(turno_p1), 
		.p1_mm(p1_mm), 
		.p2_mm(p2_mm), 
		.cuadro(cuadro)
	);

	initial begin
		// Initialize Inputs
		boton_arriba = 0;
		boton_abajo = 0;
		boton_izq = 0;
		boton_der = 0;
		boton_elige = 0;
		turno_p1 = 0;
        
		// Add stimulus here
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
		
		#10;
		turno_p1 = 0;

	end
      
endmodule

