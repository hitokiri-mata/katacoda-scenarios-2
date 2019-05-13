First create a failing test
===========================

Although TDD is focussed on writing the tests first, the idea
is not to write a big test suite up front, but rather a small
test case that is just enough to cause a failing test so that
some functionality can be added.

With that in mind, a good first test would be to validate the
sum of two numbers and set aside the variable number of
arguments requirement for now.

Update `tests.py` with the following test case:

Step 1 - Write a test to test the sum of two numbers
----------------------------------------------------

<pre class="file" data-filename="tests.py" data-target="replace">
import unittest

import calc

class TestRunFunction(unittest.TestCase):
    def test_can_sum_two_numbers(self):
        result = calc.my_sum(2, 3)
        self.assertEqual(result, 5)

if __name__ == '__main__':
    unittest.main()
</pre>

Verify that the tests fail.  This step is important as we want to make
sure that our tests work and that they are passing because our code is
correct and not because they are not running correctly.

`python3 ./tests.py`{{execute}}
