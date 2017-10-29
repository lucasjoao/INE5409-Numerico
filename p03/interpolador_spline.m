%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Splines naturais/lineares NAS PONTAS da figura S1=0 e Sn+1=0

function [a b c d]=fSplinea(m,x,y)
  % teremos 'm' splines cúbicas, uma para cada intervalo, formando um sistema tridiagonal de 'm-1' equacoes para S (derivadas de segunda ordem)
  for i=1:m
    h(i)=x(i+1)-x(i);
  end

  % 1a. eq. i=2
  t(2)=0;
  r(2)=2*h(1)+2*h(2);
  d(2)=h(2);
  % para S1
  b(2)=6*((y(3)-y(2))/h(2)-(y(2)-y(1))/h(1));

  for i=3:m-1
    t(i)=h(i-1);
    r(i)=2*(h(i-1)+h(i));
    d(i)=h(i);
    % para Si
    b(i)=6*((y(i+1)-y(i))/h(i)-(y(i)-y(i-1))/h(i-1));
  end

  %ultima eq. i=m
  t(m)=h(m-1);
  r(m)=(2*h(m-1)+2*h(m));
  d(m)=0;
  % para Sm
  b(m)=6*((y(m+1)-y(m))/h(m)-(y(m)-y(m-1))/h(m-1));

  % sistemas de eqs. tridiagonal com eqs. de i=2 a m
  for i=3:m
    aux=t(i)/r(i-1);
    t(i)=0;
    r(i)=r(i)-aux*d(i-1);
    b(i)=b(i)-aux*b(i-1);
  end

  S(m)=b(m)/r(m);
  for i=m-1:-1:2
    S(i)=(b(i)-d(i)*S(i+1))/r(i);
  end

  % Splines naturais/lineares NAS PONTAS da figura S1=0 e Sm+1=0
  S(1)=0; S(m+1)=0;

  % Calcula-se cada conjunto de coeficientes a, b, c, d dos polinimois de 3o. grau
  for i=1:m
    a(i)=(S(i+1)-S(i))/(6*h(i));
    b(i)= S(i)/2;
    c(i)=(y(i+1)-y(i))/h(i)-(S(i+1)+2*S(i))*h(i)/6;
    d(i)= y(i);
  end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Splines quadráticas NAS PONTAS da figura S1=S2 e Sm+1=Sm

function [a b c d] = fSplineb(m,x,y)
  % teremos 'm' splines cúbicas, uma para cada intervalo, formando um sistema tridiagonal de 'm-1' equacoes para S (derivadas de segunda ordem)
  for i=1:m
    h(i)=x(i+1)-x(i);
  end

  % 1a. eq. i=2
  t(2)=0;
  r(2)=3*h(1)+2*h(2);
  d(2)=h(2);
  % para S1
  b(2)=6*((y(3)-y(2))/h(2)-(y(2)-y(1))/h(1));

  for i=3:m-1
    t(i)=h(i-1);
    r(i)=2*(h(i-1)+h(i));
    d(i)=h(i);
    % para Si
    b(i)=6*((y(i+1)-y(i))/h(i)-(y(i)-y(i-1))/h(i-1));
  end

  %ultima eq. i=m
  t(m)=h(m-1);
  r(m)=(2*h(m-1)+3*h(m));
  d(m)=0;
  % para Sm
  b(m)=6*((y(m+1)-y(m))/h(m)-(y(m)-y(m-1))/h(m-1));

  % Sistemas de eqs. tridiagonal com eqs. de i=2 a m
  for i=3:m
    aux=t(i)/r(i-1);
    t(i)=0;
    r(i)=r(i)-aux*d(i-1);
    b(i)=b(i)-aux*b(i-1);
  end

  S(m)=b(m)/r(m);

  for i=m-1:-1:2
    S(i)=(b(i)-d(i)*S(i+1))/r(i);
  end

  % Splines quadráticas NAS PONTAS da figura S1=S2 e Sm+1=Sm
  S(1)=S(2); S(m+1)=S(m);

  % Calcula-se cada conjunto de coeficientes a, b, c, d dos polinimois de 3o. grau
  % zera memoria
  a=[];
  b=[];
  c=[];
  d=[];
  for i=1:m
    a(i)=(S(i+1)-S(i))/(6*h(i));
    b(i)= S(i)/2;
    c(i)=(y(i+1)-y(i))/h(i)-(S(i+1)+2*S(i))*h(i)/6;
    d(i)= y(i);
  end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Splines conhecidas NAS PONTAS da figura S1=u e Sm+1=v

function [a b c d]=fSplinec(m,x,y,u,v)
  % teremos 'm' splines cúbicas, uma para cada intervalo, formando um sistema tridiagonal de 'm-1' equacoes para S (derivadas de segunda ordem)
  for i=1:m
    h(i)=x(i+1)-x(i);
  end

  % 1a. eq. i=2
  t(2)=0;
  r(2)=2*h(1)+2*h(2);
  d(2)=h(2);
  % para S1
  b(2)=6*((y(3)-y(2))/h(2)-(y(2)-y(1))/h(1))-h(1)*u;

  for i=3:m-1
    t(i)=h(i-1);
    r(i)=2*(h(i-1)+h(i));
    d(i)=h(i);
    % para Si
    b(i)=6*((y(i+1)-y(i))/h(i)-(y(i)-y(i-1))/h(i-1));
  end

  % ultima eq. i=m
  t(m)=h(m-1);
  r(m)=(2*h(m-1)+2*h(m));
  d(m)=0;
  % para Sm
  b(m)=6*((y(m+1)-y(m))/h(m)-(y(m)-y(m-1))/h(m-1))-h(m)*v;

  % Sistemas de eqs. tridiagonal com eqs. de i=2 a m
  for i=3:m
    aux=t(i)/r(i-1);t(i)=0;
    r(i)=r(i)-aux*d(i-1);
	  b(i)=b(i)-aux*b(i-1);
  end

  S(m)=b(m)/r(m);

  for i=m-1:-1:2
    S(i)=(b(i)-d(i)*S(i+1))/r(i);
  end

  % Splines definidas NAS PONTAS da figura S1=u e Sm+1=v
  S(1)=u; S(m+1)=v;
  % Calcula-se cada conjunto de coeficientes a, b, c, d dos polinimois de 3o. grau
  for i=1:m
    a(i)=(S(i+1)-S(i))/(6*h(i));
    b(i)= S(i)/2;
    c(i)=(y(i+1)-y(i))/h(i)-(S(i+1)+2*S(i))*h(i)/6;
    d(i)= y(i);
  end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Splines extrapoladas NAS PONTAS da figura S1 e Sm+1

function [a b c d] = fSplined(m,x,y)
  % teremos 'm' splines cúbicas, uma para cada intervalo, formando um sistema tridiagonal de 'm-1' equacoes para S (derivadas de segunda ordem)
  for i=1:m
    h(i)=x(i+1)-x(i);
  end

  % 1a. eq. i=1
  t(1)=0;
  r(1)=h(2);
  d(1)=-(h(1)+h(2));
  % para S1
  % tem-se um coeficiente extra aux1=h(1)*S(3)
  b(1)=0;

  for i=2:m
    t(i)=h(i-1);
    r(i)=2*(h(i-1)+h(i));
    d(i)=h(i);
    % para Si
    b(i)=6*((y(i+1)-y(i))/h(i)-(y(i)-y(i-1))/h(i-1));
  end

  % ultima eq. i=m+1%
  t(m+1)=-(h(m-1)+h(m));
  r(m+1)=h(m-1);
  d(m+1)=0;
  % para Sm
  % tem-se um coeficiente extra aux2=h(m)*S(m-1)
  b(m+1)=0;

  % Sistemas de eqs. tridiagonal nas  eqs. de i=2 a m, termos extras p/ i=1, tem-se aux1, e p/ i=m+1, tem-se aux2
  for i=2:m
    aux=t(i)/r(i-1);
    t(i)=0;
    r(i)=r(i)-aux*d(i-1);
    b(i)=b(i)-aux*b(i-1);
  end

  % alterar o coeficiente extra da ultima linha i=m+1 -> aux2=h(m)*S(m-1), usando alinha i=m-1
  i=m+1;
  % aux2=0;
  % zerado com a linha L(i-2=m-1)
  aux=h(m)/r(m-1);
  t(i)=t(i)-aux*d(i-2);
  r(i)=r(i)-aux*0;
	b(i)=b(i)-aux*b(i-2);

  % alterar a ultima linha tridiagonal i=m+1
  i=m+1
  aux=t(i)/r(i-1);t(i)=0;
  r(i)=r(i)-aux*d(i-1);
  b(i)=b(i)-aux*b(i-1);

  % Retrosubstituição: a partir da ultima linha i=m+1
  S(m+1)=b(m+1)/r(m+1);
  for i=m:-1:2
    S(i)=(b(i)-d(i)*S(i+1))/r(i);
  end

  % primeira linha tem um termo extra aux1=h(1)*S(3):
  i=1;
  S(i)=(b(i)-d(i)*S(i+1)-h(1)*S(3))/r(i);

  % Splines extrapoladas NAS PONTAS da figura S1 e Sm+1
  % zera memoria
  a=[];
  b=[];
  c=[];
  d=[];

  % Calcula-se cada conjunto de coeficientes a, b, c, d dos polinomios de 3o. grau
  for i=1:m
    a(i)=(S(i+1)-S(i))/(6*h(i));
    b(i)= S(i)/2;
    c(i)=(y(i+1)-y(i))/h(i)-(S(i+1)+2*S(i))*h(i)/6;
    d(i)= y(i);
  end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% main

% limites da continuidade
a = -pi;
b = pi;

% n + 1 sera o numero de coeficientes
n=17;

% calcular os pontos x(i) onde o polinomio devera passar
h=(b-a)/n;
x=a:h:b;

% funcao que sera aproximada e y ira ter os y(i)
y=sin(x);

% calculo por n splines
% teremos 'n' splines cubicas, uma para cada intervalo, formando um sistema tridiagonal de 'n-1' equacoes para S (derivadas de segunda ordem)
% zerar memoria
a=[];
b=[];

% escolha da spline que sera utilizada
%
% Splines naturais/lineares NAS PONTAS da figura S1=0 e Sn+1=0
% [a b c d] = fSplinea(n,x,y)
%
% Splines quadraticas NAS PONTAS da figura S1=S2 e Sn+1=Sn
[a b c d] = fSplineb(n,x,y);
%
% Splines extrapoladas NAS PONTAS da figura S1 e Sn+1
% [a b c d] = fSplined(n,x,y,h)

% 4 sub-divisoes internas em cada n sub-intervalo entre x(i) e x(i+1)
np=4;

% zera memoria
xpp=[];
ypp=[];

for i=1:n
  xs= x(i) : (x(i+1)-x(i))/np : x(i+1);
	for k=1:np+1
		ys(k)=a(i)*(xs(k)-x(i))*(xs(k)-x(i))*(xs(k)-x(i))+b(i)*(xs(k)-x(i))*(xs(k)-x(i))+c(i)*(xs(k)-x(i))+d(i);
	end
	xpp=[xpp xs];
  ypp=[ypp ys];
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
