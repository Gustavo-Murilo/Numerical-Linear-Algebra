% E: tamanho do erro aceitavel
% M: numero maximo de iteraçoes do metodo
function [media_1, media_2, media_3] = Comparar_tempo_dimensoes(E, M)

% Repetições e pré-alocação de variáveis
repeticoes = 1;
n = 400;

media_1 = zeros(8, 1);
media_2 = zeros(8, 1);
media_3 = zeros(8, 1);

for i = 50 : 50 : n
    % Cria uma matriz quadrada com valores de 1 a 3
    A = randi(3, i, i);
    A = A' * A; % Cria matriz simétrica
    
    % Cria um palpite do autovetor dominante
    x0 = ones(i, 1);

    tempos_1 = zeros(repeticoes, 1);
    tempos_2 = zeros(repeticoes, 1);
    tempos_3 = zeros(repeticoes, 1);
    
    for j = 1 : repeticoes
        % Tempo da primeira versao da função
        v1 = @() Metodo_potencia_v1(A, x0, E, M);
        tempos_1(j) = timeit(v1);
    
        % Tempo da segunda versao da função
        v2 = @() Metodo_potencia_v2(A, x0, E, M);
        tempos_2(j) = timeit(v2);

        % Tempo da segunda versao da função
        v3 = @() Potencia_deslocada_inversa(A, x0, E, 5.48679898, M);
        tempos_3(j) = timeit(v3);
    end
    
    % Calcula a média dos tempos
    media_1(i) = mean(tempos_1);
    media_2(i) = mean(tempos_2);
    media_3(i) = mean(tempos_3);
end

% Plotando os resultados dos tempos de execução
figure;
plot(50:50:n, media_1(1), 'DisplayName', 'Método Potência V1', 'LineWidth', 1.5);
hold on;
plot(50:50:n, media_2(1), 'DisplayName', 'Método Potência V2', 'LineWidth', 1.5);
hold on;
plot(50:50:n, media_3(1), 'DisplayName', 'Método Potência V3', 'LineWidth', 1.5);
hold off;
title('Tempo de Execução');
xlabel('Dimensão');
ylabel('Tempo');
legend('Location', 'best');
grid on;


% Calcula a média dos tempos de execução
dif = mean(media_1 - media_2);

% Exibir média dos tempos de execução
fprintf('A versão 2 é em media %.3f microsegundos\n mais rápida que a versão 1.', dif * 1e6);

fprintf('\nMedia versão 1.', mean(media_1) * 1e6);
fprintf('\nMedia versão 2.', mean(media_2) * 1e6);
fprintf('Media versão 3.', mean(media_3) * 1e6);

end
