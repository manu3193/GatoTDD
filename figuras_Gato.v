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
// Tool versimostrars: 
// Descriptimostrar: 
//
// Dependencies: 
//
// Revisimostrar: 
// Revisimostrar 0.01 - File Created
// Additimostraral Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module figuras_Gato(
	input wire video_mostrar, 
	input wire [3:0] entrada,
	input wire [10:0] pixel_x, pixel_y,
	output reg [2:0] salida_rgb
    );
	 
	 //Asigna un numero a cada cuadrante
	 //          |          |            // 
	 //          |          |            // 
	 //     1    |     2    |     3      // 
	 //          |          |            // 
	 //          |          |            // 
	 //----------|----------|----------  // 
	 //          |          |            // 
	 //    4     |     5    |     6      // 
	 //          |          |            // 
	 //          |          |            // 
	 //----------|----------|----------  // 
	 //          |          |            // 
	 //          |          |            // 
	 //    7     |     8    |     9      // 
	 //          |          |            // 
	 //          |          |            // 
	 
	 localparam cuadrante1 = 4'd1;
	 localparam cuadrante2 = 4'd2;
	 localparam cuadrante3 = 4'd3;
	 localparam cuadrante4 = 4'd4;
	 localparam cuadrante5 = 4'd5;
	 localparam cuadrante6 = 4'd6;
	 localparam cuadrante7 = 4'd7;
	 localparam cuadrante8 = 4'd8;
	 localparam cuadrante9 = 4'd9;
	 reg [3:0] cuadranteActual;
	
	//Color de las lineas del gato
	reg [2:0] lineaGato_rgb=3'b000;
	localparam lineaV_Y_Size=240;
	localparam lineaH_X_Size=180;
	
	//Limites Verticales
	localparam limV_Y_Sup = 120;
	localparam limV_Y_Inf= 300;
	
	//Limites Horizontales
	localparam limH_X_Izq = 160;
	localparam limH_X_Der= 400;
	
	
	//---------------------------------------
	// Linea Vertical 1
	//---------------------------------------
	localparam lineaV1_X_Der = 242;
	localparam lineaV1_X_Izq= 238;

	
	//---------------------------------------
	// Linea Vertical 2
	//---------------------------------------
	localparam lineaV2_X_Der = 322;
	localparam lineaV2_X_Izq= 318;
	
	//---------------------------------------
	// Linea Horizontal 1
	//---------------------------------------
	localparam lineaH1_Y_Sup = 178;
	localparam lineaH1_Y_Inf= 182;
	
	//---------------------------------------
	// Linea Horizontal 2
	//---------------------------------------
	localparam lineaH2_Y_Sup = 238;
	localparam lineaH2_Y_Inf= 242;;
	
	
	//--------------------------------------
	//Se;al de salida de la figura linea Vert. 1
	//--------------------------------------
	wire lineaV1_mostrar;
	
	assign lineaV1_mostrar = (lineaV1_X_Izq<=pixel_x) && (pixel_x <= lineaV1_X_Der) &&
							  (limV_Y_Sup<=pixel_y) && (pixel_y <=limV_Y_Inf);
	
	//--------------------------------------
	//Se;al de salida de la figura linea Vert. 2
	//--------------------------------------
	wire lineaV2_mostrar;
	
	
	assign lineaV2_mostrar = (lineaV2_X_Izq<=pixel_x) && (pixel_x <= lineaV2_X_Der) &&
							  (limV_Y_Sup<=pixel_y) && (pixel_y <=limV_Y_Inf);
							  

	
	
	//--------------------------------------
	//Se;al de salida de la figura linea Horiz. 1
	//--------------------------------------
	wire lineaH1_mostrar;
	
	assign lineaH1_mostrar = (lineaH1_Y_Sup<=pixel_y) && (pixel_y <= lineaH1_Y_Inf) &&
							  (limH_X_Izq<=pixel_x) && (pixel_x <= limH_X_Der);
	
	//--------------------------------------
	//Se;al de salida de la figura linea Horiz. 2
	//--------------------------------------
	wire lineaH2_mostrar;
	
	assign lineaH2_mostrar = (lineaH2_Y_Sup<=pixel_y) && (pixel_y <= lineaH2_Y_Inf) &&
							  (limH_X_Izq<=pixel_x) && (pixel_x <= limH_X_Der);
	
	//------------------------------------
	//Define los cuadros activos cmostrar los 
	//parámetros de las líneas verticales 
	//y horizmostrartales
	//------------------------------------
	
	//------------------------------------
	//Determina el cuadrante que debe 
	//mostrarse segun donde se encuentre
	//------------------------------------
	
	reg[8:0] cuadrante_mostrar;
	

	always @ (*) begin
		
		cuadranteActual= entrada;
	
		case(cuadranteActual) 
		
			cuadrante1: begin
							cuadrante_mostrar[0] = (limV_Y_Sup<=pixel_y) && (pixel_y <= lineaH1_Y_Sup) &&
																	(limH_X_Izq<=pixel_x) && (pixel_x <= lineaV1_X_Izq);
							end
			
			cuadrante2: begin
							cuadrante_mostrar[1] = (limV_Y_Sup<=pixel_y) && (pixel_y <= lineaH1_Y_Sup) &&
																	(lineaV1_X_Der<=pixel_x) && (pixel_x <= lineaV2_X_Izq);
							end
			
			cuadrante3: begin
							cuadrante_mostrar[2] = (limV_Y_Sup<=pixel_y) && (pixel_y <= lineaH1_Y_Sup) &&
																	(lineaV2_X_Der<=pixel_x) && (pixel_x <= limH_X_Der);
							end
			
			cuadrante4: begin
							cuadrante_mostrar[3] = (lineaH1_Y_Inf<=pixel_y) && (pixel_y <= lineaH2_Y_Sup) &&
																	(limH_X_Izq<=pixel_x) && (pixel_x <= lineaV1_X_Izq);
							end
			
			cuadrante5: begin
							cuadrante_mostrar[4] = (lineaH1_Y_Inf<=pixel_y) && (pixel_y <= lineaH2_Y_Sup) &&
																	(lineaV1_X_Der<=pixel_x) && (pixel_x <= lineaV2_X_Izq);
							end
			
			cuadrante6: begin
							cuadrante_mostrar[5] = (lineaH1_Y_Inf<=pixel_y) && (pixel_y <= lineaH2_Y_Sup) &&
																	(lineaV2_X_Der<=pixel_x) && (pixel_x <= limH_X_Der);
							end
			
			cuadrante7: begin
							cuadrante_mostrar[6] = (lineaH2_Y_Inf<=pixel_y) && (pixel_y <= limV_Y_Inf) &&
																	(limH_X_Izq<=pixel_x) && (pixel_x <= lineaV1_X_Izq);
							end
			
			cuadrante8: begin
							cuadrante_mostrar[4] = (lineaH2_Y_Inf<=pixel_y) && (pixel_y <= limV_Y_Inf) &&
																	(lineaV1_X_Der<=pixel_x) && (pixel_x <= lineaV2_X_Izq);
							end
			
			cuadrante9: begin
							cuadrante_mostrar[5] = (lineaH2_Y_Inf<=pixel_y) && (pixel_y <= limV_Y_Inf) &&
																	(lineaV2_X_Der<=pixel_x) && (pixel_x <= limH_X_Der);
							end
			default: 	begin
							cuadrante_mostrar= 4'b0000;			
							end
		endcase
	end
	
	
	
	//------------------------------------
	// Circuito multiplexor
	//------------------------------------
	always @ (*) begin
		if(~video_mostrar)
			salida_rgb = 3'b000; //No aparece nada en pantalla
		else if (lineaV1_mostrar||lineaV2_mostrar||lineaH1_mostrar||lineaH2_mostrar)
			salida_rgb = lineaGato_rgb;
		else if (cuadrante_mostrar[0] || cuadrante_mostrar[1] || cuadrante_mostrar[2] || 
					cuadrante_mostrar[3] || cuadrante_mostrar[4] || cuadrante_mostrar[5] || 
					cuadrante_mostrar[6] || cuadrante_mostrar[7] || cuadrante_mostrar[8])
			salida_rgb= 3'b110;
		else
			salida_rgb = 3'b111; //mostrardo gris
	end

endmodule
