`timescale 1ns/1ps
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
	input wire [9:0] pixel_x, pixel_y,
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
	 reg [3:0] cuadranteEquis;
	
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
	//Determina el cuadro que debe 
	//mostrarse segun el cuadrante donde se encuentre
	//------------------------------------
	
	reg[8:0] cuadro_mostrar;
	

	always @ (*) begin
		
		cuadranteActual= entrada;
	
		case(cuadranteActual) 
		
			cuadrante1: begin
							cuadro_mostrar[0] = (limV_Y_Sup<=pixel_y) && (pixel_y <= lineaH1_Y_Sup) &&
																	(limH_X_Izq<=pixel_x) && (pixel_x <= lineaV1_X_Izq);
							end
			
			cuadrante2: begin
							cuadro_mostrar[1] = (limV_Y_Sup<=pixel_y) && (pixel_y <= lineaH1_Y_Sup) &&
																	(lineaV1_X_Der<=pixel_x) && (pixel_x <= lineaV2_X_Izq);
							end
			
			cuadrante3: begin
							cuadro_mostrar[2] = (limV_Y_Sup<=pixel_y) && (pixel_y <= lineaH1_Y_Sup) &&
																	(lineaV2_X_Der<=pixel_x) && (pixel_x <= limH_X_Der);
							end
			
			cuadrante4: begin
							cuadro_mostrar[3] = (lineaH1_Y_Inf<=pixel_y) && (pixel_y <= lineaH2_Y_Sup) &&
																	(limH_X_Izq<=pixel_x) && (pixel_x <= lineaV1_X_Izq);
							end
			
			cuadrante5: begin
							cuadro_mostrar[4] = (lineaH1_Y_Inf<=pixel_y) && (pixel_y <= lineaH2_Y_Sup) &&
																	(lineaV1_X_Der<=pixel_x) && (pixel_x <= lineaV2_X_Izq);
							end
			
			cuadrante6: begin
							cuadro_mostrar[5] = (lineaH1_Y_Inf<=pixel_y) && (pixel_y <= lineaH2_Y_Sup) &&
																	(lineaV2_X_Der<=pixel_x) && (pixel_x <= limH_X_Der);
							end
			
			cuadrante7: begin
							cuadro_mostrar[6] = (lineaH2_Y_Inf<=pixel_y) && (pixel_y <= limV_Y_Inf) &&
																	(limH_X_Izq<=pixel_x) && (pixel_x <= lineaV1_X_Izq);
							end
			
			cuadrante8: begin
							cuadro_mostrar[7] = (lineaH2_Y_Inf<=pixel_y) && (pixel_y <= limV_Y_Inf) &&
																	(lineaV1_X_Der<=pixel_x) && (pixel_x <= lineaV2_X_Izq);
							end
			
			cuadrante9: begin
							cuadro_mostrar[8] = (lineaH2_Y_Inf<=pixel_y) && (pixel_y <= limV_Y_Inf) &&
																	(lineaV2_X_Der<=pixel_x) && (pixel_x <= limH_X_Der);
							end
			default: 	begin
							cuadro_mostrar= 4'b0000;			
							end
		endcase
	end
	
	
	//-------------------------------------
	//Determina la forma de una equis
	//-------------------------------------
	reg[8:0] equis_mostrar;
	reg [3:0] rom_equis_addr;
	reg [17:0] rom_equis_data;

	//ROM que describe la imagen de la equis
	always @ (*) begin
		case (rom_equis_addr)
			4'd0:
				rom_equis_data = 18'b000000000000000000;
			4'd1:
				rom_equis_data = 18'b000000000000000000;
			4'd2:
				rom_equis_data = 18'b001100000000000110;
			4'd3:
				rom_equis_data = 18'b001110000000001110;
			4'd4:
				rom_equis_data = 18'b000111100000111100;
			4'd5:
				rom_equis_data = 18'b000001111011110000;
			4'd6:
				rom_equis_data = 18'b000000011111000000;
			4'd7:
				rom_equis_data = 18'b000000001110000000;
			4'd8:
				rom_equis_data = 18'b000000011111000000;
			4'd9:
				rom_equis_data = 18'b000001111011110000;
			4'd10:
				rom_equis_data = 18'b000111100000111100;
			4'd11:
				rom_equis_data = 18'b001110000000001110;
			4'd12:
				rom_equis_data = 18'b001100000000000110;
			4'd13:
				rom_equis_data = 18'b000000000000000000;
			4'd14:
				rom_equis_data = 18'b000000000000000000;

		endcase
	end
	
	//-------------------------------------
	//Determina en qué cuadrante mostrar la equis
	//según señal de entrada desde la FSM
	//-------------------------------------
	reg[3:0] rom_equis_col;
	reg[3:0] temp;
	reg rom_equis_bit;
	reg cuadrante_on;
	
	always @ (*) begin
	
		//temp=entrada;
		
		case(temp)
			cuadrante1: begin
							cuadrante_on = (limV_Y_Sup<=pixel_y) && (pixel_y <= lineaH1_Y_Sup) &&
												(limH_X_Izq<=pixel_x) && (pixel_x <= lineaV1_X_Izq-14);
							rom_equis_addr = pixel_y[6:2] - limV_Y_Sup[6:2];
							rom_equis_col = pixel_x[6:2] - limH_X_Izq[6:2];
							rom_equis_bit = rom_equis_data[rom_equis_col];
							equis_mostrar[0]= cuadrante_on & rom_equis_bit;
							end
			
			cuadrante2: begin
							cuadrante_on = (limV_Y_Sup<=pixel_y) && (pixel_y <= lineaH1_Y_Sup) &&
												(lineaV1_X_Der<=pixel_x) && (pixel_x <= lineaV2_X_Izq-14);
							rom_equis_addr = pixel_y[5:2] - limV_Y_Sup[5:2];
							rom_equis_col = pixel_x[5:2] - lineaV1_X_Der[5:2];
							rom_equis_bit = rom_equis_data[rom_equis_col];
							equis_mostrar[1]= cuadrante_on & rom_equis_bit;
							end
			
			cuadrante3: begin
							cuadrante_on = (limV_Y_Sup<=pixel_y) && (pixel_y <= lineaH1_Y_Sup) &&
												(lineaV2_X_Der<=pixel_x) && (pixel_x <= limH_X_Der-16);
							rom_equis_addr = pixel_y[5:2] - limV_Y_Sup[5:2];
							rom_equis_col = pixel_x[5:2] - lineaV2_X_Der[5:2];
							rom_equis_bit = rom_equis_data[rom_equis_col];
							equis_mostrar[2]= cuadrante_on & rom_equis_bit;
							end
			
			cuadrante4: begin
							cuadrante_on = (lineaH1_Y_Inf<=pixel_y) && (pixel_y <= lineaH2_Y_Sup) &&
												(limH_X_Izq<=pixel_x) && (pixel_x <= lineaV1_X_Izq-14);
							rom_equis_addr = pixel_y[5:2] - lineaH1_Y_Inf[5:2];
							rom_equis_col = pixel_x[5:2] - limH_X_Izq[5:2];
							rom_equis_bit = rom_equis_data[rom_equis_col];
							equis_mostrar[3]= cuadrante_on & rom_equis_bit;
							end
			
			cuadrante5: begin
							cuadrante_on = (lineaH1_Y_Inf<=pixel_y) && (pixel_y <= lineaH2_Y_Sup) &&
												(lineaV1_X_Der<=pixel_x) && (pixel_x <= lineaV2_X_Izq-14);
							rom_equis_addr = pixel_y[5:2] - lineaH1_Y_Inf[5:2];
							rom_equis_col = pixel_x[5:2] - lineaV1_X_Der[5:2];
							rom_equis_bit = rom_equis_data[rom_equis_col];
							equis_mostrar[4]= cuadrante_on & rom_equis_bit;
							end
			
			cuadrante6: begin
							cuadrante_on = (lineaH1_Y_Inf<=pixel_y) && (pixel_y <= lineaH2_Y_Sup) &&
												(lineaV2_X_Der<=pixel_x) && (pixel_x <= limH_X_Der-16);
							rom_equis_addr = pixel_y[5:2] - lineaH1_Y_Inf[5:2];
							rom_equis_col = pixel_x[5:2] - lineaV2_X_Der[5:2];
							rom_equis_bit = rom_equis_data[rom_equis_col];
							equis_mostrar[5]= cuadrante_on & rom_equis_bit;
							end
			
			cuadrante7: begin
							cuadrante_on = (lineaH2_Y_Inf<=pixel_y) && (pixel_y <= limV_Y_Inf) &&
												(limH_X_Izq<=pixel_x) && (pixel_x <= lineaV1_X_Izq-14);
							rom_equis_addr = pixel_y[5:2] - lineaH2_Y_Inf[5:2];
							rom_equis_col = pixel_x[5:2] - limH_X_Izq[5:2];
							rom_equis_bit = rom_equis_data[rom_equis_col];
							equis_mostrar[6]= cuadrante_on & rom_equis_bit;
							end
			
			cuadrante8: begin
							cuadrante_on = (lineaH2_Y_Inf<=pixel_y) && (pixel_y <= limV_Y_Inf) &&
												(lineaV1_X_Der<=pixel_x) && (pixel_x <= lineaV2_X_Izq-14);
							rom_equis_addr = pixel_y[5:2] - lineaH2_Y_Inf[5:2];
							rom_equis_col = pixel_x[5:2] - lineaV1_X_Der[5:2];
							rom_equis_bit = rom_equis_data[rom_equis_col];
							equis_mostrar[7]= cuadrante_on & rom_equis_bit;
							end
			
			cuadrante9: begin
							cuadrante_on = (lineaH2_Y_Inf<=pixel_y) && (pixel_y <= limV_Y_Inf) &&
												(lineaV2_X_Der<=pixel_x) && (pixel_x <= limH_X_Der-16);
							rom_equis_addr = pixel_y[5:2] - lineaH2_Y_Inf[5:2];
							rom_equis_col = pixel_x[5:2] - lineaV2_X_Der[5:2];
							rom_equis_bit = rom_equis_data[rom_equis_col];
							equis_mostrar[8]= cuadrante_on & rom_equis_bit;
							end
			default: 	begin
							equis_mostrar= 8'b00000000;			
							end
			
		endcase
		
	end
	
	
	//-------------------------------------
	//Determina la forma de un círculo
	//-------------------------------------
	reg[8:0] circulo_mostrar;
	reg [3:0] rom_circulo_addr;
	reg [17:0] rom_circulo_data;

	//ROM que describe la imagen de la equis
	always @ (*) begin
		case (rom_circulo_addr)
			4'd0:
				rom_circulo_data = 18'b000000000000000000;
			4'd1:
				rom_circulo_data = 18'b000000000000000000;
			4'd2:
				rom_circulo_data = 18'b000000111111100000;
			4'd3:
				rom_circulo_data = 18'b000001000000010000;
			4'd4:
				rom_circulo_data = 18'b000110000000001100;
			4'd5:
				rom_circulo_data = 18'b000100000000000100;
			4'd6:
				rom_circulo_data = 18'b001000000000000010;
			4'd7:
				rom_circulo_data = 18'b001000000000000010;
			4'd8:
				rom_circulo_data = 18'b001000000000000010;
			4'd9:
				rom_circulo_data = 18'b000100000000000100;
			4'd10:
				rom_circulo_data = 18'b000110000000001100;
			4'd11:
				rom_circulo_data = 18'b000001000000010000;
			4'd12:
				rom_circulo_data = 18'b000000111111100000;
			4'd13:
				rom_circulo_data = 18'b000000000000000000;
			4'd14:
				rom_circulo_data = 18'b000000000000000000;

		endcase
	end
	
	//-------------------------------------
	//Determina en qué cuadrante mostrar el círculo
	//según señal de entrada desde la FSM
	//-------------------------------------
	reg[3:0] rom_circulo_col;
	reg[3:0] temp1;
	reg rom_circulo_bit;
	reg cuadrante_circ_on;
	
	always @ (*) begin
	
		temp1 = entrada;
		
		case(temp1)
			cuadrante1: begin
							cuadrante_circ_on = (limV_Y_Sup<=pixel_y) && (pixel_y <= lineaH1_Y_Sup) &&
												     (limH_X_Izq<=pixel_x) && (pixel_x <= lineaV1_X_Izq-14);
							rom_circulo_addr = pixel_y[6:2] - limV_Y_Sup[6:2];
							rom_circulo_col = pixel_x[6:2] - limH_X_Izq[6:2];
							rom_circulo_bit = rom_circulo_data[rom_circulo_col];
							circulo_mostrar[0]= cuadrante_circ_on & rom_circulo_bit;
							end
			
			cuadrante2: begin
							cuadrante_circ_on = (limV_Y_Sup<=pixel_y) && (pixel_y <= lineaH1_Y_Sup) &&
												(lineaV1_X_Der<=pixel_x) && (pixel_x <= lineaV2_X_Izq-14);
							rom_circulo_addr = pixel_y[5:2] - limV_Y_Sup[5:2];
							rom_circulo_col = pixel_x[5:2] - lineaV1_X_Der[5:2];
							rom_circulo_bit = rom_circulo_data[rom_circulo_col];
							circulo_mostrar[1]= cuadrante_circ_on & rom_circulo_bit;
							end
			
			cuadrante3: begin
							cuadrante_circ_on = (limV_Y_Sup<=pixel_y) && (pixel_y <= lineaH1_Y_Sup) &&
												(lineaV2_X_Der<=pixel_x) && (pixel_x <= limH_X_Der-16);
							rom_circulo_addr = pixel_y[5:2] - limV_Y_Sup[5:2];
							rom_circulo_col = pixel_x[5:2] - lineaV2_X_Der[5:2];
							rom_circulo_bit = rom_circulo_data[rom_circulo_col];
							circulo_mostrar[2]= cuadrante_circ_on & rom_circulo_bit;
							end
			
			cuadrante4: begin
							cuadrante_circ_on = (lineaH1_Y_Inf<=pixel_y) && (pixel_y <= lineaH2_Y_Sup) &&
												(limH_X_Izq<=pixel_x) && (pixel_x <= lineaV1_X_Izq-14);
							rom_circulo_addr = pixel_y[5:2] - lineaH1_Y_Inf[5:2];
							rom_circulo_col = pixel_x[5:2] - limH_X_Izq[5:2];
							rom_circulo_bit = rom_circulo_data[rom_circulo_col];
							circulo_mostrar[3]= cuadrante_circ_on & rom_circulo_bit;
							end
			
			cuadrante5: begin
							cuadrante_circ_on = (lineaH1_Y_Inf<=pixel_y) && (pixel_y <= lineaH2_Y_Sup) &&
												(lineaV1_X_Der<=pixel_x) && (pixel_x <= lineaV2_X_Izq-14);
							rom_circulo_addr = pixel_y[5:2] - lineaH1_Y_Inf[5:2];
							rom_circulo_col = pixel_x[5:2] - lineaV1_X_Der[5:2];
							rom_circulo_bit = rom_circulo_data[rom_circulo_col];
							circulo_mostrar[4]= cuadrante_circ_on & rom_circulo_bit;
							end
			
			cuadrante6: begin
							cuadrante_circ_on = (lineaH1_Y_Inf<=pixel_y) && (pixel_y <= lineaH2_Y_Sup) &&
												(lineaV2_X_Der<=pixel_x) && (pixel_x <= limH_X_Der-16);
							rom_circulo_addr = pixel_y[5:2] - lineaH1_Y_Inf[5:2];
							rom_circulo_col = pixel_x[5:2] - lineaV2_X_Der[5:2];
							rom_circulo_bit = rom_circulo_data[rom_circulo_col];
							circulo_mostrar[5]= cuadrante_circ_on & rom_circulo_bit;
							end
			
			cuadrante7: begin
							cuadrante_circ_on = (lineaH2_Y_Inf<=pixel_y) && (pixel_y <= limV_Y_Inf) &&
												(limH_X_Izq<=pixel_x) && (pixel_x <= lineaV1_X_Izq-14);
							rom_circulo_addr = pixel_y[5:2] - lineaH2_Y_Inf[5:2];
							rom_circulo_col = pixel_x[5:2] - limH_X_Izq[5:2];
							rom_circulo_bit = rom_circulo_data[rom_circulo_col];
							circulo_mostrar[6]= cuadrante_circ_on & rom_circulo_bit;
							end
			
			cuadrante8: begin
							cuadrante_circ_on = (lineaH2_Y_Inf<=pixel_y) && (pixel_y <= limV_Y_Inf) &&
												(lineaV1_X_Der<=pixel_x) && (pixel_x <= lineaV2_X_Izq-14);
							rom_circulo_addr = pixel_y[5:2] - lineaH2_Y_Inf[5:2];
							rom_circulo_col = pixel_x[5:2] - lineaV1_X_Der[5:2];
							rom_circulo_bit = rom_circulo_data[rom_circulo_col];
							circulo_mostrar[7]= cuadrante_circ_on & rom_circulo_bit;
							end
			
			cuadrante9: begin
							cuadrante_circ_on = (lineaH2_Y_Inf<=pixel_y) && (pixel_y <= limV_Y_Inf) &&
												(lineaV2_X_Der<=pixel_x) && (pixel_x <= limH_X_Der-16);
							rom_circulo_addr = pixel_y[5:2] - lineaH2_Y_Inf[5:2];
							rom_circulo_col = pixel_x[5:2] - lineaV2_X_Der[5:2];
							rom_circulo_bit = rom_circulo_data[rom_circulo_col];
							circulo_mostrar[8]= cuadrante_circ_on & rom_circulo_bit;
							end
			default: 	begin
							circulo_mostrar= 8'b00000000;			
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
		else if (equis_mostrar[0] || equis_mostrar[1] || equis_mostrar[2] || 
					equis_mostrar[3] || equis_mostrar[4] || equis_mostrar[5] || 
					equis_mostrar[6] || equis_mostrar[7] || equis_mostrar[8])
			salida_rgb= 3'b000;
		else if (circulo_mostrar[0] || circulo_mostrar[1] || circulo_mostrar[2] || 
					circulo_mostrar[3] || circulo_mostrar[4] || circulo_mostrar[5] || 
					circulo_mostrar[6] || circulo_mostrar[7] || circulo_mostrar[8])
			salida_rgb= 3'b000;
		else if (cuadro_mostrar[0] || cuadro_mostrar[1] || cuadro_mostrar[2] || 
					cuadro_mostrar[3] || cuadro_mostrar[4] || cuadro_mostrar[5] || 
					cuadro_mostrar[6] || cuadro_mostrar[7] || cuadro_mostrar[8])
			salida_rgb= 3'b110;
		else
			salida_rgb = 3'b111; //mostrardo gris
	end

endmodule
