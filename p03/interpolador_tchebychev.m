%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% calcula os coeficientes para tchebychev
% retorna os n+1 coeficientes do aproximandor de grau n

function c=fcoefTchebychev(n)
  % m 'nós' de Tchebyschev
  m=1e2;
  k=1:m;
  t=cos((2.*k.-1).*pi./(2.*m));

  % T0=1
  i=0;
  % integrais de Gauss-Tchebyshev:
  soma=0;
  for k=1:m
      soma=soma+exp(t(k))*(1);
  end
  % c(1)=(1/pi)*(pi/m*soma);
  c(i+1)=1/m*soma;

  % T1=t
  i=1;
  soma=0;
  for k=1:m
    T(i,k)=t(k); %T1=t
    soma=soma+exp(t(k))*T(i,k);
  end
  %c(2)=(2/pi)*(pi/m*soma);
  c(i+1)=2/m*soma;

  % T2=(2t^2-1)
  i=2;
  soma=0;
  for k=1:m
    T(i,k)=2*t(k)^2-1; %T2=2t^2-1
    soma=soma+exp(t(k))*T(i,k);
  end
  c(i+1)=2/m*soma;

  % de T3=(4t^3-3t) em diante poderemos usar a recorrencia p/ i=3:n:
  % T(i)=2*t*T(i-1)-T(i-2)
  for i=3:n
    soma=0;
    for k=1:m
      T(i,k)=2*t(k)*T(i-1,k)-T(i-2,k);
      soma=soma+exp(t(k))*T(i,k);
    end
    c(i+1)=2/m*soma;
  end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% calcula o valor aproximado com tchebychev

function YTC=fcalculaTchebychev(n,b,t)
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% main.m

format long;

% pontos de plotagem do grafico, ou seja, valores de x (poderia ser so um)
% calcular os pontos x(i) onde o polinomio devera passar
% -1 e 1 sao os limites de continuidade
tp = -1:0.01:1;

% y exato
% atencao que exp eh a funcao que sera aproximada, se for trocar por outra,
% deve-se atualizar todos os seus locais de ocorrencia
yep = exp(tp);

% calcula coeficientes para o tcheby
k = 9;
b = fcoefTchebychev(k);

% calcula valor aproximado
ytp = fcalculaTchebychev(k, b, tp);

% calculo erro
erro_tbc = abs(ytp .- yep);
erroMax_tbc = max(erro_tbc)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
