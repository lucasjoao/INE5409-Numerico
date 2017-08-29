# -*- coding: utf-8 -*-
import numpy as np


def gauss_seidel(relax, est, stop):
    """
       Método iterativo de Gauss-Seidel para o sistema linear do trabalho.
       Onde relax é o fator de relaxação, est é o valor inicial, stop é o
       critério de parada, n é a quantidade de linhas do sistema e k  é o
       número de iterações.
    """

    k = 0
    dif = 10000
    n = len(est)
    diff = np.zeros(n)

    while dif > stop:
        k += 1

        est[0] = ((1 - relax) * est[0]) + relax * (1.50 - est[1])

        for i in range(1, int(n/2)):
            est[i] = ((1 - relax) * est[i]) + relax * \
                     ((1.0 - est[i-1] - est[i+1] - est[i+25])/4)

        for j in range(int(n/2), n-1):
            est[j] = ((1 - relax) * est[j]) + relax * \
                     ((2.0 - est[j-25] - est[j-1] - est[j+1])/5)

        est[n-1] = ((1 - relax) * est[n-1]) + relax * (3.00 - est[n-2])

        dif = max(abs(np.subtract(est, diff)))
        diff = np.copy(est)

    return [est, k]
