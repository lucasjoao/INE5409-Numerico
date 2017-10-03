function [grau, p] = reduz(grau, p, xs, M)
    k = 1;
    while (k <= M)
        b(1) = p(1);
        for i = 2 : grau + 1
            b(i) = p(i) + (xs * b(i - 1));
        end
        p = b;
        grau -= 1;
        k += 1;
    end
    p = p(1:grau + 1);
end
