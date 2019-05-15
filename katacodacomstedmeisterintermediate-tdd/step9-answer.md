Acceptance Test Code
====================

<pre class="file" data-filename="acceptance-tests.py" data-target="replace">
#! /usr/bin/env python3

"""This module contains the acceptance tests for this module"""

import unittest
import subprocess

class TestWebScraper(unittest.TestCase):
    def test_can_add_whole_numbers(self):
        result = subprocess.check_output('./webscraper.py http://localhost:8000/response1.html', shell=True)
        self.assertEqual(result, b'1834\n')
        
    def test_can_print_numbers_in_debug_mode(self):
        result = subprocess.check_output('./webscraper.py -v http://localhost:8000/response1.html', shell=True)
        self.assertEqual(result, b'1000\n33\n12\n789\n1834\n)

if __name__ == '__main__':
    unittest.main()
</pre>
