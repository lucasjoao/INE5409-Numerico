function coef = f_coef_maclaurin(n)
  coef(1) = 1;
  sinal = -1;
  for i = 1 : n
    if mod(i + 1, 2) == 0
      coef(i + 1) = 0;
    else
      coef(i + 1) = sinal / factorial(i);
      sinal = sinal * -1;
    endif
  end
end
