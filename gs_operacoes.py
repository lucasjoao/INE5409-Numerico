# -*- coding: utf-8 -*-


def nro_operacoes(iteracoes, linhas):
    """
       Calcula o número total de operações em ponto flutuante utilizadas com
       base na quantidade de linhas e de iterações
    """

    return iteracoes * (5 + (linhas - 2) * 7 + 5 + linhas)
