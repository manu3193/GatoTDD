`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:40:21 09/19/2015
// Design Name:   figuras_Gato
// Module Name:   /home/manzumbado/Development/HDL/Xilinx/GatoTDD/trunk/figuras_test.v
// Project Name:  GatoTDD
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: figuras_Gato
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module figuras_test;

	// Inputs
	reg video_mostrar;
	reg [3:0] entrada;
	reg [9:0] pixel_x;
	reg [9:0] pixel_y;

	// Outputs
	wire [2:0] salida_rgb;

	// Instantiate the Unit Under Test (UUT)
	figuras_Gato uut (
		.video_mostrar(video_mostrar), 
		.entrada(entrada), 
		.pixel_x(pixel_x), 
		.pixel_y(pixel_y), 
		.salida_rgb(salida_rgb)
	);

	initial begin
		// Initialize Inputs
		video_mostrar = 1;
		entrada = 0;
		pixel_x = 9'd160;
		pixel_y = 9'd120;

		// Wait 100 ns for global reset to finish
		#10;
		
        
		// Add stimulus here

	end
	
	always @ (*) begin
	#10
	pixel_x= pixel_x+1;
	#10
	pixel_x= pixel_x+1;
	#10
	pixel_x= pixel_x+1;
	#10
	pixel_x= pixel_x+1;
	#10
	pixel_x= pixel_x+1;
	#10
	pixel_x= pixel_x+1;
	#10
	pixel_x= pixel_x+1;
	#10
	pixel_x= pixel_x+1;
	#10
	pixel_x= pixel_x+1;
	#10
	pixel_x= pixel_x+1;
	#10
	pixel_x= pixel_x+1;
	#10
	pixel_x= pixel_x+1;
	#10
	pixel_x= pixel_x+1;
	#10
	pixel_x= pixel_x+1;
	#10
	pixel_x= pixel_x+1;
	#10
	pixel_x= pixel_x+1;
	#10
	pixel_x= pixel_x+1;
	#10
	pixel_x= pixel_x+1;
	#10
	pixel_x= pixel_x+1;
	#10
	pixel_x= pixel_x+1;
	#10
	pixel_x= pixel_x+1;
	#10
	pixel_x= pixel_x+1;
	#10
	pixel_x= pixel_x+1;
	#10
	pixel_x= pixel_x+1;
	#10
	pixel_x= pixel_x+1;
	#10
	pixel_x= pixel_x+1;
	#10
	pixel_x= pixel_x+1;
	#10
	pixel_x= pixel_x+1;
	end
      
endmodule

