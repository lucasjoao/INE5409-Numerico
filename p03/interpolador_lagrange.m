%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% forma otimizada de calcular lagrange. Nao deve ser usada para avaliar xp = x
% formula 8c do capitulo 5 do livro

function f = fPnLaGrangeOtimizado(n, x, y, xp)
  for ip=1:length(xp)
    % calcula-se primeiro o numerador com ‘todas’ as parcelas
    numerador = 1.;
    for j=1:n+1
      numerador = numerador * (xp(ip)-x(j));
    end

    f(ip)=0;
    for i=1:n+1
      denominador = 1;
      for j=1:n+1
        if (j != i)
          denominador = denominador * (x(i)-x(j));
        end
      end
      % retira-se a parcela j != i
      f(ip) = f(ip) + y(i) *numerador / (denominador*(xp(ip)-x(i)));
    end
  end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% funcao que calcula o polinomio de lagrange ja com as substituicoes que gera
% o valor final (implementacao do que esta no meu resumo, como tambem o que esta
% na pagina 12 do pdf do capitulo 5 (formula 8a))
% forma tradicional

function ya = fPnLaGrange(n, x, y, xp)
  % calcula y para cada elemento de x
  for ip=1:length(xp)
    soma = 0;
    for i = 1 : n+1
      produ = 1;
      for j = 1 : n+1
        if (j != i)
          produ = produ * (xp(ip) - x(j)) / (x(i) - x(j));
        end
      end
      soma += y(i) * produ;
    end
    ya(ip) = soma;
  end
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
y = log(x)

% interpolacao lagrange
% coeficientes ja estao definidos f(i) = y(i), entao nao precisa calcular

% pontos de plotagem do grafico, ou seja, valores de x (poderia ser so um)
% xp = a : h/20 : b
xp = 1.14

% valor exato
y_exato = log(xp)

% y aproximado
% para polinomios escritos na base de Lagrange
yap_lagrange = fPnLaGrangeOtimizado(n, x, y, xp)

% calculo do erro
erro = abs(yap_lagrange - y_exato);
erromax = max(erro)

% plotagem do grafico (https://www.gnu.org/software/octave/doc/interpreter/Two_002dDimensional-Plots.html)
plot(xp, y_exato, '-r', xp, yap_lagrange, '..k')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
