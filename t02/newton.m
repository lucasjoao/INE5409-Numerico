function [xs, M] = newton(grau, p, x_inicial)
    dif = 9999;
    k = 0;
    criterio = 1e-14;

    while (dif > criterio && k < 100)
        k += 1;
        resto = briot_ruffini(grau, p, x_inicial);
        M = multiplicidade(resto);
        delta_x = - resto(M)/(M * resto(M + 1));
        xs = x_inicial + delta_x;
        dif = abs(delta_x);
        x_inicial = xs;
    end
end
