= Problema 3

O vetor $accent(y,"-")$ obtido no item anterior, representa os coeficientes da combinação linear das colunas de M_1 que melhor descrevem os dados. O valor $accent(y,"-")_i$ representa a contribuição da i-ésima variável ($x_i$) para a identificação do câncer de mama.

Sabendo disso, verificamos as coordenadas com valores mais próximos de 0 e escolhemos, dentro de uma faixa, as colunas (característica) a descartar.

Após alguns testes, percebi que ao consideras apenas as variáveis $(x_1, x_3, x_4)$, conseguimos um resultado que tem um desempenho que se equipara ao modelo atual. 

Se diminuíssemos para uma única variável, a mais relevante ($x_1$), por incrível que pareça, os resultados só seriam um pouco piores, teria aproximadamente $-0,08$ de precisão e acurácia do que quando consideramos essas 3 variáveis. Contudo, a quantidade de omissões subiria ainda mais, por volta de 25% dos pacientes com câncer não seriam identificados. 

Percebi que ao diminuir a quantidade de informação, mantendo sempre o que é mais relevante, as taxas de acurácia e precisão diminuem mais rápido do que a taxa de falso alarme cresce. 

Retomando o problema, ao considerar as variáveis escolhidas,  criamos um novo hiperplano $H_2 subset RR^4$ , tal que

$ H_2: beta_0 + beta_1 x_1 + beta_3 x_3 + beta_4 x_4 = 0 $

Bem como obtemos um novo modelo resolvendo para $accent(y_2,"-")$ a equação:

$ mat(delim:"[", 1, dots, 1; dash.em,x_1#h(.2em)^T, dash.em ; dash.em, x_3 #h(.2em)^T, dash.em ; dash.em, x_4 #h(.2em)^T , dash.em)  

 mat(delim:"[", 1, |, |, |; dots.v, x_1, x_3, x_4; 1, |, |, |)  

 mat(delim:"[", beta_0; beta_1; beta_3; beta_4) 
 
 =  mat(delim:"[", 1, dots, 1; dash.em,x_1#h(.2em)^T, dash.em ; dash.em, x_3 #h(.2em)^T, dash.em ; dash.em, x_4 #h(.2em)^T , dash.em)  

 mat(delim:"[", | ; b; |) 
 $

$ ==> (N_1)^T #h(.2em) N_1 #h(.2em) accent(y_2,"-") = (N_1)^(T) #h(.2em) b $

Resolvendo no MATLAB, obtemos

$ accent(y_2,"-") = mat(delim:"[", -4.267; -9.502; 21.625; -6.414 ) $

Analogamente, definimos $N_2$, a matriz com as variáveis selecionadas na base dados de tes. Disso, calculamos as previsões desse novo modelo

$ "prev"_1 = N_1 * accent(y_2,"-") $

$ "prev"_2 = N_2 * accent(y_2,"-") $

Comparando as previsões e os dados reais, criamos matrizes de confusão.
Ao analisar essas matrizes e as métricas advindas delas, constata-se que a adequação do modelo à base de treinamento foi quase tão precisa quanto a anterior, mesmo tendo sido criada usando menos de $1/3$ da informação original.

Outra coisa interessante é que o cenário se inverteu, agora o modelo apresenta uma maior acurácia no teste quando comparado ao treinamento.

Embora as métricas de assertividade (Acurácia, Precisão) estejam relativamente altas, há um aumento considerável nas taxas de "Omissão de Alarme". Sobre a base de treino, essa taxa é 60% maior. Quanto à base de dados teste, uma omissão de alarme é 130% mais provável de acontecer, teríamos que 16% dos pacientes com câncer não seriam notificados ao invés de 6,9%. 

Sendo este um modelo para classificar câncer em pacientes, entregar um falso negativo é o que mai se quer evitar. Como a doença é melhor combatida quando identificada em e tratada nos estágios iniciais de seu desenvolvimento, seria muito ruim que alguém que precisasse iniciar um tratamento não o fizesse.

Por fim, constatamos que, de fato, as variáveis não têm a mesma importância para o diagnóstico. Considerando poucas variáveis, é possível treinar um modelo que classifica de forma eficiente os pacientes. Contudo, ao considerar um conjunto maior de informação, algumas métricas são mais favoráveis para a situação. Pensando em mitigar a quantidade de erros graves, acho que o mais adequado é manter o modelo inicial ($H_1$) que considera todas as variáveis possíveis.

===== Treinamento

#align(center)[
  #box(height: 3em, width: 3em, [
    #columns(2, gutter: -10em,)[
      #v(1em)
      #h(-15em)
      $C_1^* = $
      #align(center)[ #table(align: center, columns: 2, [$98$], [$22$], [$10$], [$150$]) ] 
    ] 
  ] )
]

#align(center)[
  #box(height: 4em, [
    #columns(3, gutter: -6em,)[
      #h(-3.5em) Acurácia = $0.885$
      
      #h(-3.5em) Precisão = $0.907$
      
      #h(-7em) Recall = $0.816$
      
      #h(-4em) Falso Alarme = $0.062$

      #h(-4em) Omissão de Alarme = $0.183$
    ] 
  ] )
]

#v(1em)

===== Teste

#align(center)[
  #box(height: 3em, width: 3em, [
    #columns(2, gutter: -10em,)[
      #v(1em)
      #h(-15em)
      $C_2^* = $
      #align(center)[ #table(align: center, columns: 2, [$72$], [$14$], [$11$], [$183$]) ] 
    ] 
  ] )
]

#align(center)[
  #box(height: 4em, [
    #columns(3, gutter: -6em,)[
      #h(-3.5em) Acurácia = $0.91$
      
      #h(-3.5em) Precisão = $0.867$
      
      #h(-7em) Recall = $0.837$
      
      #h(-4em) Falso Alarme = $0.056$

      #h(-4em) Omissão de Alarme = $0.162$
    ] 
  ] )
]

#rect(width: 100%, radius: (rest: 4pt), stroke: 1pt + black, fill: rgb(255, 255, 240))[
  #text(weight: "bold")[3 - Implementação no MATLAB]
]

*Questao_3.m* - Script
```matlab
% Seleçao das variaveis que contribue mais que 5%
index = abs(y)/sum(abs(y)) > 0.10;
% index = [1,1,0,1,1,0,0,0,0,0,0]
index(1) = 1; % garante que a coluna de 1's permanecerá para o MMQ

% Matriz com apenas as variaveis desejadas
A_2 = A(:,index);
B_2 = B(:,index);

% Novo modelo
y_2 = Gaussian_Elimination_4((A_2' * A_2), (A_2' * sign_train));
% y_2 = [-4.2677, -9.5029, 21.625, -6.4148]

% Novas previsoes
prev_1 = A_2 * y_2;
prev_2 = B_2 * y_2;

% Matrizes de confusao sobre os novos resultados
[C_trn, ac_trn, pr_trn, rc_trn, fa_trn, oa_trn] =  Matriz_Confusao(prev_1, sign_train);

[C_tst, ac_tst, pr_tst, rc_tst, fa_tst, oa_tst] = Matriz_Confusao(prev_2, sign_test);

```

*Resultados* - Terminal

```matlab
C_trn =
    98    22     % PV  NF
    10   150     % PF  NV

ac_trn = 0.88571 % Acurácia
pr_trn = 0.90741 % Precisão
rc_trn = 0.81667 % Recall
fa_trn = 0.0625  % Falso Alarme
oa_trn = 0.18333 % Omissão de Alarme
```

```matlab
C_tst =
    72    14      % PV  NF
    11   183      % PF  NV

ac_tst = 0.91071  % Acurácia
pr_tst = 0.86747  % Precisão
rc_tst = 0.83721  % Recall
fa_tst = 0.056701 % Falso Alarme
oa_tst = 0.16279  % Omissão de Alarme
```