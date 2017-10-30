% funcao que calcula o valor do polinomio conf
% https://pt.wikipedia.org/wiki/Esquema_de_Horner#Descri.C3.A7.C3.A3o

function y = f_horner(n, a, xp)
  % calcula y para cada elemento de x
  for ip=1:length(xp)
    aux = a(n+1);
    for i=n:-1:1
      aux = a(i) + aux*xp(ip);
    end
    y(ip) = aux;
  end
end
