function raiz = projeta_raiz(p)
    grau = length(p);
    r_max = 1 + max(abs(p(2:grau))) / abs(p(1));
    r_min = 1 / (1 + (max(abs(p(1):grau - 1))) / abs(p(grau)));
    r_med = (r_max + r_min) / 2;
    raiz = complex(0.7 * r_med, 0.7 * r_med);
end
