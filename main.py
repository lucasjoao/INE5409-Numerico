import gauss_elimination as ge
import equations as eqs
import numpy as np
import test as tst

if __name__ == "__main__":
	eqs.equations(50)
	print("fine:")
	print(tst.matriz_coeficientes(50))
