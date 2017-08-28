import numpy as np

# TODO: doc das vars + citar especifica para formula dada + entender melhor o que foi feito + fazer testes

def gauss_seidel(relax, est, stop):
    k = 0
    dif = 9999
    n = len(est)
    diff = np.zeros(n)

    while dif > stop:
        k += 1

        est[0] = (1 - relax) * est[0] + relax * (1.50 - est[1])

        for i in range(1, n/2):
            est[i] = (1 - relax) * est[i] + relax * \
                     (1.0 - est[i-1] - est[i+1] - est[i+25])/4

        for j in range(n/2, n-1):
            est[j] = (1 - relax) * est[j] + relax * \
                     (2.0 - est[j-25] - est[j-1] - est[j+1])/5

        est[n] = (1 - relax) * est[n] + relax * (3.00 - est[n-1])

        dif = max(abs(np.subtract(est, diff)))
        diff = np.copy(est)

    return est
