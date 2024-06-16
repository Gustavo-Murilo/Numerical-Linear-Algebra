% Entradas:
%   U - matriz (m x n) com vetores de Householder
% Saídas:
%   Q - matriz (m x n) ortogonal
%   versao - 1: Q é m x m, 2: Q é m x n
function [Q] = constroi_Q(U, versao)
  % Obtém dimensões de U e inicializa Q
  [m,n] = size(U);
  
  Q = eye(m, m);

  for i = 1 : n
    u = U(:,i);

    % Aplica a tranformação de Householder pela direita Q*(H - u*u')
    Q = Q - 2 * Q * (u * u');
  end

  % Ajusta a dimensão de Q para ser compatível com R
  if versao == 2
    Q = Q(:,1:n);
  end
end
