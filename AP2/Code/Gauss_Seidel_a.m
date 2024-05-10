function [x_k, k, norma_dif, norma_residuo] = Gauss_Seidel_a(A, b, x_0, E, M, tipo_norma)
% ////////////////////////////////////////////////////////////////////
% Variáveis de entrada:
% A: Matriz (n x m);
% b: vetor (n x 1);
% x_0: aproximação inicial da solução do sistema (n x 1);
% E: tolerância da aproximação;
% M: número máximo de iterações M;
% tipo_norma: indicação do tipo de norma a ser utilizada (1, 2 ou inf).
% ////////////////////////////////////////////////////////////////////
% Variáveis de saída:
% x_k: a solução obtida pelo método iterativo;
% k: número de iterações efetuadas;
% norma_dif: a norma da diferença entre as duas últimas aproximações;
% norma_residuo: a norma do resíduo (||r_k|| = ||b-Ax||).
% ////////////////////////////////////////////////////////////////////

  % Decomposição da matriz dada
  LD = tril(A);  % L+D
  U = triu(A,1);

  % Criação da matriz do método
  inv_LD = inv(LD);
  M_GS = - inv_LD * U; % Matriz de Gauss-Seidel
  v_GS = inv_LD * b;

  k = 0;
  while k < M
    % Cálculo da k-ésima solução estimada pelo método iterativo 
    x_k = M_GS * x_0 + v_GS;

    % Verifica a diferença entre a solução atual e a anterior 
    norma_dif = norm(x_k-x_0, tipo_norma);

    % Atualização da condição de parada
    if norma_dif < E
      break; % Termina a execução da estrutura de repetição
    end   
    
    % Atualiza a solução anterior, preparando para a próxima iteração
    x_0 = x_k;
    % Atualiza o contador de iterações
    k = k + 1; 
  end

  norma_residuo = norm(b-A*x_k, tipo_norma);
end
