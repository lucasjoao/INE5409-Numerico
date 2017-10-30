% funcao que calcula os coeficientes de maclaurin/taylor
% nao eh generica, pois trabalha com a funcao do trabalho e com os limites dele
% de [0.1, 2.0]

function coef = f_coef_maclaurin(n)
  coef(1) = log(0.5 * 2.1);
  for i = 1 : n
    coef(i + 1) = (-1) ^ (i + 1) * ((1.9) / (2.1)) ^ i / (i);
  end
end
