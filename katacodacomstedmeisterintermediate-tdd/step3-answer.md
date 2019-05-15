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


class TestExtractNumbersFromText(unittest.TestCase):
    def test_can_extract_whole_integers_from_text(self):
        text = r'This 100 is so234me sample\nthat exists 1\n\non a multiline1234.'
        numbers = webscraper.extract_numbers_from_text(text)
        self.assertEqual(numbers, [100, 234, 1, 1234])

if __name__ == '__main__':
    unittest.main()
</pre>