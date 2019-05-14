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