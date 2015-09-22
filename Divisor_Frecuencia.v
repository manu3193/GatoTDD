`timescale 1ns / 1ps


//Modulo del divisor de frecuencia
module Divisor_Frecuencia (
		input  C_100Mhz, //Clock de la fpga = 100MHz
		output reg  C_25Mhz
	);

	reg[31:0] contador = 0; //Variable que almacena Contador

	 
	always @(posedge C_100Mhz)
		begin
				if (contador == 2-1)          //Si ha cuenta 1s enciende led
					begin
					C_25Mhz <= ~C_25Mhz;
					contador <=0;
					end
				else
					begin
					contador <= contador + 1;        //suma contador
				   end
	  end
endmodule
