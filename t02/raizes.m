function xs = raizes(p, usa_m1)
    k = 1;
    grau = length(p) - 1;
    grau_orig = grau;
    x_inicial(k) = 0;
    p_orig = p;

    [xs(k), M(k)] = newton(grau, p, x_inicial(k));
    [xs(k), M(k)] = newton(grau, p, xs(k));
    [grau, p] = reduz(grau, p, xs(k), M(k));

    while (grau > 0)
        k++;
        x_inicial(k) = projeta_raiz(p);
        [xs(k), M(k)] = newton(grau, p, x_inicial(k));
        if (usa_m1 == 1)
            M(k) = 1;
        endif
        [xs(k), M(k)] = newton(grau_orig, p_orig, xs(k));
        if (usa_m1 == 1)
            M(k) = 1;
        endif
        [grau, p] = reduz(grau, p, xs(k), M(k));
    end
end
