function M = multiplicidade(resto)
    soma = abs(resto(1)) + abs(resto(2));
    M = 1;
    while(soma < 1e-4)
        soma += abs(resto(M + 1));
        M += 1;
    end
end
