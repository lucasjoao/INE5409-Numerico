import gauss_elimination as ge
import equations as eqs
import numpy as np
import test as tst
import teste1 as tst1
import residuo as r
import op_flutuante as opf


if __name__ == "__main__":


	'''
		equations being generated
	'''
	equations = eqs.equations(50)
	# Item A)
	'''
		x is the solution vector
	'''	
	x = ge.gauss(equations)

	# Item A.1)
	print( str(x[0]) + " - " + str(x[49]))

	residuos = r.residuo(equations,x)
	print("Maior residuo: " + str(np.amax(residuos)))

	# Item A.2

	total_op_flutuantes = opf.n_ops(50)

	print("total de operacoes de ponto flutuante: " + str(total_op_flutuantes))