function resto = briot_ruffini(grau, p, x_inicial)
    grau_orig = grau;

    for k = 1 : grau_orig
        b(1) = p(1);
        for i = 2 : grau + 1
            b(i) = p(i) + (x_inicial * b(i - 1));
        end
        resto(k) = b(grau + 1);
        p = b(1:grau);
        grau -= 1;
    end
    resto(grau_orig + 1) = 1;
end
