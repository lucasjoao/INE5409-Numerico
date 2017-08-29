# -*- coding: utf-8 -*-


def scarborough(matrix):
    """Critério de Scarborough. Se há diagonal dominante retorna 1, senão 0."""

    i_j = matrix.shape

    doms, est_doms = ([], [])

    for i in range(i_j[0]):
        sum_line = 0
        for j in range(i_j[1]):
            sum_line += matrix.item(i, j) if i != j else 0

        dom = abs(matrix.item(i, i)) >= sum_line
        est_dom = abs(matrix.item(i, i)) > sum_line

        doms.append(dom)
        est_doms.append(est_dom)

        if dom is False:
            break

    if False in doms or est_doms == [i_j[0] * False]:
        return 0

    return 1
