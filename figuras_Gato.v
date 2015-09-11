`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:23:39 09/10/2015 
// Design Name: 
// Module Name:    figuras_Gato 
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
module figuras_Gato(
	input wire video_encendido,
	input wire [10:0] pixel_x, pixel_y,
	output reg [2:0] salida_rgb
    );
	 
	
	//Color de las l'ineas del gato
	reg [2:0] lineaGato_rgb=3'b000;
	localparam lineaV_Y_Size=240;
	localparam lineaH_X_Size=180;
	
	//---------------------------------------
	// Linea Vertical 1
	//---------------------------------------
	localparam lineaV1_X_Der = 242;
	localparam lineaV1_X_Izq= 238;
	localparam lineaV1_Y_Sup = 120;
	localparam lineaV1_Y_Inf= 300;
	
	//---------------------------------------
	// Linea Vertical 2
	//---------------------------------------
	localparam lineaV2_X_Der = 322;
	localparam lineaV2_X_Izq= 318;
	localparam lineaV2_Y_Sup = 120;
	localparam lineaV2_Y_Inf= 300;
	
	//---------------------------------------
	// Linea Horizontal 1
	//---------------------------------------
	localparam lineaH1_Y_Sup = 178;
	localparam lineaH1_Y_Inf= 182;
	localparam lineaH1_X_Izq = 160;
	localparam lineaH1_X_Der= 400;
	
	//---------------------------------------
	// Linea Horizontal 2
	//---------------------------------------
	localparam lineaH2_Y_Sup = 238;
	localparam lineaH2_Y_Inf= 242;
	localparam lineaH2_X_Izq = 160;
	localparam lineaH2_X_Der= 400;
	
	//--------------------------------------
	//Se;al de salida de la figura linea Vert. 1
	//--------------------------------------
	wire lineaV1_on;
	
	assign lineaV1_on = (lineaV1_X_Izq<=pixel_x) && (pixel_x <= lineaV1_X_Der) &&
							  (lineaV1_Y_Sup<=pixel_y) && (pixel_y <=lineaV1_Y_Inf);
	
	//--------------------------------------
	//Se;al de salida de la figura linea Vert. 2
	//--------------------------------------
	wire lineaV2_on;
	
	
	assign lineaV2_on = (lineaV2_X_Izq<=pixel_x) && (pixel_x <= lineaV2_X_Der) &&
							  (lineaV2_Y_Sup<=pixel_y) && (pixel_y <=lineaV2_Y_Inf);
							  

	
	
		//--------------------------------------
	//Se;al de salida de la figura linea Horiz. 1
	//--------------------------------------
	wire lineaH1_on;
	
	assign lineaH1_on = (lineaH1_Y_Sup<=pixel_y) && (pixel_y <= lineaH1_Y_Inf) &&
							  (lineaH1_X_Izq<=pixel_x) && (pixel_x <= lineaH1_X_Der);
	
	//--------------------------------------
	//Se;al de salida de la figura linea Horiz. 2
	//--------------------------------------
	wire lineaH2_on;
	
	assign lineaH2_on = (lineaH2_Y_Sup<=pixel_y) && (pixel_y <= lineaH2_Y_Inf) &&
							  (lineaH2_X_Izq<=pixel_x) && (pixel_x <= lineaH2_X_Der);
	
	//------------------------------------
	// Circuito multiplexor
	//------------------------------------
	always @ (*) begin
		if(~video_encendido)
			salida_rgb = 3'b000; //No aparece nada en pantalla
		else if (lineaV1_on||lineaV2_on||lineaH1_on||lineaH2_on)
			salida_rgb = lineaGato_rgb;
		else
			salida_rgb = 3'b111; //Fondo gris
	end

endmodule
