A new requirement
=================

A new requirement has just arrived - some of the inputs might be strings.

The pattern should be clear by now.  First create the failing test:

<pre class="file" data-target="clipboard">

class TestSumNumbers(unittest.TestCase):
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

    def test_can_handle_strings_as_inputs(self):
        self._verify_cases([
            [13, ['13']],
            [23, [23]],
            [10, [1, '2', 3, 4]],
            [-2, [3, -5]],
            [5, ['2', '3']],
        ])

</pre>

Verify that the tests fail:

`python3 ./simpleexample.py`{{execute}}

Update `my_sum()`.

<pre class="file" data-target="clipboard">
def my_sum(*args):
    if len(args) == 0:
        return 0
    int_args = [int(a) for a in args]
    return sum(int_args)
</pre>

Verify the tests pass.

`python3 ./simpleexample.py`{{execute}}

Edge cases
----------

* What about empty strings
* What about strings that can't be made into numbers
* What about octal or hexadecimal numbers