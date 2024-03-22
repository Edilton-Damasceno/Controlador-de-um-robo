module Robo (clock, reset, head, left, avancar, girar);

// definindo as entradas e saidas
input clock, reset, head, left;
output reg avancar, girar;

// declarando as variáveis estados como reg
reg [1:0] estado_atual, estado_futuro;

// declarando os parâmetros
parameter procurando_muro = 2'b00,
        rotacionando = 2'b01,
        acompanhando_muro = 2'b10;
        
always @(head or left or estado_atual) // entra nesse loop sempre que as 3 variáveis da condição forem atualizadas
begin
        estado_futuro = procurando_muro;  //estado inicial
        avancar = 1'b1;
        girar = 1'b0;
        
        // definindo o comportamento das sáidas a partir de cada estado e entrada
    case (estado_atual)
        procurando_muro: case({head, left})
                            2'b00: begin

                                            avancar = 1'b1;
                                            girar = 1'b0;
                                            estado_futuro = estado_atual;

                                        end

                            2'b01: begin

                                            avancar = 1'b1;
                                            girar = 1'b0;
                                            estado_futuro = acompanhando_muro;

                                        end

                            2'b10: begin

                                            avancar = 1'b0;
                                            girar = 1'b1;
                                            estado_futuro = rotacionando;

                                        end

                            2'b11: begin

                                            avancar = 1'b0;
                                            girar = 1'b1;
                                            estado_futuro = rotacionando;

                                        end
                            endcase
        rotacionando: case({head, left})
                            2'b00: begin

                                            avancar = 1'b0;
                                            girar = 1'b1;
                                            estado_futuro = estado_atual;

                                        end

                            2'b01: begin

                                            avancar = 1'b1;
                                            girar = 1'b0;
                                            estado_futuro = acompanhando_muro;

                                        end

                            2'b10: begin

                                            avancar = 1'b0;
                                            girar = 1'b1;
                                            estado_futuro = estado_atual;

                                        end

                            2'b11: begin

                                            avancar = 1'b0;
                                            girar = 1'b1;
                                            estado_futuro = estado_atual;

                                        end


                            endcase

        acompanhando_muro: case({head, left})
                            2'b00: begin

                                            avancar = 1'b0;
                                            girar = 1'b1;
                                            estado_futuro = procurando_muro;

                                        end

                            2'b01: begin

                                            avancar = 1'b1;
                                            girar = 1'b0;
                                            estado_futuro = estado_atual;

                                        end

                            2'b10: begin

                                            avancar = 1'b0;
                                            girar = 1'b1;
                                            estado_futuro = procurando_muro;

                                        end

                            2'b11: begin

                                            avancar = 1'b0;
                                            girar = 1'b1;
                                            estado_futuro = rotacionando;

                                        end


                            endcase
                                

                endcase
    end

// esse bloco sempre será atualizado quando o clock ou o reset tiverem mudanças
always @(clock or !reset)
begin

    if(!reset) //atualizando o valor do estado atual a partir da mudança do sinal de clock. Caso o robô apresente alguma anomalia ele ficará no estado procurando_muro.
            case ({head,left})
                    2'b00: estado_atual <= procurando_muro;
				    2'b01: estado_atual <= rotacionando;
				    2'b10: estado_atual <= acompanhando_muro;
                    default: estado_atual <= procurando_muro;
            endcase

    else //com a mudança do sinal do reset, é atribuido o valor de estado_futuro a estado_atual
        estado_atual <= estado_futuro;
end

endmodule
