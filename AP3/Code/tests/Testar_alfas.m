function [resultados] = Testar_alfas(A, x0, alfas)
  n = size(A,1);
  t = 3*n;
  lambdas = zeros(1, t);
  iteracoes = zeros(1, t);
  
  % Autovalores obtidos
  for i = 1 : t
    [lambdas(i), ~, iteracoes(i), ~] = Potencia_deslocada_inversa(A, x0, 1e-12, alfas(i), 200);
  end

  resultados = [lambdas; iteracoes];
  rotulos = ["Lambda: "; "k: "];

  resultados = [rotulos, resultados];
end