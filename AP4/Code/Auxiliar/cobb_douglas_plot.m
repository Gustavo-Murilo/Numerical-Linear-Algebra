% Define os valores de x e y
points = 20;
points = 15; % Para escala logaritimica

x = linspace(0, 300, points);
y = linspace(0, 300, points);

% Cria uma grade de valores
[X, Y] = meshgrid(x, y);

% Definiçao de constantes
a = 0.74461;
b = 1.0071;

% Calculos dos valores da funçao
Z = b .* X.^a .* Y.^(1-a);

figure;

% % Plotagem da funçao
% surf(X, Y, Z);
% xlabel('x');
% ylabel('y');
% zlabel('z');
% title('Função de Cobb-Douglas');

% Plotagem da funçao em escala logaritimica
surf(log(X), log(Y), log(Z));
xlabel('ln(x)');
ylabel('ln(y)');
zlabel('ln(z)');
title('Função de Cobb-Douglas (Escala Logarítmica)');

