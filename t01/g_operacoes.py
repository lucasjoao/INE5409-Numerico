# -*- coding: utf-8 -*-


def nro_operacoes(linhas):
    """
       Calcula o número total de operações em ponto flutuante utilizadas com
       base na quantidade de linhas
    """

    return ((4*linhas**3) + (9*linhas**2) - linhas - 6) / 6
