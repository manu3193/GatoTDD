`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:17:03 09/14/2015
// Design Name:   Gato_FSM
// Module Name:   C:/Users/Arturo/Desktop/Proyecto Corto 1 14Set/Gato/Test_FSM.v
// Project Name:  Gato
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Gato_FSM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_FSM;

	// Inputs
	reg clk;
	reg reset;
	reg p1_mm;
	reg p2_mm;
	reg p1_tie;
	reg p1_loss;
	reg p1_win;
	reg p2_tie;
	reg p2_loss;
	reg p2_win;

	// Outputs
	wire [2:0] state;
	wire verifica_status;
	wire turno_p1;
	wire turno_p2;

	// Instantiate the Unit Under Test (UUT)
	Gato_FSM uut (
		.clk(clk), 
		.reset(reset), 
		.state(state), 
		.p1_mm(p1_mm), 
		.p2_mm(p2_mm), 
		.p1_tie(p1_tie), 
		.p1_loss(p1_loss), 
		.p1_win(p1_win), 
		.p2_tie(p2_tie), 
		.p2_loss(p2_loss), 
		.p2_win(p2_win), 
		.verifica_status(verifica_status), 
		.turno_p1(turno_p1), 
		.turno_p2(turno_p2)
	);
	
	always 
		#5 clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 1;
		reset = 0;
		p1_mm = 0;
		p2_mm = 0;
		p1_tie = 0;
		p1_loss = 0;
		p1_win = 0;
		p2_tie = 0;
		p2_loss = 0;
		p2_win = 0;

		// Wait 100 ns for global reset to finish
		#10;
		p1_mm = 1'b1;
		
		#30;
		p2_mm = 1'b1;
		
		/*#10;
		p1_mm = 1'b1;
		p2_mm = 1'b0;
		
		#10;
		p1_mm = 1'b0;
		p2_mm = 1'b1;
		
		#10;
		p1_mm = 1'b1;
		p2_mm = 1'b0;
		
		#10;
		p1_mm = 1'b0;
		p2_mm = 1'b1;*/
        
		// Add stimulus here

	end
      
endmodule

