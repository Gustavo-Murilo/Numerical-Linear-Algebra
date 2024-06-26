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
