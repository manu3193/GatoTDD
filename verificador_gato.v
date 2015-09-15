`timescale 1ns / 1ps


module Verificador_gato(
	verifica_status,
	
	p1_tie, 
	p1_loss,
	p1_win,
	
	p2_tie, 
	p2_loss,
	p2_win,
	
	linea_horizontal,
	linea_vertical,
	linea_cruzada,
	
	reg_c1,
	reg_c2,
	reg_c3,
	reg_c4,
	reg_c5,
	reg_c6,
	reg_c7,
	reg_c8,
	reg_c9
   );
	
	input verifica_status;
	
	input [1:0] reg_c1, reg_c2, reg_c3, reg_c4, reg_c5, reg_c6, reg_c7, reg_c8, reg_c9;
	
	output reg p1_tie, p1_loss, p1_win, p2_tie, p2_loss, p2_win;
	
	output reg [1:0] linea_horizontal, linea_vertical, linea_cruzada;
	
	always @(*)
		begin
		//verifica si el jugador 1 gana
		if (verifica_status == 1'b1)
			begin
			if (reg_c1 == 2'b11 & reg_c2 == 2'b11 & reg_c3 == 2'b11) 
				begin
				p1_win <= 1'b1;
				p1_loss <= 1'b0;
				p2_win <= 1'b0;
				p2_loss <= 1'b1;
				p1_tie <= 1'b0;
				p2_tie <= 1'b0;
				linea_horizontal <= 2'b01;
				end
			else if (reg_c1 == 2'b11 & reg_c4 == 2'b11 & reg_c7  == 2'b11)
				begin
				p1_win <= 1'b1;
				p1_loss <= 1'b0;
				p2_win <= 1'b0;
				p2_loss <= 1'b1;
				p1_tie <= 1'b0;
				p2_tie <= 1'b0;
				linea_vertical <= 2'b01;
				end
			else if (reg_c1 == 2'b11 & reg_c5 == 2'b11 & reg_c9  == 2'b11)
				begin
				p1_win <= 1'b1;
				p1_loss <= 1'b0;
				p2_win <= 1'b0;
				p2_loss <= 1'b1;
				p1_tie <= 1'b0;
				p2_tie <= 1'b0;
				linea_cruzada <= 2'b01;
				end
			else if (reg_c2 == 2'b11 & reg_c5 == 2'b11 & reg_c8  == 2'b11)
				begin
				p1_win <= 1'b1;
				p1_loss <= 1'b0;
				p2_win <= 1'b0;
				p2_loss <= 1'b1;
				p1_tie <= 1'b0;
				p2_tie <= 1'b0;
				linea_vertical <= 2'b10;
				end
			else if (reg_c3 == 2'b11 & reg_c5 == 2'b11 & reg_c7  == 2'b11)
				begin
				p1_win <= 1'b1;
				p1_loss <= 1'b0;
				p2_win <= 1'b0;
				p2_loss <= 1'b1;
				p1_tie <= 1'b0;
				p2_tie <= 1'b0;
				linea_cruzada <= 2'b10;
				end
			else if (reg_c3 == 2'b11 & reg_c6 == 2'b11 & reg_c9  == 2'b11)
				begin
				p1_win <= 1'b1;
				p1_loss <= 1'b0;
				p2_win <= 1'b0;
				p2_loss <= 1'b1;
				p1_tie <= 1'b0;
				p2_tie <= 1'b0;
				linea_vertical <= 2'b11;
				end
			else if (reg_c4 == 2'b11 & reg_c5 == 2'b11 & reg_c6  == 2'b11)
				begin
				p1_win <= 1'b1;
				p1_loss <= 1'b0;
				p2_win <= 1'b0;
				p2_loss <= 1'b1;
				p1_tie <= 1'b0;
				p2_tie <= 1'b0;
				linea_horizontal <= 2'b10;
				end
			else if (reg_c7 == 2'b11 & reg_c8 == 2'b11 & reg_c9  == 2'b11)
				begin
				p1_win <= 1'b1;
				p1_loss <= 1'b0;
				p2_win <= 1'b0;
				p2_loss <= 1'b1;
				p1_tie <= 1'b0;
				p2_tie <= 1'b0;
				linea_horizontal <= 2'b11;
				end
				
			//verifica si el jugador 2 gana
			else if (reg_c1 == 2'b01 & reg_c2 == 2'b01 & reg_c3 == 2'b01) 
				begin
				p2_win <= 1'b1;
				p2_loss <= 1'b0;
				p1_win <= 1'b0;
				p1_loss <= 1'b1;
				p1_tie <= 1'b0;
				p2_tie <= 1'b0;
				linea_horizontal <= 2'b01;
				end
			else if (reg_c1 == 2'b01 & reg_c4 == 2'b01 & reg_c7  == 2'b01)
				begin
				p2_win <= 1'b1;
				p2_loss <= 1'b0;
				p1_win <= 1'b0;
				p1_loss <= 1'b1;
				p1_tie <= 1'b0;
				p2_tie <= 1'b0;
				linea_vertical <= 2'b01;
				end
			else if (reg_c1 == 2'b01 & reg_c5 == 2'b01 & reg_c9  == 2'b01)
				begin
				p2_win <= 1'b1;
				p2_loss <= 1'b0;
				p1_win <= 1'b0;
				p1_loss <= 1'b1;
				p1_tie <= 1'b0;
				p2_tie <= 1'b0;
				linea_cruzada <= 2'b01;
				end
			else if (reg_c2 == 2'b01 & reg_c5 == 2'b01 & reg_c8  == 2'b01)
				begin
				p2_win <= 1'b1;
				p2_loss <= 1'b0;
				p1_win <= 1'b0;
				p1_loss <= 1'b1;
				p1_tie <= 1'b0;
				p2_tie <= 1'b0;
				linea_vertical <= 2'b10;
				end
			else if (reg_c3 == 2'b01 & reg_c5 == 2'b01 & reg_c7  == 2'b01)
				begin
				p2_win <= 1'b1;
				p2_loss <= 1'b0;
				p1_win <= 1'b0;
				p1_loss <= 1'b1;
				p1_tie <= 1'b0;
				p2_tie <= 1'b0;
				linea_cruzada <= 2'b10;
				end
			else if (reg_c3 == 2'b01 & reg_c6 == 2'b01 & reg_c9  == 2'b01)
				begin
				p2_win <= 1'b1;
				p2_loss <= 1'b0;
				p1_win <= 1'b0;
				p1_loss <= 1'b1;
				p1_tie <= 1'b0;
				p2_tie <= 1'b0;
				linea_vertical <= 2'b11;
				end
			else if (reg_c4 == 2'b01 & reg_c5 == 2'b01 & reg_c6  == 2'b01)
				begin
				p2_win <= 1'b1;
				p2_loss <= 1'b0;
				p1_win <= 1'b0;
				p1_loss <= 1'b1;
				p1_tie <= 1'b0;
				p2_tie <= 1'b0;
				linea_horizontal <= 2'b10;
				end
			else if (reg_c7 == 2'b01 & reg_c8 == 2'b01 & reg_c9  == 2'b01)
				begin
				p2_win <= 1'b1;
				p2_loss <= 1'b0;
				p1_win <= 1'b0;
				p1_loss <= 1'b1;
				p1_tie <= 1'b0;
				p2_tie <= 1'b0;
				linea_horizontal <= 2'b11;
				end
			//verifica si hay empate
			else 
				if (reg_c1[0] == 1'b1 & reg_c2[0] == 1'b1 & reg_c3[0] == 1'b1 & reg_c4[0] == 1'b1 &
					 reg_c5[0] == 1'b1 & reg_c6[0] == 1'b1 & reg_c7[0] == 1'b1 & reg_c8[0] == 1'b1 &
					 reg_c9[0] == 1'b1)
					 begin
					 p2_win <= 1'b0;
					 p2_loss <= 1'b0;
					 p1_win <= 1'b0;
					 p1_loss <= 1'b0;
					 p1_tie <= 1'b1;
					 p2_tie <= 1'b1;
					 end
			end
		end
endmodule
