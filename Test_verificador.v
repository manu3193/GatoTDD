`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:30:21 09/14/2015
// Design Name:   Verificador_gato
// Module Name:   C:/Users/Arturo/Desktop/Proyecto Corto 1 14Set/Gato/Test_verificador.v
// Project Name:  Gato
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Verificador_gato
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_verificador;

	// Inputs
	reg verifica_status;
	reg [1:0] reg_c1;
	reg [1:0] reg_c2;
	reg [1:0] reg_c3;
	reg [1:0] reg_c4;
	reg [1:0] reg_c5;
	reg [1:0] reg_c6;
	reg [1:0] reg_c7;
	reg [1:0] reg_c8;
	reg [1:0] reg_c9;

	// Outputs
	wire p1_tie;
	wire p1_loss;
	wire p1_win;
	wire p2_tie;
	wire p2_loss;
	wire p2_win;
	wire [1:0] linea_horizontal;
	wire [1:0] linea_vertical;
	wire [1:0] linea_cruzada;

	// Instantiate the Unit Under Test (UUT)
	Verificador_gato uut (
		.verifica_status(verifica_status), 
		.p1_tie(p1_tie), 
		.p1_loss(p1_loss), 
		.p1_win(p1_win), 
		.p2_tie(p2_tie), 
		.p2_loss(p2_loss), 
		.p2_win(p2_win), 
		.linea_horizontal(linea_horizontal), 
		.linea_vertical(linea_vertical), 
		.linea_cruzada(linea_cruzada), 
		.reg_c1(reg_c1), 
		.reg_c2(reg_c2), 
		.reg_c3(reg_c3), 
		.reg_c4(reg_c4), 
		.reg_c5(reg_c5), 
		.reg_c6(reg_c6), 
		.reg_c7(reg_c7), 
		.reg_c8(reg_c8), 
		.reg_c9(reg_c9)
	);

	initial begin
		// Initialize Inputs
		verifica_status = 0;
		reg_c1 = 0;
		reg_c2 = 0;
		reg_c3 = 0;
		reg_c4 = 0;
		reg_c5 = 0;
		reg_c6 = 0;
		reg_c7 = 0;
		reg_c8 = 0;
		reg_c9 = 0;

		// Wait 100 ns for global reset to finish
		#10;
		reg_c1 = 2'b11;
		reg_c2 = 2'b00;
		reg_c3 = 2'b01;
		reg_c4 = 2'b00;
		reg_c5 = 2'b11;
		reg_c6 = 2'b00;
		reg_c7 = 2'b00;
		reg_c8 = 2'b01;
		reg_c9 = 2'b11;
		
		#10;
		verifica_status = 1'b1;
		

	end
      
endmodule

