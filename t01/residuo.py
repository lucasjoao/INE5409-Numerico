# -*- coding: utf-8 -*-

import numpy as np


def residuo(matrix, x):
    """
       Calcula e retorna o resíduo com base na matriz expandida e no vetor de
       soluções.
    """

    size = len(x)
    resultado = np.zeros(size)
    somatorio = 0

    for i in range(size):
        somatorio = 0
        for j in range(size):
            somatorio = somatorio + (matrix[i, j] * x[j])
        resultado[i] = abs(somatorio - matrix[i, size])

    return resultado
