`timescale 1ns/1ps
//////////////////////////////////////////////////////////////////////////////////
//Company:
//Engineer:
//
//CreateDate:15:24:1809/10/2015
//DesignName:
//ModuleName:VGA_test
//ProjectName:
//TargetDevices:
//Toolversions:
//Description:
//
//Dependencies:
//
//Revision:
//Revision0.01-FileCreated
//AdditionalComments:
//
//////////////////////////////////////////////////////////////////////////////////
module VGA_test(
	input wire clk , reset,
	input wire [3:0] sw,
	input wire [1:0] casilla1, casilla2, casilla3, casilla4, casilla5, casilla6, casilla7, casilla8, casilla9,
	output wire hsync,vsync,
	output wire [2:0] rgb
);

	//declaraci'on de la se;al
	//reg[2:0] rgb_reg;
	wire[10:0] pix_x, pix_y;
	wire video_on;
	wire clkout;
	wire hsync_out;
	wire vsync_out;

	assign hsync = ~hsync_out;
	assign vsync = ~vsync_out;

	//Se inicializa el sincronizador VGA
	VGA_Controlador vsync_unit (
						 ._clk_(clkout),
						 ._reset_(reset),
						 .hsync(hsync_out),
						 .vsync(vsync_out),
						 .PixelX(pix_x),
						 .PixelY(pix_y),
						 .video_encendido(video_on));

	//Se inicializa el generador de graficos
	figuras_Gato graficos(
	.video_mostrar(video_on),
	.selector_entrada(sw),
	.c1_in(casilla1),
	.c2_in(casilla2),
	.c3_in(casilla3),
	.c4_in(casilla4),
	.c5_in(casilla5),
	.c6_in(casilla6),
	.c7_in(casilla7),
	.c8_in(casilla8),
	.c9_in(casilla9),
	.pixel_x(pix_x),
	.pixel_y(pix_y),
	.salida_rgb(rgb)
	);
			
	//Salida RGB
	//assign rgb=rgb_reg;

	//Reloj de 25Mhz
	CLK_25Mhz clock25 (.CLK_IN(clk),	.CLK_OUT(clkout));


endmodule
