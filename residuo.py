import numpy as np

def residuo(Matrix, X):
	nRows, size = (len(X), len(X))
	nCols = len(X) + 1;
	r = np.zeros(size);
	_sum = 0

	for i in range(size):
		_sum = 0
		for j in range(size):
			_sum = _sum + (Matrix[i,j] * X[j])
		r[i] = abs(_sum-Matrix[i,size]);
	return r
