Refactor
========

Whilst our first test case passes, it still doesn't meet the criteria
for the function - to take a variable number of arguments.  In python
this is done with the `*args` requirement.  So let's refactor the current
implementation of `my_sum()`.

<pre class="file" data-target="clipboard">
def my_sum(*args):
    return args[0] + args[1]
</pre>

Add verify that our tests still pass

`python3 ./simpleexample.py`{{execute}}