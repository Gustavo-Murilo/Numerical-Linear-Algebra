% ///////////////////////////////////////////////////////////////////
% Variáveis de entrada:
% A: matriz real n x n, diagonalizável;
% x0: vetor, não nulo, a ser utilizado como aproximação inicial do autovetor dominante.
% epsilon: precisão a ser usada no critério de parada.
% alfa: valor do qual se deseja achar o autovalor de A mais próximo;
% M: número máximo de iterações.

% Variáveis de saída:
% lambda1: autovalor de A mais próximo de alfa;
% x1: autovetor unitário (norma_2) correspondente a lambda;
% k: número de iterações necessárias para a convergência
% n_erro: norma_2 do erro

% Critério de parada: sendo erro = x1 – x0 (diferença entre dois 
% iterados consecutivos),
% parar quando a n_erro < épsilon ou k>M.
% ///////////////////////////////////////////////////////////////////
function [lambda1,x1,k,n_erro] = Potencia_deslocada_inversa(A, x0, epsilon, alfa, M)
  
  % Decomposiçao L*U de P*(A - alfa*I)
  n = size(A,1);
  B = A - alfa*eye(n);
  [~, C, P] = Gaussian_Elimination_4(B, x0);

  % Verificação da invertibilidade da matriz deslocada
  if min(abs(diag(C))) == 0
    fprintf('\n(A - %d*I) nao é invertível, portanto %d é autovalor de A.\n\n',alfa,alfa);
    error('O alfa é autovalor de A, o que acarreta divisões por 0.');
  end

  % Separação da fatoração L*U compactada em C
  L = tril(C, -1) + eye(n);
  U = triu(C);
  
  % Definição de variáveis para os critérios de parada
  k = 0;
  n_erro = epsilon + 1; % Para entrar no loop
  
  % Normaliza x0
  x0 = x0 / norm(x0);
  
  % Iteração até a convergência ou M iterações
  while k <= M && n_erro > epsilon
    % Dado (A – alfa*I)*x1 = x0 e P*(A – alfa*I) = L*U,
    % Resolve L*U*x1 = P*x0
    x1 = Resolve_LU(L, U, P*x0);
  
    % Normalizaação do (k)-ésimo autovetor dominante
    x1 = x1 / norm(x1);

    % Calcula lambda usando o quociente de Rayleigh
    lambda1 = x1' * A * x1;

    % Mantém x1 e x2 no mesmo sentido
    if x1' * x0 < 0
      x1 = -x1;
    end

    % Calcula o erro
    n_erro = norm(x1 - x0);

    % Atualiza x0 para a próxima iteração
    x0 = x1;
    k = k + 1;
  end

  if k >= M
    fprintf('O metodo atingiu o limite de %d iteraçoes. \n',M);
  end

end % Finaliza a função
