function s = f_coef_maclaurin(n)
  s(1) = log(0.5 * 2.1);
  for i = 1 : n
    s(i + 1) = (-1) ^ (i + 1) * ((1.9) / (2.1)) ^ i / (i);
  end
end
