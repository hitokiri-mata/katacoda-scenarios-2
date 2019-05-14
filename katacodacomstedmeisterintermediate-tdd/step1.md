A web scraper
=============

In this example, we're going to build a command line utility that will take
a URL and return the sum of the integers found on the page.

Acceptance Tests first
----------------------

The first thing to do is to write an acceptance test.  We need to consider the
test interfaces to use.  An acceptance test should be closer to the actual environment.

`run-acceptance-tests.sh` is a script that will launch a webserver to serve files
before running the tests.  But before we can use it, we need to create a response
for it to return.

<pre class="file" data-filename="response1.html" data-target="replace">
Lorem ipsum 1000 dolor sit amet, 33consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute iru12re dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupid789atat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
</pre>

And now let's create the test to verify it

<pre class="file" data-filename="acceptance-tests.py" data-target="replace">
#! /usr/bin/env python3

"""This module contains the acceptance tests for this module"""

import unittest
import subprocess
    
class TestWebScraper(unittest.TestCase):
    def test_can_add_whole_numbers(self):
        result = subprocess.check_output('./webscraper.py http://localhost:8000/response1.html', shell=True)
        self.assertEqual(result, b'1045')

if __name__ == '__main__':
    unittest.main()
</pre>

Finally, let's verify that we can run the test and that it fails:

`./run-acceptance-tests.sh`{{execute}}