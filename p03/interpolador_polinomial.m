%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% funcao que calcula o valor do polinomio conforme
% https://pt.wikipedia.org/wiki/Esquema_de_Horner#Descri.C3.A7.C3.A3o

function y = fPnHorner(n, a, xp)
  % calcula y para cada elemento de x
  for ip=1:length(xp)
    aux = a(n+1);
    for i=n:-1:1
      aux = a(i) + aux*xp(ip);
    end
    y(ip) = aux;
  end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% funcao que calcula coeficientes do polinomio (primeiro passo)

function coef = fCalculaCoefPn(n, x, y)
  % monta primeira matriz da formula 3b do capitulo 4 do livro
  A(i = 1 : n+1, 1) = 1;
  for i = 1 : n+1
    for j = 2: n+1
      A(i, j) = A(i,j-1) * x(i);
    end
  end

  % linha vira coluna
  b = transpose(y);

  % recurso do octave (metodo equivalente ao Gauss)
  coef = A\b;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% main

% limites da continuidade
a = 1;
b = 2;

% n + 1 sera o numero de coeficientes
n = 2

% calcular os pontos x(i) onde o polinomio devera passar
h = (b-a) / n;
x = a : h : b; % lista onde a e o começo, h e o range, e o b o limite

% função que sera aproximada e y ira ter os y(i)
y = log(x);

% coeficientes da interpolacao geral
coef = fCalculaCoefPn(n,x,y)

% pontos de plotagem do grafico, ou seja, valores de x (poderia ser so um)
% xp = a : h/20 : b
xp = 1.14

% valor exato
y_exato = log(xp)

% y aproximado
% horner eh para polinomios escritos na base canonica
% poderia ser outro metodo (e.g. briot-ruffini)
yap_geral = fPnHorner(n, coef, xp)

% calculo do erro
erro = abs(yap_geral - y_exato);
erromax = max(erro)

% plotagem do grafico (https://www.gnu.org/software/octave/doc/interpreter/Two_002dDimensional-Plots.html)
plot(xp, y_exato, '-r', xp, yap_geral, '..k')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
