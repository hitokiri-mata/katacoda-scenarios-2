Extend the tests
================

It's time to extend the tests to cope with a variable number of
arguments, so extend the test code to be as follows:

<pre class="file" data-filename="tests.py" data-target="replace">
import unittest

import calc

class TestRunFunction(unittest.TestCase):
    def test_can_sum_two_numbers(self):
        result = calc.my_sum(2, 3)
        self.assertEqual(result, 5)

    def test_can_take_variable_number_of_arguments(self):
        cases = [
            [13, [13]],
            [10, [1, 2, 3, 4]],
            [-2, [3, -5]],
        ]
        for expected_sum, inputs in cases:
            result = calc.my_sum(*inputs)
            self.assertEqual(expected_sum, result)

if __name__ == '__main__':
    unittest.main()
</pre>

And verify that the tests now fail.

`python3 ./tests.py`{{execute}}

Before moving on, update `my_sum()` to fix the failing tests.
