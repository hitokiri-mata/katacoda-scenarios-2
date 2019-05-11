Extend the tests
================

It's time to extend the tests to cope with a variable number of
arguments, so extend the test code to be as follows:

<pre class="file" data-target="clipboard">
class TestSumNumbers(unittest.TestCase):
    def test_can_sum_two_numbers(self):
        result = my_sum(2, 3)
        self.assertEqual(result, 5)

    def test_can_take_variable_number_of_arguments(self):
        cases = [
            13, [13],
            10, [1, 2, 3, 4],
            -2, [3, -5]
        ]
        for expected_sum, inputs in cases:
            result = my_sum(*inputs)
            self.assertEqual(expected_sum, result)
</pre>

And verify that the tests now fail.

`python3 ./simpleexample.py`{{execute}}

Now update `my_sum()` to fix the failing tests.

<pre class="file" data-target="clipboard">
def my_sum(*args):
    return sum(*args)
</pre>

And verify that the tests pass:

`python3 ./simpleexample.py`{{execute}}

What about an empty list
------------------------

In the process of creating this test case, it becomes apparent that
the special case of no arguments has not been considered.  As the
behaviour is not clear.