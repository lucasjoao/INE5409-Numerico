%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% funcao que calcula o valor do polinomio conf
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

function a = fCalculaExMaclauren(n)
  a(1) = 1;
  for i = 2 : n+1
      a(i) = 1 / factorial(i-1);
  end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% main.m
% Aproximar f(x) = e^x, com x E [-1; +1]

% n + 1 sera o numero de coeficientes
n = 5;

% funcao que calcula coeficientes varia conforme diferentes f(x)
coeficientes = fCalculaExMaclauren(n);

% limites da continuidade
a = -1;
b = 1;

% calcular os pontos x(i) onde o polinomio devera passar
% pontos de plotagem do grafico, ou seja, valores de x (poderia ser so um)
np = 100;
xp = a : ((b-a)/np) : b;

% função que sera aproximada e yep ira ter os y(i)
yep = exp(xp);

% y aproximado
yap = fPnHorner(n, coeficientes, xp);

% calculo do erro
erros = abs(yap-yep);
erroMax = max(erros)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
