format long;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% limites da continuidade
a = -1;
b = 1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% interpolacao polinomial com lagrange

disp("########################################################################")
disp("Questão um:")
disp("Interpolação polinomial com Lagrange")

% n + 1 sera o numero de coeficientes
% determinado por tentativa e erro
n = 41

% calcular os pontos x(i) onde o polinomio devera passar
h = (b-a) / n;
x = a : h : b; % lista onde a e o começo, h e o range, e o b o limite

% funcao que sera aproximada e y ira ter os y(i)
y = f(x);

% pontos de plotagem do grafico, ou seja, valores de x (pode ser um ou varios)
xp = a : h/20 : b;

% valor exato
y_exato = f(xp);

% y aproximado para polinomios escritos na base de lagrange
yap_lagrange = f_lagrange(n, x, y, xp);

% calculo do erro e abcissa x onde o erro maximo foi atingido
[erro_max, ind_max] = max(abs(yap_lagrange - y_exato))
x_erro_max = xp(ind_max)

% plotagem do grafico
% plot(xp, y_exato, '-r', xp, yap_lagrange, '..k')

disp("########################################################################")
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% interpolacao com serie de maclaurin

disp("########################################################################")
disp("Questão dois:")
disp("Interpolação com série de Maclaurin")

% determinado por tentativa e erro
n = 6

% funcao que calcula coeficientes, varia conforme diferentes f(x)
coeficientes_mac = f_coef_maclaurin(n);

% aproveita xp da ultima interpolacao
% aproveita y_exato da ultima interpolacao

% y aproximado com maclaurin determinado por horner
yap_maclaurin = f_horner(n, coeficientes_mac, xp);

% calculo do erro e abcissa x onde o erro maximo foi atingido
[erro_max, ind_max] = max(abs(yap_maclaurin - y_exato))
x_erro_max = xp(ind_max)

% plotagem do grafico
% plot(xp, y_exato, '-r', xp, yap_maclaurin, '..k')

disp("########################################################################")
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% interpolacao com tchebyshev

disp("########################################################################")
disp("Questão três:")
disp("Interpolação com aproximação numérica por Tchebyshev")

% determinado por tentativa e erro
n = 5

% aproveita xp da primeira interpolacao
% aproveita y_exato da primeira interpolacao

% calcula coeficientes para o tcheby
coeficientes_tcheby = f_coef_tcheby(n);

% y aproximado com tcheby
yap_tcheby = f_tcheby(n, coeficientes_tcheby, xp);

% calculo do erro e abcissa x onde o erro maximo foi atingido
[erro_max, ind_max] = max(abs(yap_tcheby - y_exato))
x_erro_max = xp(ind_max)

% plotagem do grafico
% plot(xp, y_exato, '-r', xp, yap_tcheby, '..k')

disp("########################################################################")
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% interpolacao com pade

disp("########################################################################")
disp("Questão quatro:")
disp("Interpolação com aproximação racional de Padé")

% auxiliares, determinado por tentativa e erro
n = 2
m = 2
M = n + m;

% aproveita xp da primeira interpolacao
% aproveita y_exato da primeira interpolacao

% calcula coeficientes para o pade que sao os mesmos de maclaurin
coeficientes_pade = f_coef_maclaurin(M);

% y aproximado com pade determinado por horner
[a b] = f_pade(n, m, coeficientes_pade);
%
% https://www.gnu.org/software/octave/doc/interpreter/Arithmetic-Ops.html
% . significa elemento por elemento
yap_pade = f_horner(n, a, xp) ./ f_horner(m, b, xp);

% calculo do erro e abcissa x onde o erro maximo foi atingido
[erro_max, ind_max] = max(abs(yap_pade - y_exato))
x_erro_max = xp(ind_max)

% plotagem do grafico
% plot(xp, y_exato, '-r', xp, yap_pade, '..k')

disp("########################################################################")
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
