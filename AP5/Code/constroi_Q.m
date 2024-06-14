% Entradas:
%   U - matriz (m x n) com vetores de Householder
% Saídas:
%   Q = matriz (m x n) ortogonal
function [Q] = constroi_Q(U)
  % Obtém dimensões de U e inicializa Q
  [m,n] = size(U);
  Q = eye(m,n);
  
  for i = 1 : n
    u = U(:,i);

    % Aplica a tranformação de Householder pela direita Q*(H - u*u')
    Q = Q - 2*Q*(u*u');
  end
end