function [tempo] = Testar_Velocidade(n, func)
  % Declaraçao de variaveis.
  [A, b] = Criar_Sistema(n);
  x_0 = zeros(n,1);

  % Inicia o contador de tempo
  tic;

  % Executa a funçao
  if func == 'a'   
    Gauss_Seidel_a(A, b, x_0, 1e-6, 500, 2);
  elseif func == 'b' 
    Gauss_Seidel_b(A, b, x_0, 1e-6, 500, 2);
  end
  
  % Finaliza a contagem do tempo
  tempo = toc;
end

function [A, b] = Criar_Sistema(n)
  % Cria uma matriz com diagonal estritamente dominante
  A = Criar_Dominante(n);
  x = randi(9,n,1);
  b = A*x;
end

function [A] = Criar_Dominante(n)
  % Cria uma matriz nxn com inteiros aleatórios de 1 a 5
  A = randi(5,n,n);
  
  % A soma máxima de uma linha é 5(n-1). Para tornar a matriz estritamente dominante, basta somar 5n a todos elementos da diagonal
  for i = 1 : n
    A(i,i) = A(i,i) + 5*n;
  end
end
