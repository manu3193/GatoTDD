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
	
	always @(verifica_status)
		begin
		//verifica si el jugador 1 gana
		if (reg_c1 == reg_c2 == reg_c3 == 2'b11) 
			begin
			p1_win <= 1'b1;
			p2_loss <= 1'b1;
			linea_horizontal <= 2'b01;
			end
		else if (reg_c1 == reg_c4 == reg_c7  == 2'b11)
			begin
			p1_win <= 1'b1;
			p2_loss <= 1'b1;
			linea_vertical <= 2'b01;
			end
		else if (reg_c1 == reg_c5 == reg_c9  == 2'b11)
			begin
			p1_win <= 1'b1;
			p2_loss <= 1'b1;
			linea_cruzada <= 2'b01;
			end
		else if (reg_c2 == reg_c5 == reg_c8  == 2'b11)
			begin
			p1_win <= 1'b1;
			p2_loss <= 1'b1;
			linea_vertical <= 2'b10;
			end
		else if (reg_c3 == reg_c5 == reg_c7  == 2'b11)
			begin
			p1_win <= 1'b1;
			p2_loss <= 1'b1;
			linea_cruzada <= 2'b10;
			end
		else if (reg_c3 == reg_c6 == reg_c9  == 2'b11)
			begin
			p1_win <= 1'b1;
			p2_loss <= 1'b1;
			linea_vertical <= 2'b11;
			end
		else if (reg_c4 == reg_c5 == reg_c6  == 2'b11)
			begin
			p1_win <= 1'b1;
			p2_loss <= 1'b1;
			linea_horizontal <= 2'b10;
			end
		else if (reg_c7 == reg_c8 == reg_c9  == 2'b11)
			begin
			p1_win <= 1'b1;
			p2_loss <= 1'b1;
			linea_horizontal <= 2'b11;
			end
			
		//verifica si el jugador 2 gana
		else if (reg_c1 == reg_c2 == reg_c3 == 2'b01) 
			begin
			p2_win <= 1'b1;
			p1_loss <= 1'b1;
			linea_horizontal <= 2'b01;
			end
		else if (reg_c1 == reg_c4 == reg_c7  == 2'b01)
			begin
			p2_win <= 1'b1;
			p1_loss <= 1'b1;
			linea_vertical <= 2'b01;
			end
		else if (reg_c1 == reg_c5 == reg_c9  == 2'b01)
			begin
			p2_win <= 1'b1;
			p1_loss <= 1'b1;
			linea_cruzada <= 2'b01;
			end
		else if (reg_c2 == reg_c5 == reg_c8  == 2'b01)
			begin
			p2_win <= 1'b1;
			p1_loss <= 1'b1;
			linea_vertical <= 2'b10;
			end
		else if (reg_c3 == reg_c5 == reg_c7  == 2'b01)
			begin
			p2_win <= 1'b1;
			p1_loss <= 1'b1;
			linea_cruzada <= 2'b10;
			end
		else if (reg_c3 == reg_c6 == reg_c9  == 2'b01)
			begin
			p2_win <= 1'b1;
			p1_loss <= 1'b1;
			linea_vertical <= 2'b11;
			end
		else if (reg_c4 == reg_c5 == reg_c6  == 2'b01)
			begin
			p2_win <= 1'b1;
			p1_loss <= 1'b1;
			linea_horizontal <= 2'b10;
			end
		else if (reg_c7 == reg_c8 == reg_c9  == 2'b01)
			begin
			p2_win <= 1'b1;
			p1_loss <= 1'b1;
			linea_horizontal <= 2'b11;
			end
		//verifica si hay empate
		else 
			if (reg_c1[1] == reg_c2[1] == reg_c3[1] == reg_c4[1] == 
				 reg_c5[1] == reg_c6[1] == reg_c7[1] == reg_c8[1] == 
				 reg_c9[1] == 1)
				 begin
				 p1_tie <= 1'b1;
				 p2_tie <= 1'b1;
				 end
		end


endmodule
