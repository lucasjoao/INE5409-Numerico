import unittest
from gauss_seidel import gauss_seidel
import numpy as np


class TestGaussSeidel(unittest.TestCase):

    def test_that_dont_crash(self):
        est = [1, 2, 3, 4, 5] * 10
        self.assertNotEqual([[1] * 50, 5], gauss_seidel(2, est, 100))

if __name__ == '__main__':
    unittest.main()
