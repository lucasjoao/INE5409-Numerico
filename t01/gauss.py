# -*- coding: utf-8 -*-

import numpy as np


def gauss(matrix):
    """
       Método de eliminação de Gauss. Recebe a matriz expandida e retorna o
       resultado.
    """

    n = len(matrix)

    for i in range(0, n):
        for k in range(i+1, n):
            factor = matrix[k][i]/matrix[i][i]

            for j in range(i, n+1):
                if i == j:
                    matrix[k][j] = 0
                else:
                    matrix[k][j] -= factor * matrix[i][j]

    x = [0 for i in range(n)]

    for i in range(n-1, -1, -1):
        x[i] = matrix[i][n]/matrix[i][i]

        for k in range(i-1, -1, -1):
            matrix[k][n] -= matrix[k][i] * x[i]

    return x
