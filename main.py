import gauss_elimination as ge
import numpy as np

if __name__ == "__main__":
	matrix = np.zeros((3,4))
	matrix[0][0] = 1
	matrix[0][1] = 0.5
	matrix[0][2] = -1.75
	matrix[0][3] = -1
	matrix[1][0] = 2
	matrix[1][1] = 1.5
	matrix[1][2] = 4.75
	matrix[1][3] = 8
	matrix[2][0] = 4
	matrix[2][1] = -2
	matrix[2][2] = 1
	matrix[2][3] = 7
	print(matrix)

	print(ge.gauss(matrix))