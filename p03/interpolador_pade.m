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
% maclaurem especifico para e^x

function a = fCalcCoefMacParaEx(n)
  a(1) = 1;
  for i = 2 : n+1
      a(i) = 1 / factorial(i-1);
  end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% funcao de pade

function [a b] = fPade(npade, mpade, c)
  % valido para n=n ou n=m+1
  % calcular os b´s via sistema de eqs.
  k = npade - mpade;

  for i = 1:mpade
    for j = 1:i
      A(i,j) = c(k+i+j);
      A(j,i) = A(i,j);
    end
    B(i) = -c(npade+i+1);
  end

  aux = A \ transpose(B);

  % b começa de 1, igual no texto, e fliplr() inverte os indices do vetor
  b = fliplr( transpose(aux) );

  % completandoo vetor b:
  b(mpade+1 : npade) = 0;
  b = [1 b]; % incluindo o 1º b, unitario

  % calcular os As
  a(1) = c(1);
  for i = 2:npade+1
    S = c(i);
    for j = 1:i-1
      S = S + b(j+1)*c(i-j);
    end
    a(i) = S;
  end

  b = b(1 : mpade+1);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% main.m

format long;

% pontos de plotagem do grafico, ou seja, valores de x (poderia ser so um)
% calcular os pontos x(i) onde o polinomio devera passar
% -1 e 1 sao os limites de continuidade
tp = -1:0.01:1;

% y exato
yep = exp(tp);

% auxiliares
n = 5;
m = 5;
M = n + m;

% calcula coeficientes para o pade que sao os mesmos de maclauren
c = fCalcCoefMacParaEx(M);

% calcula valor aproximado
[a b] = fPade(n, m, c);
%
% https://www.gnu.org/software/octave/doc/interpreter/Arithmetic-Ops.html
% . significa elemento por elemento
ypp = fPnHorner(n, a, tp) ./ fPnHorner(m, b, tp);

% calculo erro
erro_pade = abs(ypp .- yep);
erroMax_pade = max(erro_pade)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
