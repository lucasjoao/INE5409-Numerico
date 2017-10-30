% calcula os coeficientes para tchebychev
% retorna os n+1 coeficientes do aproximandor de grau n

function c = f_coef_tcheby(n)
  % m 'nós' de Tchebyschev
  m=1e2;
  k=1:m;
  t=cos((2.*k.-1).*pi./(2.*m));

  % T0=1
  i=0;
  % integrais de Gauss-Tchebyshev:
  soma=0;
  for k=1:m
      soma=soma+f(t(k))*(1);
  end
  % c(1)=(1/pi)*(pi/m*soma);
  c(i+1)=1/m*soma;

  % T1=t
  i=1;
  soma=0;
  for k=1:m
    T(i,k)=t(k); %T1=t
    soma=soma+f(t(k))*T(i,k);
  end
  %c(2)=(2/pi)*(pi/m*soma);
  c(i+1)=2/m*soma;

  % T2=(2t^2-1)
  i=2;
  soma=0;
  for k=1:m
    T(i,k)=2*t(k)^2-1; %T2=2t^2-1
    soma=soma+f(t(k))*T(i,k);
  end
  c(i+1)=2/m*soma;

  % de T3=(4t^3-3t) em diante poderemos usar a recorrencia p/ i=3:n:
  % T(i)=2*t*T(i-1)-T(i-2)
  for i=3:n
    soma=0;
    for k=1:m
      T(i,k)=2*t(k)*T(i-1,k)-T(i-2,k);
      soma=soma+f(t(k))*T(i,k);
    end
    c(i+1)=2/m*soma;
  end
end
