% Repetições e pré-alocação de variáveis
repeticoes = 100;

tempos_1 = zeros(repeticoes, 1);
tempos_2 = zeros(repeticoes, 1);

media_1 = zeros(4, 1);
media_2 = zeros(4, 1);

for s = 1 : 4
  for i = 1 : repeticoes
    % Tempo da primeira versao da função
    v1 = @() Metodo_potencia_v1(A_1, x0_1, E, M);
    tempos_1(i) = timeit(v1);
    
    % Tempo da segunda versao da função
    v2 = @() Metodo_potencia_v2(A_1, x0_1, E, M);
    tempos_2(i) = timeit(v2);
  end
  
  % Calcula a média dos tempos de execução
  media_1(s) = mean(tempos_1);
  media_2(s) = mean(tempos_2);
  
  % Plotando os resultados dos tempos de execução
  subplot(2,2,s)
  plot(tempos_1, 'DisplayName', 'Método Potência V1', 'LineWidth', 1.5);
  hold on;
  plot(tempos_2, 'DisplayName', 'Método Potência V2', 'LineWidth', 1.5,'Color', 'orange');
  hold off;
  title(['Tempo - ', num2str(s)]);
  xlabel('Teste');
  ylabel('Tempo');
  legend('Location', 'best');
  grid on;
end

% Calcula a média dos tempos de execução
media_total_1 = mean(media_1);
media_total_2 = mean(media_2);

% Exibir média dos tempos de execução
fprintf('Tempo médio da versão 1: %.3f microsegundos\n', media_total_1 * 1e6);
fprintf('Tempo médio da versão 2: %.3f microsegundos\n', media_total_2 * 1e6);
