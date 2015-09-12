`timescale 1ns / 1ps

module Gato_FSM(
	clk,
	reset,
	state, 
	
	p1_mm,
	p2_mm,
	
	//entradas que son salidas de la otra maquina de estados
	p1_tie, 
	p1_loss,
	p1_win,
	
	p2_tie, 
	p2_loss,
	p2_win,
	
	//salidas que van hacia a otra maquina de estados
	verifica_status,
	
	turno_p1,
	
	win_game,
	tie_game,
	loss_game
	);
	
	input clk, reset;
	input p1_mm, p2_mm;
	
	input p1_tie, p1_loss, p1_win, p2_tie, p2_loss, p2_win;
	
	output reg turno_p1;
	
	output reg verifica_status;
	
	output reg win_game, tie_game, loss_game;
	
	output [1:0] state;
	reg [1:0] state, nextState;
	
	//Estados de las FSM
	parameter P1_Move = 0;
	parameter P1_Status = 1;
	parameter P2_Move = 2;
	parameter P2_Status = 3;
	parameter Win = 4;
	parameter Tie = 5;
	parameter Loss = 6;
	
	initial turno_p1 <= 1'b1;
	
	//Asignación sincrona del singuiente estado
	always @(posedge clk or negedge reset)
		begin
		if (!reset)
			state <= P1_Move;
		else
			state <= nextState;
		end
	
	//Asignacion asincrona de los estados
	always @(state)
		begin
		case(state)
			
			P1_Move:
				begin
				verifica_status <= 1'b0;
				turno_p1 <= 1'b1;
				if (!p1_mm)
					nextState = P1_Move;
				else if (p1_mm)
					nextState = P1_Status;
				end
			
			P1_Status:
				begin
				verifica_status <= 1'b1;
				if (p1_tie & !p1_loss)
					nextState = Tie;
				if (p1_win & !p1_tie)
					nextState = Loss;
				else if (!p2_mm)
					nextState = P2_Move;
				end
			
			P2_Move:
				begin
				verifica_status <= 1'b0;
				turno_p1 <= 1'b0;
				if (!p2_mm)
					nextState = P2_Move;
				else if (p2_mm)
					nextState = P2_Status;
				end
			
			P2_Status:
				begin
				verifica_status <= 1'b1;
				if (p2_tie & !p2_loss)
					nextState = Tie;
				if (p2_win & !p2_tie)
					nextState = Loss;
				else if (!p1_mm)
					nextState = P2_Move;
				end
				
			Win:
				begin
				win_game = 1'b1;
				end
				
			Tie:
				begin
				tie_game = 1'b1;
				end
				
			Loss:
				begin
				loss_game = 1'b1;
				end
			
			default: nextState = P1_Move;
		
		endcase
			
	end
	
endmodule
