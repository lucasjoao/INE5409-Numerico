import unittest
from scarborough import scarborough
import numpy as np


class TestScarborough(unittest.TestCase):

    def test_false(self):
        res = np.matrix('1 2; 1 -3')
        self.assertEqual(0, scarborough(res))

    def test_true(self):
        res = np.matrix('3 -1 -1; 1 3 1; 2 -2 4')
        self.assertEqual(1, scarborough(res))

if __name__ == '__main__':
    unittest.main()
