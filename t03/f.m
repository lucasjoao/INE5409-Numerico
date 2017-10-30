% funcao utilizada no terceiro trabalho
% f(x) = ln(x) com x E [0.1, 2.0]
% por isso deve aplicar transformacao para que o novo 'x' E [-1, 1]
% processo de transformacao foi feito pelo professor 'na mao'
% em uma aula de exercicio

function y = f(x)
  y = log(0.95 * x + 1.05);
end
