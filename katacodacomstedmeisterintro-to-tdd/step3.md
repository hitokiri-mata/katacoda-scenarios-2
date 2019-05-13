Now make the test pass
======================

The application code is in `calc.py`.  

Let's define the function and make the test pass.

The simplest function that can make the test pass is:

<pre class="file" data-filename="calc.py" data-target="replace">
def my_sum(a, b):
    return a + b
</pre>

Let's run the tests and verify that they pass:

`python3 ./tests.py`{{execute}}
