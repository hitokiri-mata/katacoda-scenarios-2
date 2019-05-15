Our first unit test
===================

Now that we have a failing acceptance test, we can start filling in the
functionality.  Creating unit tests before adding each step.

The main functionality can be described in the following steps:

* Download the web page
* Extract the numbers from some text
* Sum the result and print it out

Let's start with the first step about retrieving the web content.  Here's a failing
test to get you started:

<pre class="file" data-filename="unit-tests.py" data-target="replace">
#! /usr/bin/env python3

"""This module contains the unit tests for this module"""

import unittest
from unittest import mock
import webscraper

@mock.patch('webscraper.requests', autospec=True)
class TestRetrieveWebPage(unittest.TestCase):
    def test_can_retrieve_webpage(self, requests_mock):
        # setup
        requests_mock.get.return_value.content = mock.sentinel.web_response

        # test
        response = webscraper.retrieve_web_content(mock.sentinel.web_url)

        # assert
        requests_mock.get.assert_called_once_with(mock.sentinel.web_url)
        self.assertEqual(response, mock.sentinel.web_response)


if __name__ == '__main__':
    unittest.main()
</pre>

Verify that the test fails before moving on:

`python3 unit-tests.py`{{execute}}

Before implementing the functionality, there is a lot going on in that code,
so let's talk our way through it.

`@mock.patch('webscraper.requests', autospec=True)`.  Because our implementation
of this function is going to use python's `requests` module, but we don't want to
actually make a request during testing, we replace the `requests` object with
a mock.  This is done using the `mock.patch` decorator.

By default `mock.patch` replaces an object with a magic mock class that will
allow and track any interaction with the object.  Passing `autospec=True` means
that the mock object will mimic the object its replacing which makes for more
accurate tests.  Not sure why this isn't the default behaviour.

`def test_can_retrieve_webpage(self, requests_mock):`.  Because we have patched
requests at the class level, the mock object is available on every test case.

`requests_mock.get.return_value.content = mock.sentinel.web_response`.  `mock`
has a concept of sentinel values.  Rather than relying on magic strings, if you
wish to assert that the output of one function is passed to another, then
it is enough to have that function return a sentinel value.  The aforementioned
line of code configures our requests mock to do just that.

`response = webscraper.retrieve_web_content(mock.sentinel.web_url)`.  Here we
call the function that we wish to test.  The url is passed in as a sentinel.

`requests_mock.get.assert_called_once_with(mock.sentinel.web_url)`.  Mock objects
have a number of assertions to check how functions have been called.  This assertion
ensures that we attempted to `get` the url that was passed into the function.

`self.assertEqual(response, mock.sentinel.web_response)`.  Lastly we assert that
our function under test returns the correct value.

Now we can implement this functionality, so add in the following code.

<pre class="file" data-filename="webscraper.py" data-target="replace">
#! /usr/bin/env python3

"""This module contains the unit tests for this module"""

import requests

def retrieve_web_content(url):
    return requests.get(url).content

</pre>

Verify that this fixes the tests:

`python3 unit-tests.py`{{execute}}