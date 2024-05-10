function [tempo] = Testar_Velocidade(n, func)
  % Declaraçao de variaveis.
  [A, b] = Criar_Sistema(n);
  x_0 = zeros(n,1);

  % Inicia o contador de tempo
  tic;

  % Executa a funçao
  if func == 'a'   
    Metodo_potencia_v1(A, x0, )
  elseif func == 'b' 
    
  end
  
  % Finaliza a contagem do tempo
  tempo = toc;
end
