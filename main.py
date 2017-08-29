# -*- coding: utf-8 -*-

import gauss_elimination as ge
import gauss_seidel as gs
import gs_operacoes as gso
import equations as eqs
import numpy as np
import residuo as r
import op_flutuante as opf
import scarborough as sc


if __name__ == "__main__":
    '''
        equations being generated
    '''
    n = 50
    equations = eqs.equations(n)

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
    total_op_flutuantes = opf.n_ops(n)
    print("total de operacoes de ponto flutuante: " + str(total_op_flutuantes))

    # Item B)
    '''
        matriz A
    '''
    a = np.delete(equations, n, 1)
    criterio = 1e-4
    chute = np.zeros(n)

    # Item B.1)
    resposta = "Sim" if sc.scarborough(a) else "Não"
    print("Sistema é dominante? " + resposta + "!")
    analise = "Através do critério de Scarborough pode-se afirmar que a sequência de Gauss-Seidel irá convergir para a solução S, já que a matriz A possui uma diagonal dominante, ou seja, todo elemento da diagonal principal é maior ou igual a soma dos outros elementos da mesma linha e para pelo menos uma linha o elemento é maior do que a soma. É válido testar um fator de sobrerrelaxação para verificar se o o processo pode ser acelerado."
    print(analise)

    # Item B.2)
    for i in np.arange(1.0, 2.0, 0.1):
        print("Lambda " + str(i) + " gera " + str(gs.gauss_seidel(i, np.copy(chute), criterio)[1]) + " iterações")

    analise = "Conforme os testes apresentados, deve-se usar o fator de sobrerrelaxação de 1.1 ou 1.2 para acelerar o processo de convergência, ou seja, diminuir o número de iterações."
    print(analise)

    # Item B.3)
    solucao = gs.gauss_seidel(1.1, np.copy(chute), criterio)
    print("Primeira incógnita é " + str(solucao[0][0]))
    print("Última incógnita é " + str(solucao[0][49]))
    print("Resíduo máximo é " + str(np.amax(r.residuo(np.copy(equations), np.copy(solucao[0])))))

    # Item B.4)
    iteracoes = solucao[1]
    print("Número de iterações foi de " + str(iteracoes))
    print("Número total de operações em ponto flutuante utilizadas foi de " + str(gso.nro_operacoes(iteracoes, n)))

    # Item B.5)
    solucao_exata_estimada = gs.gauss_seidel(1.1, np.copy(chute), criterio**2)
    trunc_rel_max = np.amax(abs(np.divide(np.subtract(solucao[0], solucao_exata_estimada[0]), solucao_exata_estimada[0])))
    print("Erro de truncamento relativo máximo foi de " + str(trunc_rel_max))

