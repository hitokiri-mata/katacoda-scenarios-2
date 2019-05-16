What about an empty list
========================

In the process of creating example test inputs for this test case,
it becomes apparent that the special case of no arguments has not
been considered.  It is not entirely clear what the behaviour
should be.  So we ask the product owner who says
that the function returns an error code of -3.

Great - let's capture that in the unit tests.

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

    def test_that_no_arguments_return_zero(self):
        result = calc.my_sum()
        self.assertEqual(-3, result)

if __name__ == '__main__':
    unittest.main()
</pre>

Verify that the tests fail:

`python3 ./tests.py`{{execute}}

And update `my_sum()` to make the tests pass.
