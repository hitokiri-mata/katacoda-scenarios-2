Refactor
========

The test code is looking a bit repitative, so let's refactor the
out the duplicated code.  Don't go too wild we don't want to
create anything to complicated.  Good test code is simple.

* `test_can_sum_two_numbers()` can be incorporated in `test_can_take_variable_number_of_arguments()`
* `test_that_no_arguments_return_zero()` should be kept in a separate assertion but we can
   refactor the test running code to avoid the duplication.

<pre class="file" data-filename="tests.py" data-target="replace">
import unittest

import calc

class TestRunFunction(unittest.TestCase):
    def _verify_cases(self, cases):
        for expected_sum, inputs in cases:
            result = my_sum(*inputs)
            self.assertEqual(expected_sum, result)

    def test_can_take_variable_number_of_arguments(self):
        self._verify_cases([
            [13, [13]],
            [10, [1, 2, 3, 4]],
            [-2, [3, -5]],
            [5, [2, 3]],
        ])

    def test_that_no_arguments_return_zero(self):
        self._verify_cases([
            [0, []],
        ])

if __name__ == '__main__':
    unittest.main()
</pre>

Verify that the tests still pass.

`python3 ./tests.py`{{execute}}
