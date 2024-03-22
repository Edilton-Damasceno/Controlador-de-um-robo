/*
código robo
*/

module Robo (clock, reset, head, left, avancar, girar);
	input clock, reset, head, left;
	output reg avancar, girar;
	
	//Registrador de estado
	reg [1:0] state;
	
	//Codificacao dos estados	
	parameter procurando_muro = 2'b00,
				 acompanhando_muro = 2'b01,
				 rotacionando = 2'b10;
				 
	//Estado inicial
	initial begin
		state <= procurando_muro;
	end
	
	// Primeiro procedimento - Estado proximo
	always @(negedge clock, negedge reset) 
	begin
		if(reset == 1'b0) state <= procurando_muro; // Se o reset for igual a zero volta para o estado inicial
		else 
		begin
			case(state)
				procurando_muro: begin
					if(head == 1'b0 & left == 1'b0) 
					begin
						state <= procurando_muro; // Não sei se a sintaxe está correta
					end 
					
					else if(head == 1'b1 & left == 1'b0) 
					begin
						state  <= rotacionando;
					end 
					
					else if(head == 1'b1 & left == 1'b1)
					begin
						state  <= rotacionando;
					end 
					
					else if(head == 1'b0 & left == 1'b1) 
					begin
						state  <= acompanhando_muro;
					end
				end
				
				acompanhando_muro: begin
					if(head == 1'b0 & left == 1'b0)
					begin
						state  <= procurando_muro;
					end 
					
					else if(head == 1'b1 & left == 1'b0) 
					begin
						state  <= procurando_muro;
					end
					
					else if(head == 1'b1 & left == 1'b1) 
					begin
						state  <= rotacionando;
					end 
					
					else if(head == 1'b0 & left == 1'b1) 
					begin
						state  <= acompanhando_muro; 
					end
				end
				
				rotacionando: begin
					if(head == 1'b0 & left == 1'b0) 
					begin
						state  <= rotacionando;
					end
				
					else if(head == 1'b1 & left == 1'b0) 
					begin
						state  <= rotacionando;
					end
					
					else if(head == 1'b1 & left == 1'b1) 
					begin 
						state  <= rotacionando;
					end 
					
					else if(head == 1'b0 & left == 1'b1) 
					begin
						state  <= acompanhando_muro;
					end
				end
				
			endcase
		end
	end
	
	//Segundo Procedimento
	always @(state or head or left) begin // Pode tá errado
		case(state)
		
			procurando_muro: begin
				if(head == 1'b0 & left == 1'b0) 
				begin 
					avancar = 1'b1;
					girar = 1'b0; // Não sei se a sintaxe está correta
				end
			
				else if(head == 1'b1 & left == 1'b0)
				begin
					avancar = 1'b0;
					girar = 1'b1;
				end 
				
				else if(head == 1'b1 & left == 1'b1) 
				begin
					avancar = 1'b0;
					girar = 1'b1;
				end 
				
				else if(head == 1'b0 & left == 1'b1) 
				begin 
					avancar = 1'b1;
					girar = 1'b0;
				end
			end
			
			acompanhando_muro: begin
				if(head == 1'b0 & left == 1'b0) 
				begin
					avancar = 1'b0;
					girar = 1'b1;
				end 
				
				else if(head == 1'b1 & left == 1'b0) 
				begin 
					avancar = 1'b0;
					girar = 1'b1;
				end
			
				else if(head == 1'b1 & left == 1'b1) 
				begin
					avancar = 1'b0;
					girar = 1'b1;
				end 
				
				else if(head == 1'b0 & left == 1'b1) 
				begin
					avancar = 1'b1;
					girar = 1'b0;
				end
			end
			
			rotacionando: begin
				if(head == 1'b0 & left == 1'b0) 
				begin
					avancar = 1'b0;
					girar = 1'b1;
				end 
				
				else if(head == 1'b1 & left == 1'b0)
				begin
					avancar = 1'b0;
					girar = 1'b1;
				end 
				
				else if(head == 1'b1 & left == 1'b1) 
				begin
					avancar = 1'b0;
					girar = 1'b1;
				end
				
				else if(head == 1'b0 & left == 1'b1) 
				begin
					avancar = 1'b1;
					girar = 1'b0;
				end
			end
		endcase
	end
endmodule
