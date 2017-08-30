# -*- coding: utf-8 -*-

import gauss as g
import gauss_seidel as gs
import gs_operacoes as gso
import equacoes as e
import numpy as np
import residuo as r
import g_operacoes as go
import scarborough as sc


if __name__ == "__main__":

    n = 50
    equacoes = e.create(n)

    # Item A)
    x = g.gauss(np.copy(equacoes))

    # Item A.1)
    print("#" * 80)
    print("Primeira incógnita é " + str(x[0]))
    print("Última incógnita é " + str(x[49]))
    residuos = r.residuo(np.copy(equacoes), x)
    print("Resíduo máximo é " + str(np.amax(residuos)))
    print("#" * 80)

    # Item A.2
    print("\n")
    print("#" * 80)
    print("Número total de operações em ponto flutuante utilizadas foi de " +
          str(go.nro_operacoes(n)))
    print("#" * 80)

    # Item B)
    a = np.delete(equacoes, n, 1)
    criterio = 1e-4
    chute = np.zeros(n)

    # Item B.1)
    resposta = "Sim" if sc.scarborough(a) else "Não"
    print("\n")
    print("#" * 80)
    print("Sistema é dominante? " + resposta + "!")
    analise = ("Através do critério de Scarborough pode-se afirmar que a \n"
    "sequência de Gauss-Seidel irá convergir para a solução S, já \n"
    "que a matriz A possui uma diagonal dominante, ou seja, todo \n"
    "elemento da diagonal principal é maior ou igual a soma dos \n"
    "outros elementos da mesma linha e para pelo menos uma linha o \n"
    "lemento é maior do que a soma. É válido testar um fator de \n"
    "sobrerrelaxação para verificar se o o processo pode ser acelerado.")
    print(analise)
    print("#" * 80)

    # Item B.2)
    print("\n")
    print("#" * 80)
    for i in np.arange(1.0, 2.0, 0.1):
        print("Lambda " + str(i) + " gera " +
            str(gs.gauss_seidel(i, np.copy(chute), criterio)[1]) + " iterações")

    analise = ("Conforme os testes apresentados, deve-se usar o fator de \n"
    "sobrerrelaxação de 1.1 ou 1.2 para acelerar o processo de convergência, \n"
    "ou seja, diminuir o número de iterações.")
    print(analise)
    print("#" * 80)

    # Item B.3)
    solucao = gs.gauss_seidel(1.1, np.copy(chute), criterio)
    print("\n")
    print("#" * 80)
    print("Primeira incógnita é " + str(solucao[0][0]))
    print("Última incógnita é " + str(solucao[0][49]))
    print("Resíduo máximo é " +
        str(np.amax(r.residuo(np.copy(equacoes), np.copy(solucao[0])))))
    print("#" * 80)

    # Item B.4)
    iteracoes = solucao[1]
    print("\n")
    print("#" * 80)
    print("Número de iterações foi de " + str(iteracoes))
    print("Número total de operações em ponto flutuante utilizadas foi de " +
        str(gso.nro_operacoes(iteracoes, n)))
    print("#" * 80)

    # Item B.5)
    print("\n")
    print("#" * 80)
    se_est = gs.gauss_seidel(1.1, np.copy(chute), criterio**2)
    tr_max = np.amax(abs(np.divide(
        np.subtract(solucao[0], se_est[0]), se_est[0])))
    print("Erro de truncamento relativo máximo foi de " + str(tr_max))
    print("#" * 80)
