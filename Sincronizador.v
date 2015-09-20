`timescale 1ns / 1ns

////////////////////////////////////////////////////////////////// 
////                                                              ////
////                                                              //// 
////  Sincronizador                                               //// 
////                                                              ////
////                                                              //// 
////  Este archivo describe el comportamiento                     //// 
////  de un soncronizador antirrebote  en Verilog                 //// 
////                                                              //// 
////  Description                                                 //// 
////  Modulo encargado de sincronizar las entradas con el reloj   ////
////  del sistema. Tiene como entradas 3 bits del identificador   ////
////  del piso en código Gray, la señal binaria del sensor de     ////
////  sobrepeso, la señal binaria del sensor de obtaculización    ////
////  de la puerta y los 2 bits por cada uno de los 5 pisos donde ////
////  el MSB es señal desubida y el LSB de bajada.                ////  
////  Su funcionamiento se basa en  pasar cada una de las entradas////  
////  por 2 flipflops para sincronizar los pulsos con el reloj    ////  
////  del sistema, luego se encarga de tomar  4 muestras de las   ////  
////  entradas cada 10ms y asi se identifica el estado en que     ////  
////  se encuentran.                                              ////  
////                                                              //// 
////                                                              //// 
////                                                              //// 
////                                                              //// 
////  Autor    :                                                  //// 
////      - Manuel Zumbado Corrales manu3193@gmail.com            //// 
////                                                              //// 
////////////////////////////////////////////////////////////////////// 
////                                                              //// 
//// Copyright (C) 2009 Authors and OPENCORES.ORG                 //// 
////                                                              //// 
//// This source file may be used and distributed without         //// 
//// restriction provided that this copyright statement is not    //// 
//// removed from the file and that any derivative work contains  //// 
//// the original copyright notice and the associated disclaimer. //// 
////                                                              //// 
//// This source file is free software; you can redistribute it   //// 
//// and/or modify it under the terms of the GNU Lesser General   //// 
//// Public License as published by the Free Software Foundation; //// 
//// either version 2.1 of the License, or (at your option) any   //// 
//// later version.                                               //// 
////                                                              //// 
//// This source is distributed in the hope that it will be       //// 
//// useful, but WITHOUT ANY WARRANTY; without even the implied   //// 
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      //// 
//// PURPOSE.  See the GNU Lesser General Public License for more //// 
//// details.                                                     //// 
////                                                              //// 
//// You should have received a copy of the GNU Lesser General    //// 
//// Public License along with this source; if not, download it   //// 
/// from http://www.opencores.org/lgpl.shtml                     //// 
////                                                              //// 
//////////////////////////////////////////////////////////////////////



module Sincronizador( _clk_, boton_arriba_in, boton_abajo_in, boton_izq_in, boton_der_in, boton_elige_in,
								boton_arriba_out, boton_abajo_out, boton_izq_out, boton_der_out, boton_elige_out);
					
 //Se definen las entradas y salidas del módulo						
 input boton_arriba_in, boton_abajo_in, boton_izq_in, boton_der_in, boton_elige_in, _clk_;
 
 output reg boton_arriba_out, boton_abajo_out, boton_izq_out, boton_der_out, boton_elige_out;

 
 //El contador cuenta hasta 10ms, por lo que se almacena 1000000.
 localparam contador_max= 20'd1000000;
 
 //Se crea el primer registro (flip-flop) por cada entrada para sincronizarlos con el clk
 reg boton_arriba_sync_0;
 reg boton_abajo_sync_0;
 reg boton_izq_sync_0;
 reg boton_der_sync_0;
 reg boton_elige_sync_0;

 
 //En cada estado positivo del clk, los registros guardan los valores de los botones/switches
 always @(posedge _clk_) 
	begin
		boton_arriba_sync_0 <= boton_arriba_in;
		boton_abajo_sync_0  <= boton_abajo_in;
		boton_izq_sync_0    <= boton_izq_in;
		boton_der_sync_0    <= boton_der_in;
		boton_elige_sync_0  <= boton_elige_in;
	end

 //Se crea el segundo registro (flip-flop) por cada salida de los registros anteriores para sincronizarlos con el clk
 reg boton_arriba_sync_1;
 reg boton_abajo_sync_1;
 reg boton_izq_sync_1;
 reg boton_der_sync_1;
 reg boton_elige_sync_1;
 
 //En cada estado positivo del clk, los registros guardan los valores el registro anterior para sincronizar con el clk
 always @(posedge _clk_) 
	begin
		boton_arriba_sync_1 <= boton_arriba_sync_0;
		boton_abajo_sync_1  <= boton_abajo_sync_0;
		boton_izq_sync_1    <= boton_izq_sync_0;
		boton_der_sync_1    <= boton_der_sync_0;
		boton_elige_sync_1  <= boton_elige_sync_0;
	end
 
 //Se crea el registro que almacena el contador
 reg [19:0] contador=0;
 
 //Se crean los shift registers que almacenan las 4 muestras de los estados de los botones y switches correspondientes
 reg [3:0] sr_boton_arriba= 4'b0, sr_boton_abajo= 4'b0, sr_boton_izq= 4'b0, sr_boton_der= 4'b0, sr_boton_elige= 4'b0;

 //Contador
 	always @(posedge _clk_)
	begin 
		if (contador == contador_max)
			contador <= 1'b0;	
		else
			contador <= contador + 1'b1;
	end
	
	
 always @(posedge _clk_) 
	begin
		if (contador==contador_max) begin
			
			//Se hace un corrimiento a la izquierda y se almacena el estado de la entrada segun muestreo cada 10ms.
			sr_boton_arriba <= (sr_boton_arriba << 1)  | boton_arriba_sync_1;
			sr_boton_abajo  <= (sr_boton_abajo  << 1)  | boton_abajo_sync_1;
			sr_boton_izq    <= (sr_boton_izq    << 1)  | boton_izq_sync_1;
			sr_boton_der    <= (sr_boton_der    << 1)  | boton_der_sync_1;
			sr_boton_elige  <= (sr_boton_elige  << 1)  | boton_elige_sync_1;
		end
		
	
		//Se escribe en cada salida correspondiente un 1 si los 4 bits muestreados cada 10ns son 1111 y 0 si los 4 bits muestreados fueron 0000
		case (sr_boton_arriba)
					4'b0000: boton_arriba_out <= 0;
					4'b1111: boton_arriba_out <= 1;
		endcase
		
		case (sr_boton_abajo)
					4'b0000: boton_abajo_out <= 0;
					4'b1111: boton_abajo_out <= 1;
		endcase
		
		case (sr_boton_izq)
					4'b0000: boton_izq_out <= 0;
					4'b1111: boton_izq_out <= 1;
		endcase
		
		case (sr_boton_der)
					4'b0000: boton_der_out <= 0;
					4'b1111: boton_der_out <= 1;
		endcase
		
		case (sr_boton_elige)
					4'b0000: boton_elige_out <= 0;
					4'b1111: boton_elige_out <= 1;
		endcase
	end
endmodule
