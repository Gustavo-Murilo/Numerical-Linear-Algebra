= Problema 5

=== espectro.m

#box(
  height: auto, width: 100%, fill: rgb(248, 248, 255),
  inset: 10pt, radius: 5pt, [
  ```matlab
  % Entradas:
  %   A - matriz (n x n)
  % Saídas:
  %   S = vetor (n x 1) ortogonal
  function [S] = espectro(A, tol) 
    % Definição de variáveis
    erro = tol + 1;
    S = diag(A);

    while tol <= erro
      % Processo iterativo
      [Q, R] = qr_GSM(A);
      A = R * Q;
      
      % Verificação de convergência
      novo_S = diag(A);
      erro = norm(S - novo_S,'inf');

      S = novo_S; % Atualiza o resultado
    end
  end
  ```
  ] )



#box(
  height: auto, width: 100%, fill: rgb(255, 255, 235),
  inset: 10pt, radius: 2pt, [
```matlab
>> M = randi(9,5,5);

>> M = M'*M;

>> flip(eig(M))
       606.58
        61.75
       29.118
       4.9587
      0.58848

>> S = espectro(M, 1e-6)
       606.58
        61.75
       29.118
       4.9587
      0.58848
   ``` ] )


#box(
  height: auto, width: 100%, fill: rgb(255, 255, 235),
  inset: 10pt, radius: 2pt, [
```matlab
>> N = randi(9,10,10);
>> N = N'*N;
>> S = espectro(N, 1e-12);
>> S - flip(eig(N))
   9.0949e-13
  -8.5265e-14
   1.4211e-14
  -1.4211e-14
   5.6843e-14
   3.5527e-14
  -1.3603e-11
   1.3443e-11
  -3.1974e-14
   1.9054e-13
    ``` ] )

#box(
  height: auto, width: 100%, fill: rgb(255, 255, 235),
  inset: 10pt, radius: 2pt, [
```matlab
>> O = randi(9,100,100)
>> O = O'*O;
>> norm(espectro(O,1e-12) - flip(eig(O)))
    3.9544e-10
   ``` ] )