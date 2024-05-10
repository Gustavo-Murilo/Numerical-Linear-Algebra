% //////////////////////////////////////////////////////////////////////////
%% Variáveis de entrada:
% B: Matriz (n x m).
% C: Seja A=LU a decomposição LU de A (n x n).
% P: Matriz de permutação da decomposição PLU de A.
%% Variáveis de saída:
% X: Matriz (n x m), cujas colunas sejam as soluções dos sistemas lineares
% Axi = bi, i <= i <= m.
% //////////////////////////////////////////////////////////////////////////
function [X] = Resolve_com_LU(C, B, P)
[n, m] = size(B);
X = zeros(n, m);
Y = zeros(n, m);

% Criamos variáveis para armazenar explicitamente as matrizes L e U em C.
L = tril(C, -1) + eye(n);
U = triu(C);

% Seja A = P{-1}LU, Ux = y.
% Temos Ax = LUx = Pb, entao Ly = Pb.
% Resolvemos primeiro Ly = Pb, então resolvemos Ux = y.

%% Resolvo Lyi = Pbi para achar yi
B = P*B;

% Acha o primeiro elemento por substituição direta.
Y(1, :) = B(1, :) / L(1, 1);

% Itera sobre as colunas de Y
for i = 1 : m
  % Calcula todos os yi, sendo Axi = LUxi = Lyi = b
  % Itera sobre as linhas de Y
  for g = 2:n 
    Y(g, i) = B(g, i) - dot(L(g, 1:g-1), Y(1:g-1, i));
  end
end


%% Resolvo Uxi = yi, para achar xi
% Acha o primeiro elemento por retrosubstituição direta.
 X(n, :) = Y(n, :) / U(n, n);

% Itera sobre as colunas de X
for i = 1 : m
  % Calcula todos os xi que são solução dos sistemas Uxi = yi.
  % Itera sobre as linhas de X
  for f = n-1:-1:1
    X(f, i) = (Y(f, i) - dot(U(f, f+1:n), X(f+1:n, i))) / U(f, f);
  end
end


end % Fim da função.
