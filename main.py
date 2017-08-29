# -*- coding: utf-8 -*-

import gauss_elimination as ge
import equations as eqs
import numpy as np
import residuo as r
import op_flutuante as opf
import scarborough as sc


if __name__ == "__main__":
    '''
        equations being generated
    '''
    equations = eqs.equations(50)

    # Item A)
    '''
        x is the solution vector
    '''
    x = ge.gauss(np.copy(equations))

    # Item A.1)
    print(str(x[0]) + " - " + str(x[49]))

    residuos = r.residuo(np.copy(equations), x)
    print("Maior residuo: " + str(np.amax(residuos)))

    # Item A.2
    total_op_flutuantes = opf.n_ops(50)
    print("total de operacoes de ponto flutuante: " + str(total_op_flutuantes))

    # Item B)
    '''
        matriz A
    '''
    a = np.delete(equations, 50, 1)
    criterio = 1e-4

    # Item B.1)
    resposta = "Sim" if sc.scarborough(a) else "Não"
    print("Sistema é dominante? " + resposta + "!")
    analise = "Através do critério de Scarborough pode-se afirmar que a sequência de Gauss-Seidel irá convergir para a solução S, já que a matriz A possui uma diagonal dominante, ou seja, todo elemento da diagonal principal é maior ou igual a soma dos outros elementos da mesma linha e para pelo menos uma linha o elemento é maior do que a soma. É válido testar um fator de sobrerrelaxação para verificar se o o processo pode ser acelerado."
    print(analise)

    # Item B.2)




