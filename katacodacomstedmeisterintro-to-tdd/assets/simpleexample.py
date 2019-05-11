import unittest

class TestSumNumbers(unittest.TestCase):
    def test_can_sum_two_numbers(self):
        result = my_sum(2, 3)
        self.assertEqual(result, 5)