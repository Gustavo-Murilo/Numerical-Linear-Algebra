= Problema 1 - Cobb-Douglas

#rect(width: 100%, radius: (rest: 4pt),stroke: 1pt + black, fill: rgb(255, 255, 240))[
  #heading(level: 2, [1 - a)]) 
]

A seguir está um modelo formulado por Charles Cobb e Paul Douglas, que estabelece a produção ($P$) em função do capital investido ($L$) e do trabalho ($K$). Esses valores são todos maiores ou iguais a 0.

#par(first-line-indent: 0.1em)[
Sejam $alpha, b in RR$, a função $g$: $(RR_(+))^(2) -> RR$. Considere a notação $P = g(L, K)$.
]

$ P = b L^alpha K^(1-alpha) $

Com base em um conjunto de dados, queremos obter os parâmetros $alpha$ e $b$ que melhor se encaixam com esses dados. Para isso, é preciso fazer uma regressão exponencial.

*Observação:* A fim de ser mais conciso, chamarei o Método dos Mínimos Quadrados, utilizado para resolver problemas de otimização, pela sua sigla MMQ.

=== Abordagem inicial (1) - MMQ sobre um plano

Um técnica para isso, é trabalhar com o conjuntos de dados em escala logarítmica, tornando a superfície que é a imagem da função em um plano. Assim, reduzimos a regressão exponencial a um simples problema de regressão linear sobre um novo conjunto de dados. 

Definida a função, vamos pegar uma restrição dela no nosso conjunto de dados. Sejam $L_1$, #h(0.1em) $K_1$, #h(0.1em) $P_1$ $in (RR)^(24)$. Temos que $P_1 = P|_(L_1 times K_1)$.

#align(center)[
  #box(height: 20em, width: 44em,
    columns(2, gutter: 10pt)[
      #figure()[
        #image("../Pictures/cobb_douglas.png", width: 100%)
        
        #text(size: 9pt)[
          $g(L,K)$ com $alpha = 0.74461$, $b = 1.0071$ \
          #v(0.05em)
          $P = b #h(0.1em) L^(alpha) #h(0.1em) K^((1 - alpha)) $
        ]
      ]
      
      #figure()[
        #image("../Pictures/cobb_douglas_log.png", width: 100%)
        
        #text(size: 9pt)[
          $ln(g(L,K))$ com $alpha = 0.74461$, $b = 1.0071$ \
          #v(0.05em)
          $ln(P) = ln(b) + alpha ln(L) + [1 - alpha] ln(K)$
        ]
      ]
    ]
  )
]

\ // Quebra de linha

Visto o efeito geométricos dessa mudança de escala, vamos ver a o efeito algébrico, o porquê dessas grandezas passarem a se relacionar de forma linear:

$ ln(P) = ln(b L^alpha K^(1 - alpha)) $
$ ln(P) = ln(b) + alpha ln(L) + [1 - alpha] ln(K) $

Essa é a parametrização de um plano em $(RR_+^*)^3$.Também note que os coeficientes de 2 direções estão relacionados, ambos dependem de $alpha$. Essa parametrização tem um propriedade interessante, ela possui um ponto fixo $p$, que pertence ao plano independente da escolha de $alpha$. 

Sobre isso, não é possível, utilizando o MMQ, garantir que os coeficientes encontrados satisfaçam essa condição. Então o modelo obtido pode não ser a função de Cobb-Douglas.

Aplicamos o logaritmo ao nosso conjunto de dados, obtendo os vetores $P_(ln)$, #h(0.1em) $L_(ln)$, #h(0.1em) $K_(ln)$ $in RR^(24)$.

Ignoramos a restrição (relação entre as variáveis) e fazemos uma regressão linear múltipla, obtendo os coeficientes para um plano em $RR^3$, que restringimos a $(RR_+)^3$. Para isso criamos a matriz

$ A = mat(delim:"[", 1, |, |; dots.v, L_(ln), K_(ln) ; 1, |, |)  $

Então utilizamos o MMQ para obter os coeficientes que descrevem a superfície que mais se aproxima do conjunto de dados. O que consiste em resolver para $accent(x,"-")$ a seguinte equação

$ A^(T) A accent(x,"-") = A^(T) P_(ln) $

Disso, obtemos o seguinte o plano

$ P_(ln) = -0.069 + 0.769 #h(.3em) L_(ln) + 0.247 #h(.3em) K_(ln) $

Então retornamos para escala anterior, enfim obtendo a função que melhor aproxima os dados. Então elevamos $e$ a cada lado da equação, obtendo

$ P = 0.933 #h(.3em) L^(0.769) #h(.3em) K^(0.247) $

O que não é a função de Cobb-Douglas como definida no problema, dado que $ 0.769 + 0.247 = 1.016 => 0.247 != 1 - 0.769 $.

=== Abordagem principal (2) - MMQ sobre uma reta 

Vide a inadequação da abordagem anterior, iremos resolver o problema de outra forma. Retomamos o problema a partir da seguinte equação:

$ ln(P) = ln(b) + alpha ln(L) + [1 - alpha] ln(K) $

Fazendo algumas manipulações algébricas, conseguimos relacionar esses dados sobre uma reta. O que torna possível a obtenção destes parâmetros com uma regressão linear simples.

$ [ln(P) - ln(K)] = ln(b) + alpha #h(0.3em) [ln(L) - ln(K)] $

$ underbrace(ln(P \/ K), "y") = ln(b) + alpha #h(0.3em) underbrace(ln(L \/ K), "x") $

Sejam $y, x in RR^(24)$, $B in RR^(24 times 2)$. Convém reescrever a equação em forma matricial

$ y =  mat(delim:"[", 1, |; dots.v,  x; 1, |) mat(delim:"[", ln(b); alpha) = B mat(delim:"[", ln(b); alpha) = B #h(0.2em) c $

Então, para achar $alpha$ e $ln(b)$, os coeficientes da reta que melhor se encaixa aos pontos, usamos o MMQ, o que consiste em resolver para $accent(c,"-")$ a seguinte equação:

$ B^(T) #h(.1em) B #h(.2em) accent(c,"-") = B^(T) #h(.1em) y $

Fazendo isso, obtemos os parâmetros da função de Cobb-Douglas

$ accent(c,"-") = mat(delim:"[", 0.007044; 0.74461) = mat(delim:"[", ln(b); alpha) $

$ => #h(.5em) a = 0.74461 #h(.2em) , #h(1.3em) e^(ln(b)) = b = 1.0071  $

Valendo que 

$ P = 1.0071 #h(.3em) L^(0.74461) #h(.3em) P^(0.25539) $

$ P approx.eq 1.007 #h(.3em) L^(0.745) #h(.3em) P^(0.255) $.


#rect(width: 100%, radius: (rest: 4pt), stroke: 1pt + black, fill: rgb(255, 255, 220))[
  #heading(level: 2, [1 - b)]) 
]

No item anterior, concluí que a segunda abordagem é a mais adequada porque o modelo obtido nela é a função de Cobb-Douglas. Já na primeira abordagem, obtemos uma função que aproxima bem a função de Cobb-Douglas, apresentando diferenças significativas apenas para valores maiores de L e K.

O resultado dos dois modelos é muito parecido. No intervalo que tomamos L e K, ambas as funções aproximam bem os dados reais. Inclusive, a soma dos erros ao quadrado (SEQ) dos dois modelos é bem parecida.


#align(center)[
  #table( 
    align: center,  columns: 4,

    [ Ano ], [ P (Real) ], [ P (Abordagem 1) ], [ P (Abordagem 2) ],
  
    [1910], [159], [161,86], [161,76],
    
    [1920], [231], [236,49], [236,07]
  )
]

#align(center)[
  #table( 
    align: center,  columns: 3,

    [ ] , [ Abordagem 1 ], [ Abordagem 2 ],
  
    [SEQ], [2702.8], [2670.7],
  )
]

#v(7em)

#rect(width: 100%, radius: (rest: 4pt), stroke: 1pt + black, fill: rgb(255, 255, 240))[
  #text(weight: "bold")[1 - Implementação no MATLAB]
]

*Obtenção dos dados*
```matlab
>> Data = readmatrix("Datasets/cobb_douglas.csv"); 

% Vetores com a amostragem
>>  Anos = Data(:,1); P = Data(:,2); L = Data(:,3); K = Data(:,4); 

% Transformação de escala
>> P_ln = log(P); L_ln = log(L); K_ln = log(K); 

n = size(P, 1); 
```

*Abordagem_1.m* -- Script
```matlab
A = [ones(n, 1), L_ln, K_ln]; 

x = Gaussian_Elimination_4((A' * A), (A' * P_ln));
% x = [-0.069214,   0.76887,    0.24711]

b_1 = exp(x(1)); % b = 0.93313

SEQ_1 = sum( (P - b_1 .* L.^x(2) .* K.^x(3) ) .^ 2 );
% SEQ_1 = 2702.8

resultado_1 = [Anos, P, (b_1 .* L.^x(2) .* K.^x(3))];

resultado_1;
% Ano         P     Abordagem_1
% 1899       100       100.44
% 1900       101       106.03
% 1901       112       111.63
% 1902       122       119.03
% 1903       124        125.1
% 1904       122       125.93
% 1905       143       131.58
% 1906       152       141.92
% 1907       151        149.6
% 1908       126        137.1
% 1909       155       156.54
% 1910       159       161.86 <----
% 1911       153       164.23
% 1912       177       172.08
% 1913       184        174.8
% 1914       169       172.76
% 1915       189       180.04
% 1916       225       209.35
% 1917       227       228.95
% 1918       223       236.73
% 1919       218       235.41
% 1920       231       236.49 <----
% 1921       179       191.21
% 1922       240       207.83
```

*Abordagem_2.m* -- Script
```matlab
y_2 = log(P./K); x_2 = log(L./K);
B = [ones(length(P), 1), x_2];

c = Gaussian_Elimination_4((B' * B), (B' * y_2));

alpha = c(2); % alpha = 0.74461

b_2 = exp(c(1)); % b = 1.0071

SEQ_2 = sum((P - b_2 .* L.^(alpha) .* K.^(1 - alpha)).^2);
% SEQ_2 = 2670.7

resultado_2 = [Anos, P, (b_2 .* L.^(alpha) .* K.^(1 - alpha))];
% Ano         P      Abordagem_2
% 1899       100       100.71
% 1900       101       106.25
% 1901       112       111.79
% 1902       122       119.09
% 1903       124       125.12
% 1904       122       126.02
% 1905       143       131.66
% 1906       152       141.87
% 1907       151       149.48
% 1908       126       137.48
% 1909       155       156.49
% 1910       159       161.76 <----
% 1911       153       164.16
% 1912       177       171.88
% 1913       184       174.62
% 1914       169       172.74
% 1915       189       180.04
% 1916       225       208.73
% 1917       227       228.06
% 1918       223        235.9
% 1919       218       234.84
% 1920       231       236.07 <----
% 1921       179       192.23
% 1922       240        208.5
```