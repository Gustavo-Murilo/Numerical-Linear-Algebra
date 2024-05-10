% ///////////////////////////////////////////////////////////////////
% Variáveis de entrada:
% A: matriz nxn;
% s: sentido do calculo do raio ("col", "lin").
% ///////////////////////////////////////////////////////////////////
function [alfas] = Discos_Gershgorin(A, s)
  % Definiçao de variaveis
  n = size(A, 1);
  d = diag(A);
  M = abs(A);
  centros = [real(d), imag(d)];
  raios = zeros(n, 1);
  alfas = zeros(3*n, 1);

  % Localizaçao dos autovetores no plano de Argand-Gauss
  eigval = [real(eig(A)), imag(eig(A))];

  % Caclculo dos raios dos discos de Gershgorin
  for i = 1 : n
    if (s == "col") 
      % Soma na coluna
      raios(i) = sum(M(1:i-1, i)) + sum(M(i+1:n, i));
    else 
      % Soma na linha
      raios(i) = sum(M(i, 1:i-1)) + sum(M(i, i+1:n));
    end

    %Define os pontos de interesse
    alfas(i) = centros(i, 1);
    alfas(n+i) = centros(i, 1) - raios(i);
    alfas(n+i+1) = centros(i, 1) + raios(i); 
  end

  D = [centros, raios];

  Plotar_Discos(D,eigval); % Plota os discos de Gershgorin
end

function Plotar_Discos(D,eigval)
  n = size(D,1);
  
  % Plotagem dos Circulos
  for i = 1 : n
    center = Desenhar_Circulo(D(i,:));
  end
  
  % Plotagem de marcadores para so autovalores de A
  for i = 1 : n
    eigloc = plot(eigval(i,1), eigval(i,2), 'ro');
  end

  % Opçoes de plotagem
  axis normal;
  grid on;
  hold off;
  
  mycolors = ["#8040E6";"#8040E6";"#1AA640";"#1AA640";"#DF0069";"#DF0069";];
  colororder(mycolors)

  legend(eigloc, 'Autovalor');
end

function [center] = Desenhar_Circulo(v)
  % Parametros do disco
  xCentro = v(1);
  yCentro = v(2);
  raio = v(3);
  
  % Conjunto de pontos da parametrizaçao
  theta = 0 : 0.01 : 2*pi;
  x = raio * cos(theta) + xCentro;
  y = raio * sin(theta) + yCentro;
  
  % Plotagem do circulo
  plot(x, y);
  hold on;

  % Plotagem de marcador para o centro
  center = plot(xCentro, yCentro, '+');
  hold on;
end

