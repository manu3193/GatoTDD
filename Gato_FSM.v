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
	turno_p2,
	
	win_game,
	loss_game,
	tie_game
	);
	input clk, reset;
	input p1_mm, p2_mm;
	
	input p1_tie, p1_loss, p1_win, p2_tie, p2_loss, p2_win;
	
	output reg turno_p1, turno_p2;
	
	output reg verifica_status;
	
	output reg win_game, loss_game, tie_game;
		
	output [3:0] state;
	reg [3:0] state, nextState;
	
	//Estados de las FSM
	parameter P1_Move = 0;
	parameter P1_Status = 1;
	parameter P2_Move = 2;
	parameter P2_Status = 3;
	parameter Win = 4;
	parameter Tie = 5;
	parameter Loss = 6;
	
	initial turno_p1 <= 1'b1;
	initial turno_p2 <= 1'b0;
	
	//Asignación sincrona del singuiente estado
	always @(posedge clk or posedge reset)
		begin
		if (reset)
			state <= P1_Move;
		else
			state <= nextState;
		end
	
	//Asignacion asincrona de los estados
	always @(state or p1_mm or p2_mm or p1_win or p1_loss or p1_tie or p2_win or p2_loss or p2_tie)
		begin
		
		nextState = 3'bxxx;
		
		case(state)
			
			P1_Move:
				begin
				verifica_status <= 1'b0;
				turno_p1 <= 1'b1;
				turno_p2 <= 1'b0;
				if (p1_mm == 1'b0)
					nextState = P1_Move;
				else if (p1_mm == 1'b1)
					nextState = P1_Status;
				end
			
			P1_Status:
				begin
				verifica_status <= 1'b1;
				turno_p1 <= 1'b0;
				turno_p2 <= 1'b1;
				if (p1_tie == 1'b1 & p1_loss == 1'b0 & p1_win == 1'b0)
					nextState = Tie;
				else if (p1_win == 1'b1 & p1_tie == 1'b0 & p1_loss == 1'b0)
					nextState = Loss;
				else if (p2_mm == 1'b0)
					nextState = P2_Move;
				end
			
			P2_Move:
				begin
				verifica_status <= 1'b0;
				turno_p1 <= 1'b0;
				turno_p2 <= 1'b1;
				if (p2_mm == 1'b0)
					nextState = P2_Move;
				else if (p2_mm == 1'b1)
					nextState = P2_Status;
				end
			
			P2_Status:
				begin
				verifica_status <= 1'b1;
				turno_p1 <= 1'b1;
				turno_p2 <= 1'b0;
				if (p2_tie == 1'b1 & p2_loss == 1'b0 & p2_win == 1'b0)
					nextState = Tie;
				else if (p2_win == 1'b1 & p2_tie == 1'b0 & p2_loss == 1'b0)
					nextState = Win;
				else if (p1_mm == 1'b0)
					nextState = P1_Move;
				end
				
			Win:
				begin
				win_game <= 1'b1;
				nextState = Win;
				end
				
			Tie:
				begin
				tie_game <= 1'b1;
				nextState = Tie;
				end
				
			Loss:
				begin
				loss_game <= 1'b1;
				nextState = Loss;
				end
			
			default: nextState = P1_Move;
		
		endcase
			
	end
	
endmodule
