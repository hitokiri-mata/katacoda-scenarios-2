<pre class="file" data-filename="calc.py" data-target="replace">
def my_sum(*args):
    return sum(args)
</pre>

And verify that the tests pass:

`python3 ./tests.py`{{execute}}