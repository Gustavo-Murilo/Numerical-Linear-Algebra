% Entradas:
%   A - matriz de entrada (m x n)
% Saídas:
%   U - matriz (m x m) contendo os vetores normais
%   R - matriz (m x n) triangular superior
function [U, R] = qr_House(A)
  [m, n] = size(A);
  
  % Inicializar a matriz U com zeros
  U = zeros(m, n);
  
  for i = 1 : min(m,n)
    % Extrair a coluna atual a partir da i-ésima linha até o final
    x = A(i:m, i);
    
    % Obtém o vetor normal ao hiperplano de reflexão
    if x(1) > 0
      x(1) = x(1) + norm(x, 2);
    else
      x(1) = x(1) - norm(x, 2);
    end
    
    u = x / norm(x, 2); % Normaliza o vetor
    U(i:m, i) = u;  % Armazena o vetor em U
    
    % Aplica a transformação de Householder à submatriz de A
    A(i:m, i:n) = A(i:m, i:n) - 2*u*(u'*A(i:m, i:n));
  end
  
  R = triu(A); % Os valores abaixo da diagonal seriam proximos de 0
end
