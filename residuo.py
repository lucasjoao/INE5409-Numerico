import numpy as np

def residuo(Matrix, X, size):
	r = np.zeros(size);
	_sum = 0
	for i in range(0, size - 1):
		_sum = 0
		for j in range(0, size - 1):
			_sum += Matrix[i][j] * x(j)
		r[i] = abs(_sum - Matrix[i][size+1])

	max_r = np.amax(r)