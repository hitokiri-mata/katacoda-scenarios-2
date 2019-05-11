Refactor
========

The test code is looking a bit repitative, so let's refactor the
out the duplicated code.  Don't go too wild we don't want to
create anything to complicated.  Good test code is simple.

* `test_can_sum_two_numbers()` can be incorporated in `test_can_take_variable_number_of_arguments()`
* `test_that_no_arguments_return_zero()` should be kept in a separate assertion but we can
   refactor the test running code to avoid the duplication.

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

</pre>

Verify that the tests fail:

`python3 ./simpleexample.py`{{execute}}

Update `my_sum()`.

<pre class="file" data-target="clipboard">
def my_sum(*args):
    if len(args) == 0:
        return 0
    return sum(args)
</pre>

Verify the tests pass.

`python3 ./simpleexample.py`{{execute}}