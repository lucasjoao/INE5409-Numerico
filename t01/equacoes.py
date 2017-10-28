# -*- coding: utf-8 -*-

import numpy as np


def create(n):
    """
        Cria e retorna as equações necessárias para o trabalho com base no
        número de linhas.
    """

    matrix = np.zeros((n, n+1))
    matrix[0, 0] = 1
    matrix[0, 1] = 1
    matrix[0, n] = 1.5

    for i in range(1, int(n/2)):
        matrix[i, i] = 4
        matrix[i, i+25] = 1
        matrix[i, i+1] = 1
        matrix[i, i-1] = 1
        matrix[i, n] = 1

    for i in range(int(n/2), n-1):
        matrix[i, i] = 5
        matrix[i, i-25] = 1
        matrix[i, i+1] = 1
        matrix[i, i-1] = 1
        matrix[i, n] = 2

    matrix[n-1, n-1] = 1
    matrix[n-1, n-2] = 1
    matrix[n-1, n] = 3

    return matrix
