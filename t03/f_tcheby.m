% calcula o valor aproximado com tchebychev

function YTC = f_tcheby(n,b,t)
  nt=length(t);

  % Serie de Tchebychev em função dos polinomios de Tchebychev Ti(x):
  % T1=t
  i=1;
  for k=1:nt
    T(i,k)=t(k);
  end

  % T2=(2t^2-1)
  i=2;
  for k=1:nt
    T(i,k)=2*t(k)^2-1;
  end

  % de T3=(4t^3-3t) em diante poderemos usar a recorrencia p/ i=3:n:
  % T(i)=2 t T(i-1)-T(i-2)
  % calcula até o grau n desejado
  for i=3:n
    for k=1:nt
      T(i,k)=2*t(k)*T(i-1,k)-T(i-2,k);
    end
  end

  % resultado final
  for k=1:nt
    YTC(k)=b(1).*1;
    for i=1:n
      YTC(k)=YTC(k).+b(i+1).*T(i,k);
    end
  end
end
