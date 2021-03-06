format long

p = [1 -3.4 +2.35  4.32 -7.1685 +1.56006 +3.287061 -2.480058 0.531441  0  0  0];

disp("##############################################################################")
disp("A:")
disp(raizes(p, 1))
disp("##############################################################################")
disp("\n")

disp("##############################################################################")
disp("B:")
disp(raizes(p, 0))
disp("\n")
disp("Perceba que a raiz faltante da alternativa A é a 'Column 5', as outras já apareceram anteriormente.")
disp("##############################################################################")
disp("\n")

disp("##############################################################################")
disp("C:")
disp("fatorado = x^3*(x+1)^2*(x-0.8999)^6")
disp("##############################################################################")
disp("\n")

disp("##############################################################################")
disp("D:")
disp("- Octave:")
disp(roots(p))
disp("\n")
disp("- WolframAlpha: ")
disp([-1, 0, 0.898175-0.00105142i, 0.898175+0.00105142i, 0.899996-0.00210907i, 0.899996+0.00210907i, 0.901828-0.00105766i, 0.901828+0.00105766i])
disp("##############################################################################")
