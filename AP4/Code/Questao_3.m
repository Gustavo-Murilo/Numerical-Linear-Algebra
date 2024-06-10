% Seleçao das variaveis que contribue mais que 10%
index = abs(y)/sum(abs(y)) > 0.30;
% index = [1,1,0,1,1,0,0,0,0,0,0]
index(1) = 1 % garante que a coluna de 1's permanecerá para o MMQ

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
[C_trn, ac_trn, pr_trn, rc_trn, fa_trn, oa_trn] = Matriz_Confusao(prev_1, sign_train)
[C_tst, ac_tst, pr_tst, rc_tst, fa_tst, oa_tst] = Matriz_Confusao(prev_2, sign_test)
