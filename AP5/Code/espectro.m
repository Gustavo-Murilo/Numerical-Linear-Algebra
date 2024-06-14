% Entradas:
%   A - matriz (n x n)
% Saídas:
%   S = vetor (n x 1) ortogonal
function [S] = espectro(A, tol) 
  % Definição de variáveis
  erro = tol + 1;
  S = diag(A);

  while tol <= erro
    % Processo iterativo
    [Q, R] = qr_GSM(A);
    A = R * Q;
    
    % Verificação de convergência
    novo_S = diag(A);
    erro = norm(S - novo_S, 2);

    S = novo_S; % Atualiza o resultado
  end
end
