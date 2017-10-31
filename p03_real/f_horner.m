% funcao de horner
% funcao que calcula o valor do polinomio recebido por horner conforme descricao
% do seguinte link
% https://pt.wikipedia.org/wiki/Esquema_de_Horner#Descri.C3.A7.C3.A3o

function resultado = f_horner(n, a, xp)
  % calcula y para cada elemento de x
  for ip = 1 : length(xp)
    aux = a(n + 1);
    for i = n : -1 : 1
      aux = a(i) + aux * xp(ip);
    end
    resultado(ip) = aux;
  end
end
