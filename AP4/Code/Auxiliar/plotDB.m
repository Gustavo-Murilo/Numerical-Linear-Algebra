function plotDB(alfa,X,y)
%   plotDB Plota os pontos cujas coordenadas estão na matriz X (colunas 2 e 3)
%   e as classes em y com a reta de decisão das classes definida pelos parâmetros alfa
%   plotDB(alfa,X,y) plota os exemplos da classe positiva com + e 
%   exemplos da classe negativa com o . X é assumida como sendo uma matriz Mx3, 
%   onde M é o número de exemplos e a primeira coluna é toda de uns.

% Plota os exemplos

    plotData(X(:,2:3), y);

%   Só precisa de dois pontos para definir a reta. Pega duas abcissas nas extremidades
%   do conjunto de exemplos

    plot_x1 = [min(X(:,2))-2,  max(X(:,2))+2];

%   Determina as ordenadas correspondentes na reta de decisão

    plot_x2 = (-1./alfa(3)).*(alfa(2).*plot_x1 + alfa(1));

%   Plota a reta 

    plot(plot_x1, plot_x2)

%   Legenda, especifica para cada exercicio

    legend('Classe Positiva', 'Classe Negativa', 'Reta Decisória')

end
