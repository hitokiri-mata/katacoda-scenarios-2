Unit Test Code
==============

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


@mock.patch('webscraper.extract_numbers_from_text', autospec=True)
@mock.patch('webscraper.retrieve_web_content', autospec=True)
class TestFindSumFromWebPage(unittest.TestCase):
    def test_can_read_the_sum_from_a_webpage(self, web_content_mock, extract_numbers_mock):
        # setup
        web_content_mock.return_value = mock.sentinel.web_content
        extract_numbers_mock.return_value = [1, 2, 3, 4]

        # test
        result = webscraper.sum_of_numbers_from_webpage(mock.sentinel.a_url)

        # assert
        web_content_mock.assert_called_once_with(mock.sentinel.a_url)
        extract_numbers_mock.assert_called_once_with(mock.sentinel.web_content)
        self.assertEqual(result, 10)


@mock.patch('webscraper.sys', autospec=True)
@mock.patch('webscraper.sum_of_numbers_from_webpage', autospec=True)
@mock.patch('webscraper.print')
class TestWebScraperMain(unittest.TestCase):
    def test_webscraper_main(self, print_mock, number_sum_mock, sys_mock):
        # setup
        sys_mock.argv = [mock.sentinel.pgm_name, mock.sentinel.a_url]
        number_sum_mock.return_value = mock.sentinel.number_sum

        # test
        result = webscraper.main()

        # assert
        number_sum_mock.assert_called_once_with(mock.sentinel.a_url)
        print_mock.assert_called_once_with(mock.sentinel.number_sum)


if __name__ == '__main__':
    unittest.main()
</pre>

Application Code
================

<pre class="file" data-filename="webscraper.py" data-target="replace">
#! /usr/bin/env python3

"""This module contains the unit tests for this module"""

import requests
import re
import sys

def retrieve_web_content(url):
    return requests.get(url).content


def extract_numbers_from_text(text):
    regex = r'\d+'
    result = re.findall(regex, text)
    return [int(r) for r in result]


def sum_of_numbers_from_webpage(url):
    content = retrieve_web_content(url)
    nums = extract_numbers_from_text(content)
    return sum(nums)
    
    
def main():
    url = sys.argv[1]
    result = sum_of_numbers_from_webpage(url)
    print (result)

if __name__ == '__main__':
    main()
</pre>