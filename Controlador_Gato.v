`timescale 1ns / 1ps

module Controlador_Gato(
	clk,
	reset_all,
	reset_game,
	
	cuadro,
	vertical,
	horizontal, 
	cruzada,
	
	state,
	
	boton_arriba_reg, boton_abajo_reg, boton_izq_reg, boton_der_reg, boton_elige_reg,
	
	turno_p1_wire, turno_p2_wire,
	
	win_game_wire, //Gana Jugador 2
	loss_game_wire, //Gana Jugador 1
	tie_game_wire, //Juego empatado
	
	c1_out_registro,
	c2_out_registro,
   c3_out_registro,
	c4_out_registro,
	c5_out_registro,
	c6_out_registro,
	c7_out_registro,
	c8_out_registro,
	c9_out_registro
   );
	
	input clk, reset_all, reset_game;
	
	output [2:0] state;
	
	output [3:0] cuadro;
	
	output [1:0] vertical, horizontal, cruzada;
	
	output turno_p1_wire, turno_p2_wire;
	
	output win_game_wire, loss_game_wire, tie_game_wire;
	
	wire p1_mm_wire, p2_mm_wire;
	
	wire p1_tie_wire, p1_loss_wire, p1_win_wire;
	
	wire p2_tie_wire, p2_loss_wire, p2_win_wire;
	
	wire verifica_status_wire;
	
   //reg boton_arriba_reg, boton_abajo_reg, boton_izq_reg, boton_der_reg, boton_elige_reg;
	input boton_arriba_reg, boton_abajo_reg, boton_izq_reg, boton_der_reg, boton_elige_reg;
	
	wire [1:0] 
	     c1_in_registro,
		  c2_in_registro,
		  c3_in_registro,
		  c4_in_registro,
		  c5_in_registro,
		  c6_in_registro,
		  c7_in_registro,
		  c8_in_registro,
		  c9_in_registro;
		  
	output [1:0] 
	     c1_out_registro,
		  c2_out_registro,
		  c3_out_registro,
		  c4_out_registro,
		  c5_out_registro,
		  c6_out_registro,
		  c7_out_registro,
		  c8_out_registro,
		  c9_out_registro;
	
	Gato_FSM maquina (
	
		.clk (clk),
		.reset (reset_all),
		.state (state),
		
		.p1_mm (p1_mm_wire),
		.p2_mm (p2_mm_wire),
		
		.p1_tie (p1_tie_wire),
		.p1_loss (p1_loss_wire),
		.p1_win (p1_win_wire),
		
		.p2_tie (p2_tie_wire),
		.p2_loss (p2_loss_wire),
		.p2_win (p2_win_wire),
		
		.verifica_status (verifica_status_wire),
		
		.turno_p1 (turno_p1_wire),
		.turno_p2 (turno_p2_wire),
		
		.win_game (win_game_wire),
		.loss_game (loss_game_wire),
		.tie_game (tie_game_wire)
	);
	
	Selector_Casillas selector (
		.clk (clk),
		.boton_arriba (boton_arriba_reg),
		.boton_abajo (boton_abajo_reg),
		.boton_izq (boton_izq_reg),
		.boton_der (boton_der_reg),
		.boton_elige (boton_elige_reg),
		
		.turno_p1 (turno_p1_wire),
		.turno_p2 (turno_p2_wire),
		
		.guarda_c1 (c1_in_registro),
		.guarda_c2 (c2_in_registro),
		.guarda_c3 (c3_in_registro),
		.guarda_c4 (c4_in_registro),
		.guarda_c5 (c5_in_registro),
		.guarda_c6 (c6_in_registro),
		.guarda_c7 (c7_in_registro),
		.guarda_c8 (c8_in_registro),
		.guarda_c9 (c9_in_registro),
		
		.p1_mm (p1_mm_wire),
		.p2_mm (p2_mm_wire),
		
		.cuadro (cuadro)
	);
	
	Registro_Juego registro (
		
		.clk (clk),
		.reset_in (reset_all),
		
		.c1_clear_in (reset_all),
		.c2_clear_in (reset_all),
		.c3_clear_in (reset_all),
		.c4_clear_in (reset_all),
		.c5_clear_in (reset_all),
		.c6_clear_in (reset_all),
		.c7_clear_in (reset_all),
		.c8_clear_in (reset_all),
		.c9_clear_in (reset_all),
		
		.c1_in (c1_in_registro),
		.c2_in (c2_in_registro),
		.c3_in (c3_in_registro),
		.c4_in (c4_in_registro),
		.c5_in (c5_in_registro),
		.c6_in (c6_in_registro),
		.c7_in (c7_in_registro),
		.c8_in (c8_in_registro),
		.c9_in (c9_in_registro),
		
		.c1_out (c1_out_registro),
		.c2_out (c2_out_registro),
		.c3_out (c3_out_registro),
		.c4_out (c4_out_registro),
		.c5_out (c5_out_registro),
		.c6_out (c6_out_registro),
		.c7_out (c7_out_registro),
		.c8_out (c8_out_registro),
		.c9_out (c9_out_registro)	
	);
	
	
	Verificador_gato verificador (
	
		.verifica_status (verifica_status_wire),
		
		.p1_tie (p1_tie_wire),
		.p1_loss (p1_loss_wire),
		.p1_win (p1_win_wire),
		
		.p2_tie (p2_tie_wire),
		.p2_loss (p2_loss_wire),
		.p2_win (p2_win_wire),
		
		.linea_horizontal (horizontal),
		.linea_vertical (vertical),
		.linea_cruzada (cruzada),
		
		.reg_c1 (c1_out_registro),
		.reg_c2 (c2_out_registro),
		.reg_c3 (c3_out_registro),
		.reg_c4 (c4_out_registro),
		.reg_c5 (c5_out_registro),
		.reg_c6 (c6_out_registro),
		.reg_c7 (c7_out_registro),
		.reg_c8 (c8_out_registro),
		.reg_c9 (c9_out_registro)
	);


endmodule
