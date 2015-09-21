`timescale 1ns / 1ps


module Selector_Casillas(
	boton_arriba,
	boton_abajo,
	boton_izq,
	boton_der,
	boton_elige,
	
	turno_p1, 
	turno_p2,
	
	guarda_c1,
	guarda_c2,
	guarda_c3,
	guarda_c4,
	guarda_c5,
	guarda_c6,
	guarda_c7,
	guarda_c8,
	guarda_c9,
	
	p1_mm,
	p2_mm,
	cuadro
   );
	
	input boton_elige, boton_arriba, boton_abajo, boton_izq, boton_der;
	
	input turno_p1, turno_p2;
	
	output reg p1_mm, p2_mm;
	
	output reg [3:0] cuadro;
	
	output reg [1:0] 	guarda_c1, guarda_c2, guarda_c3, guarda_c4, guarda_c5, guarda_c6, guarda_c7, guarda_c8, guarda_c9;

	
	initial cuadro <= 4'b0101;
	
	always @(posedge boton_elige, posedge boton_arriba, posedge boton_abajo, posedge boton_izq, posedge boton_der)
		begin
			if (cuadro >= 4'b0001 & cuadro <= 4'b1001)
				begin
					if (boton_abajo == 1'b1 & cuadro >= 4'b0001 & cuadro <= 4'b1001)
						cuadro <= cuadro - 4'b0011;
						
					else if (boton_arriba == 1'b1 & cuadro >= 4'b0001 & cuadro <= 4'b1001)
						cuadro <= cuadro + 4'b0011;
						
					else if (boton_izq == 1'b1 & cuadro >= 4'b0001 & cuadro <= 4'b1001)
						cuadro <= cuadro - 4'b0001;
						
					else if (boton_der == 1'b1 & cuadro >= 4'b0001 & cuadro <= 4'b1001)
						cuadro <= cuadro + 4'b0001;
						
					else if (boton_elige == 1'b1 & cuadro >= 4'b0001 & cuadro <= 4'b1001)
						begin
						if (turno_p1 == 1'b1 & turno_p2 == 1'b0)
							begin
							//Guarda en los registros
							if (cuadro == 4'b0001)
								guarda_c1 <= 2'b11;
							else if (cuadro == 4'b0010)
								guarda_c2 <= 2'b11;
							else if (cuadro == 4'b0011)
								guarda_c3 <= 2'b11;
							else if (cuadro == 4'b0100)
								guarda_c4 <= 2'b11;
							else if (cuadro == 4'b0101)
								guarda_c5 <= 2'b11;
							else if (cuadro == 4'b0110)
								guarda_c6 <= 2'b11;
							else if (cuadro == 4'b0111)
								guarda_c7 <= 2'b11;
							else if (cuadro == 4'b1000)
								guarda_c8 <= 2'b11;
							else if (cuadro == 4'b1001)
								guarda_c9 <= 2'b11;
							//pone al jugador en movimiento
							//equis <= cuadro;
							p1_mm <= 1'b1;
							p2_mm <= 1'b0;
							end
						else if (turno_p1 == 1'b0 & turno_p2 == 1'b1)
							begin
							//Guarda en los registros
							if (cuadro == 4'b0001)
								guarda_c1 <= 2'b01;
							else if (cuadro == 4'b0010)
								guarda_c2 <= 2'b01;
							else if (cuadro == 4'b0011)
								guarda_c3 <= 2'b01;
							else if (cuadro == 4'b0100)
								guarda_c4 <= 2'b01;
							else if (cuadro == 4'b0101)
								guarda_c5 <= 2'b01;
							else if (cuadro == 4'b0110)
								guarda_c6 <= 2'b01;
							else if (cuadro == 4'b0111)
								guarda_c7 <= 2'b01;
							else if (cuadro == 4'b1000)
								guarda_c8 <= 2'b01;
							else if (cuadro == 4'b1001)
								guarda_c9 <= 2'b01;
							//pone al jugador en movimiento
							//circulo <= cuadro;
							p1_mm <= 1'b0;
							p2_mm <= 1'b1;
							end
						end
				end					
		end


endmodule
