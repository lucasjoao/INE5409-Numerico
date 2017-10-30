% funcao que calcula o polinomio de lagrange ja com as substituicoes que gera
% o valor final (implementacao do que esta no meu resumo, como tambem o que esta
% na pagina 12 do pdf do capitulo 5 (formula 8a))
% forma tradicional

function ya = f_lagrange(n, x, y, xp)
  % calcula y para cada elemento de x
  for ip = 1 : length(xp)
    soma = 0;
    for i = 1 : n + 1
      produ = 1;
      for j = 1 : n + 1
        if (j != i)
          produ = produ * (xp(ip) - x(j)) / (x(i) - x(j));
        end
      end
      soma += y(i) * produ;
    end
    ya(ip) = soma;
  end
end
