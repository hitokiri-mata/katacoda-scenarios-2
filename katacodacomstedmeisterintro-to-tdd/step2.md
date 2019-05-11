A Simple Example
================

The requirement:

  * Create a function that will take a variable amount of arguments
    and return the sum.

Step 1 - Write a test to test the sum of two numbers
----------------------------------------------------

<pre class="file" data-target="clipboard">
class TestSumNumbers(unittest.TestCase):
    def test_can_sum_two_numbers(self):
        result = my_sum(2, 3)
        self.assertEqual(result, 5)
</pre>

Verify that the tests fail.  This step is important as we want to make
sure that our tests work and that they are passing because our code is
correct and not because they are not running correctly.

`python3 ./simpleexample.py`{{execute}}
