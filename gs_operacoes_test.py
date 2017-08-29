import unittest
from gs_operacoes import nro_operacoes


class TestOperacoesGaussSeidel(unittest.TestCase):

    def test_basic(self):
        self.assertEqual(60, nro_operacoes(5, 2))

if __name__ == '__main__':
    unittest.main()
