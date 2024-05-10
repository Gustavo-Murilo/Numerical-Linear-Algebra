% ////////////////////////////////////////////////////////////////////
% Variáveis de entrada:
% A: matriz real n x n, diagonalizável, com autovalor dominante (lambda);
% x0: vetor, não nulo, a ser utilizado como aproximação inicial do autovetor dominante;
% epsilon: precisão a ser usada no critério de parada;
% M: número máximo de iterações.

% Variáveis de saída:
% lambda: autovalor dominante de A;
% x1: autovetor unitário (norma infinito) correspondente a lambda;
% k: número de iterações necessárias para a convergência;
% n_erro: norma infinito do erro.

% Critério de parada: sendo erro=x1 – x0 (diferença entre dois 
% iterados consecutivos), parar quando n_erro < épsilon ou k>M.
% ////////////////////////////////////////////////////////////////////
function [lambda, x1, k, n_erro] = Metodo_potencia_v1(A, x0, epsilon, M)

  x1 = x0; % Define xk para k = 0

  % Definição de variáveis para os critérios de parada
  k = 0;
  n_erro = epsilon + 1; % Valor para entrar no loop

  while (k < M && n_erro > epsilon)     
    % Aproximação do autovalor dominante
    lambda = norm(x1, inf); % Coordenada de maior modulo

    % Normalização da (k)-ésima aproximação do autovetor
    x0 = x1 / lambda;
    
    % Cálculo da (k+1)-ésima aproximação do autovetor
    x1 = A * x0;
    
    % Atualização das condições de parada
    k = k + 1;
    n_erro = norm(x1 - x0*lambda, inf);
  end
  
  if (k >= M)
    fprintf('O método atingiu o limite de %d iterações. \n',M);
  end

end % Finaliza a função
