Implement debugging
===================

In order to implement the debugging, we're going to have to
improve our command line handling.  Because we're doing more than
just taking a simple command line argument.  Let's rewrite
the parsing using argparse.

In order to keep argument parsing as a stand alone unit, let's create
a new function `parse_args()` that will take an args argument and
return a dictionary of values.

We'll extend the testing to make sure that the `-v` flag can appear
before and after the url.

Create a new unit test class for this functionality and then implement
the function.

`python3 unit-tests.py`{{execute}}