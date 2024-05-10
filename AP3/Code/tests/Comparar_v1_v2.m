function Comparar_v1_v2(repeticoes, A, x0, E, M)

tempos_1 = zeros(repeticoes, 1);
tempos_2 = zeros(repeticoes, 1);

for i = 1 : repeticoes
  % Tempo da primeira versao da função
  v1 = @() Metodo_potencia_v1(A, x0, E, M);
  tempos_1(i) = timeit(v1);

  % Tempo da segunda versao da função
  v2 = @() Metodo_potencia_v2(A, x0, E, M);
  tempos_2(i) = timeit(v2);
end

% Plotando os resultados dos tempos de execução
plot(tempos_1, 'DisplayName', 'Método Potência V1', 'LineWidth', 1.5);
hold on;
plot(tempos_2, 'DisplayName', 'Método Potência V2', 'LineWidth', 1.5);
hold off;
title('Tempo de Execução');
xlabel('Teste');
ylabel('Tempo');
legend('Location', 'best');
grid on;

% Calcula a média dos tempos de execução
media_1 = mean(tempos_1);
media_2 = mean(tempos_2);

% Exibir média dos tempos de execução
fprintf('Tempo médio da versão 1: %.3f microsegundos\n', media_1 * 1e6);
fprintf('Tempo médio da versão 2: %.3f microsegundos\n', media_2 * 1e6);

end