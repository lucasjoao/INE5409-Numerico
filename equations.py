import numpy as np

def equations(n):
	matrix = np.zeros((n, n+1))
    matrix[0,0] = 1
    matrix[0,1] = 1

    for i in range(1, int(n/2)):
        x[i, n + 1] = 1;
        x[i, i - 1] = 1;
        x[i, i + 1] = 1;
        x[i, i + 25] = 1;
        x[i, i] = 4;
	print(matrix)