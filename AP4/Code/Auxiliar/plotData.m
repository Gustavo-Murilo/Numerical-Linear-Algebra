function plotData(X, y)
%   PLOTDATA Plota os pontos cujas coordenadas estão na matriz X e as classes em y 
%   PLOTDATA(X,y) plota os exemplos da classe positiva com + e 
%   exemplos da classe negativa com o . X é assumida como sendo uma matriz Mx2, 
onde M é o número de exemplos.

Cria uma nova Figure
figure; 

Encontra os indices dos exemplos positivos
pos = find(y==1);

Encontra os indices dos exemplos negativos
neg = find(y==-1);

plota os exemplos
plot(X(pos, 1), X(pos, 2), 'k+', 'LineWidth', 2, 'Markersize', 7);

plot(X(neg, 1), X(neg, 2), 'ko', 'MarkerFaceColor', 'y', 'Markersize', 7);


end
