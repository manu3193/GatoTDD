`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:26:59 09/20/2015 
// Design Name: 
// Module Name:    Gato_Top 
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
module Gato_Top(
	input  clk , reset_all, //Entradas de reloj y reset
	input reset_game,       //Resetea el juego
	input boton_arriba,     //Botones
	input boton_abajo,
	input boton_izq,
	input boton_der,
	input boton_elige,
	output  hsync,vsync,    //Salidas VGA
	output  [2:0] rgb       //Salidas VGA
    );
	 
	 //Reloj del sincronizador, FSM y demas modulos
	 wire clk_sys;
	 
	//Cables para conectar modulos
	wire [3:0] cuadro;
	wire [1:0] vertical;
	wire [1:0] horizontal;
	wire [1:0] cruzada;
	wire [2:0] state;
	wire turno_p1_wire;
	wire turno_p2_wire;
	wire win_game;
	wire loss_game;
	wire tie_game;
	wire [1:0] 
	     c1,
		  c2,
		  c3,
		  c4,
		  c5,
		  c6,
		  c7,
		  c8,
		  c9;
	//Se;ales de botones sincronizadas
	wire boton_arriba_sync;    
	wire boton_abajo_sync;
	wire boton_izq_sync;
	wire boton_der_sync;
	wire boton_elige_sync;
	
	//Cables de modulo VGA
	wire[10:0] pix_x, pix_y;
	wire video_on;
	wire clk_VGA;
	wire hsync_out;
	wire vsync_out;

	assign hsync = ~hsync_out;
	assign vsync = ~vsync_out;
	
	Sincronizador debouncer (
	._clk_(clk_sys), 
	.boton_arriba_in(boton_arriba), 
	.boton_abajo_in(boton_abajo), 
	.boton_izq_in(boton_izq), 
	.boton_der_in(boton_der), 
	.boton_elige_in(boton_elige),
	.boton_arriba_out(boton_arriba_sync), 
	.boton_abajo_out(boton_abajo_sync), 
	.boton_izq_out(boton_izq_sync), 
	.boton_der_out(boton_der_sync), 
	.boton_elige_out(boton_elige_sync)
	);
	
	Controlador_Gato controlador_juego (
		.clk(clk_sys), 
		.reset_all(reset_all), 
		.reset_game(reset_game), 
		.cuadro(cuadro), 
		.vertical(vertical), 
		.horizontal(horizontal), 
		.cruzada(cruzada), 
		.state(state), 
		.c1_out_registro(c1),
		.c2_out_registro(c2),
		.c3_out_registro(c3),
		.c4_out_registro(c4),
		.c5_out_registro(c5),
		.c6_out_registro(c6),
		.c7_out_registro(c7),
		.c8_out_registro(c8),
		.c9_out_registro(c9),
		.boton_arriba_reg(boton_arriba_sync), 
		.boton_abajo_reg(boton_abajo_sync), 
		.boton_izq_reg(boton_izq_sync), 
		.boton_der_reg(boton_der_sync), 
		.boton_elige_reg(boton_elige_sync), 
		.turno_p1_wire(turno_p1_wire), 
		.turno_p2_wire(turno_p2_wire), 
		.win_game_wire(win_game), 
		.loss_game_wire(loss_game), 
		.tie_game_wire(tie_game)
	);
	

	
	//Se inicializa el sincronizador VGA
	VGA_Controlador vsync_unit (
						 ._clk_(clk_VGA),
						 ._reset_(reset),
						 .hsync(hsync_out),
						 .vsync(vsync_out),
						 .PixelX(pix_x),
						 .PixelY(pix_y),
						 .video_encendido(video_on));
						 
	//Se inicializa el generador de graficos
	figuras_Gato graficos(
	.video_mostrar(video_on),
	.selector_entrada(cuadro),
	.c1_in(c1),
	.c2_in(c2),
	.c3_in(c3),
	.c4_in(c4),
	.c5_in(c5),
	.c6_in(c6),
	.c7_in(c8),
	.c8_in(c7),
	.c9_in(c9),
	.pixel_x(pix_x),
	.pixel_y(pix_y),
	.salida_rgb(rgb)
	);



	//Reloj de 25Mhz
	CLK_25Mhz clock25 (.CLK_IN(clk),	.CLK_OUT(clk_VGA), .CLK_OUTSYS(clk_sys));
	
endmodule
