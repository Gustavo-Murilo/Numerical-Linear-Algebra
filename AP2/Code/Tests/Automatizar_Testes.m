n = [10, 100, 1000, 2000, 5000, 10000, 15000, 20000];
velocidade_a = zeros(1, 8);
velocidade_b = zeros(1, 8);

for i = 1 : 8
  velocidade_a(i) = Testar_Velocidade(n(i), 'a');
  velocidade_b(i) = Testar_Velocidade(n(i), 'b');
end

diff = velocidade_a - velocidade_b;