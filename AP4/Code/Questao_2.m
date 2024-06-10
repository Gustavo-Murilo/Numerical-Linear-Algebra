% Extrai dados do csv
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
