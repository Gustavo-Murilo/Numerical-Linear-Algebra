= Problema 2

=== Modelagaem

Para essa questão, temos duas bases de dados, uma para o treinamento de um modelo, uma função que identifica se pacientes tem câncer. 

Considerando a base de dados para treinamento, construímos com suas 10 primeiras uma matriz $D_1 in RR^(280 times 10)$, onde cada linha representa um paciente e cada dimensão representa uma característica supostamente relevante para a identificação de câncer de mama. A última coluna da base de dados, representada por $b_1 in RR^280$, contém em cada linha a informação sobre a presença ($1$) ou ausência ($-1$) de câncer no paciente da linha correspondente em $D_1$.

Queremos um modelo que com base nos valores das 10 características supracitadas retorne se o paciente tem ou não câncer. Para essa classificação, definimos um hiperplano $H$ que divide o nosso espaço ($RR^10$) em dois. De modo que, os pontos abaixo dele representam os pacientes saudáveis, enquanto os pontos que coincidem ou estão acima de $H$ representam os pacientes que têm câncer. 

#v(-1em)

$ H: alpha_0 + sum^(10)_(i = 1) alpha_i #h(.2em) x_i  = 0 $

Queremos então achar o conjunto de constantes que tragam o melhor encaixe do hiperplano ao conjunto de dados (os $280$ pontos em $RR^10$). Isto é, queremos fazer uma regressão linear. Para isso, construímos a seguinte matriz

#v(-.5em)

$ M_1 = mat(delim: "[", 1, |; dots.v, D_1; 1, |) $

Dispondo dessa matriz, usamos o MMQ para descobrir o vetor $accent(y_1,"-")$ que contém as constantes desejadas. Assim, basta resolver a equação

$ (M_1)^T #h(.2em) M_1 #h(.2em) accent(y_1,"-") = (M_1)^(T) #h(.2em) b $

No MATLAB, uso a função "Gaussian_Elimination_4" que retorna o seguinte vetor:

#v(-0.0em)

$ accent(y,"-") = mat(delim: "[", alpha_0; alpha_1; alpha_2; alpha_3; alpha_4; alpha_5; alpha_6; alpha_7; alpha_8; alpha_9; alpha_10)
=
mat(delim: "[", -6.21; 15.90; 1.55; -5.07; -7.18; 1.27; -0.92; 0.52; 1.95; -0.04; 0.77) $

Quanto à base de dados de teste, construímos de forma análoga as matrizes notadas por $D_2$ e $b_2$ e $M_2$.

Treinado o modelo, é esperado que ele classifique bem os dados do treinamento (é claro) assim como outra amostras, o que indica que o modelo possui capacidade de generalização.

Para classificar os pacientes em cada base de dados, basta multiplicar a matriz ($M_1$ ou $M_2$) pelo vetor $accent(y,"-")$. Fazemos isso obtendo, $p_1, p_2 in RR^240$, que são previsões de câncer em pacientes. 

=== Matriz de Confusão 

Uma matriz de confusão é, essencialmente, uma matriz que contém a quantidade de previsões acetadas, positivo verdadeiro ($P_V$) e negativo verdadeiro ($N_V$), e quantidade de previsões erradas, falso positivo ($P_F$) e falso negativo ($N_F$). Essas informações são dispostas na forma:


 #align(center)[ #table(align: center, columns: 2, [$P_V$], [$N_F$], [$P_F$], [$N_V$]) ] 

Dela, obtemos algumas métricas: 

#align(center)[
  #box(height: 4em, [
    #columns(3, gutter: -6em,)[
      Acurácia = $(P_V + N_V) / (P_V + P_F + N_F + N_V)$
      
      #h(-3.5em) Precisão = $(P_V) / (P_V + P_F)$
      
      #h(-1em) Recall = $(P_V) / (P_V + N_F)$
      
      #h(2em) Falso Alarme = $(P_F) / (P_F + N_V)$

      #h(0em) Omissão de Alarme = $(N_F) / (P_V + N_F)$
    ] 
  ] )
]

#h(-.7em) Dos exemplos, obtivemos os seguintes dados:

#v(1em)

===== Treinamento

#align(center)[
  #box(height: 3em, width: 3em, [
    #columns(2, gutter: -10em,)[
      #v(1em)
      #h(-15em)
      $C_1 = $
      #align(center)[ #table(align: center, columns: 2, [$106$], [$14$], [$8$], [$152$]) ] 
    ] 
  ] )
]

#align(center)[
  #box(height: 4em, [
    #columns(3, gutter: -6em,)[
      #h(-3.5em) Acurácia = $0.921$
      
      #h(-3.5em) Precisão = $0.929$
      
      #h(-7em) Recall = $0.883$
      
      #h(-4em) Falso Alarme = $0.05$

      #h(-4em) Omissão de Alarme = $0.116$
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
      $C_2 = $
      #align(center)[ #table(align: center, columns: 2, [$80$], [$6$], [$25$], [$169$]) ] 
    ] 
  ] )
]

#align(center)[
  #box(height: 4em, [
    #columns(3, gutter: -6em,)[
      #h(-3.5em) Acurácia = $0.889$
      
      #h(-3.5em) Precisão = $0.761$
      
      #h(-7em) Recall = $0.930$
      
      #h(-4em) Falso Alarme = $0.128$

      #h(-4em) Omissão de Alarme = $0.069$
    ] 
  ] )
]

Como esperado, o modelo é, no geral, mais preciso ao classificar os dados que usou para o seu treino. Ainda assim, vemos números relativamente pequenos de erros no teste, o que indica que o modelo tem uma boa capacidade de generalização.

No exemplo, o exemplo classificou menos falsos negativos sobre a base de teste. Não podemos tirar nenhuma conclusão desse acontecido. Contudo, vale ressaltar que é no mínimo uma feliz coincidência que os piores casos, aqueles que a pessoa tem a doença e não é notificada para iniciar o tratamento, são os que menos acontecem.

// 2 - Implementação no MATLAB
#rect(width: 100%, radius: (rest: 4pt), stroke: 1pt + black, fill: rgb(255, 255, 240))[
  #text(weight: "bold")[2 - Implementação no MATLAB]
]

*Matriz_Confusao.m* -- Função

```matlab
function [C, acuracia, precisao, recall, alarme_falso, omissao] =   Matriz_Confusao(prev ,info)

  PV = dot((info >= 0), (prev >= 0));  % Positivo Verdadeiro
  NF = dot((info >= 0), (prev < 0));   % Falso Negativo
  PF = dot((info < 0), (prev >= 0));   % Falso Positivo
  NV = dot((info < 0), (prev < 0));    % Negativo Verdadeiro

  C = [PV, NF; PF, NV];

  acuracia = (PV + NV) / (PV + NF + PF + NV);
  precisao =        PV / (PV + PF);
  recall =          PV / (PV + NF);
  alarme_falso =    PF / (PF + NV);
  omissao =         NF / (NF + PV);
end
```

*Questao_2.m* -- Script

```matlab
Data_cancer_train = readmatrix("cancer_train_2024.csv");
Data_cancer_test = readmatrix("cancer_test_2024.csv");

samples_train = Data_cancer_train(:, 1:10);
sign_train = Data_cancer_train(:, 11);
samples_test = Data_cancer_test(:, 1:10);
sign_test = Data_cancer_test(:, 11);

% Obtem as dimensoes da matriz com as amostras
n = size(samples_train, 1);
m = size(samples_train, 2);

A = [ones(n, 1), samples_train];
% Obtem, usando minimos quadrados, os parametros para regressao linear
y = Gaussian_Elimination_4((A' * A), (A' * sign_train));
prev_1 = A * y;

B = [ones(n, 1), samples_test];
% Usamos o modelo para classificar os dados do teste
prev_2 = B * y;

[C_trn, ac_trn, pr_trn, rc_trn, fa_trn, oa_trn] = Matriz_Confusao(prev_1, sign_train);

[C_tst, ac_tst, pr_tst, rc_tst, fa_tst, oa_tst] = Matriz_Confusao(prev_2, sign_test);
```

*Resultados* - Terminal
```matlab
C_trn =
   106    14      % PV  NF
     8   152      % PF  NV

ac_trn = 0.92143  % Acurácia
pr_trn = 0.92982  % Precisão
rc_trn = 0.88333  % Recall
fa_trn = 0.05     % Falso Alarme
oa_trn = 0.11667  % Omissão de Alarme

```

```matlab
C_tst =
    80     6
    25   169

ac_tst = 0.88929  % Acurácia
pr_tst = 0.7619   % Precisão
rc_tst = 0.93023  % Recall
fa_tst = 0.12887  % Falso Alarme
oa_tst = 0.069767 % Omissão de Alarme
```