Checking the acceptance test
============================

We should have all the functionality implemented, so let's run our acceptance tests

`bash run-acceptance-tests.sh`{{execute}}

Oh no, looks like they are still failing, with the following error:

`TypeError: cannot use a string pattern on a bytes-like object`

A bit of research into the error shows that a requests `response.content` object
returns a bytes object - we need to convert this to a string.  So let's fix our code
and the unit tests to rectify this.  Once that has been done, the acceptance tests should
now pass.

`bash run-acceptance-tests.sh`{{execute}}