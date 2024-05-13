function plotDB2(alfa, X, y)
% plotDB2 Plota pontos de coordenadas em X e classe em y
% com a curva de decisão definida por alfa
% plotDB2(alfa,X,y) plota pontos da classe positiva com + e 
%    da classe negativa com o. A matriz X pode ser: 
%    1) Mx3 : nesse caso a primeira coluna é toda de "uns" e 
%       a curva de decisão é uma reta.
%    2) MxN, N>3: nessa caso, a primeira coluna também é toda de "uns",
%        e a curva de decisão é traçada como a curva de nível = 0

% Plota os dados
plotData(X(:,2:3), y);

if size(X, 2) <= 3
%    Precisamos de dois pontos para traçar a reta
    plot_x = [min(X(:,2))-2,  max(X(:,2))+2];

%    Calcula a reta de decisão
    plot_y = (-1./alfa(3)).*(alfa(2).*plot_x + alfa(1));

%    Plota os pontos
    plot(plot_x, plot_y)
    
%    Define as legendas na figura
    legend('Aceito', 'Não aceito', 'Curva de Decisão')
%    axis([30, 100, 30, 100])
else
%   Grade para a superfície
%    
%    u = linspace(30,100,100)
%    v = linspace(30,100,100)
      u = linspace(min(X(:,2)),max(X(:,2)),100);
      v = linspace(min(X(:,3)),max(X(:,3)),100);

    z = zeros(length(u), length(v));
%    Calcula z = X * alfa para cada ponto da grade
    for i = 1:length(u)
        for j = 1:length(v)
            z(i,j) = geraCoord(u(i), v(j))*alfa;
        end
    end
    z = z'; % Faz a transposta para acertar a posição nos eixos

%  Plota a curva de nível z = 0 especificada por [0, 0]
%  
    contour(u, v, z, [0, 0], 'LineWidth', 2)
end


end
