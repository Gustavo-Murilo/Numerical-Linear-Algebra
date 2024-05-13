function X = geraCoord(X1, X2, grau)
% geraCoord gera as coordenadas do polinômio usado para a regressão
% 
%  grau = grau do polinômio a ser usado
%
%  geraCoord(X1, X2) gera a partir das entradas X1 e X2 as coordenadas
%  do polinômio que se deseja usar como curva (superfície) a ser ajustada
%  aos dados por mínimos quadrados
%  Retorna as novas coordenadas do tipo: 
%  X1, X2, X1.^2, X1*X2, X2.^2, etc... dependendo do grau que se deseja
%
%  X1, X2 de mesma dimensão
%

X = ones(size(X1,1),1);
for i = 1:grau
  for j = 0:i
    X = [X (X1.^(i-j)).*(X2.^j)];
  end
end

end
