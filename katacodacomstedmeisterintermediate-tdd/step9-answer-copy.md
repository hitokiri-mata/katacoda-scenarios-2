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
        requests_mock.get.return_value.content = b'a_string'

        # test
        response = webscraper.retrieve_web_content(mock.sentinel.web_url)

        # assert
        requests_mock.get.assert_called_once_with(mock.sentinel.web_url)
        self.assertEqual(response, 'a_string')


class TestExtractNumbersFromText(unittest.TestCase):
    def test_can_extract_whole_integers_from_text(self):
        text = r'This 100 is so234me sample\nthat exists 1\n\non a multiline1234.'
        numbers = webscraper.extract_numbers_from_text(text)
        self.assertEqual(numbers, [100, 234, 1, 1234])
        print_mock.assert_not_called()


@mock.patch('webscraper.print')
@mock.patch('webscraper.extract_numbers_from_text', autospec=True)
@mock.patch('webscraper.retrieve_web_content', autospec=True)
class TestFindSumFromWebPage(unittest.TestCase):
    def test_can_read_the_sum_from_a_webpage(self, web_content_mock, extract_numbers_mock, print_mock):
        # setup
        web_content_mock.return_value = mock.sentinel.web_content
        extract_numbers_mock.return_value = [1, 2, 3, 4]

        # test
        result = webscraper.sum_of_numbers_from_webpage(mock.sentinel.a_url)

        # assert
        web_content_mock.assert_called_once_with(mock.sentinel.a_url)
        extract_numbers_mock.assert_called_once_with(mock.sentinel.web_content)
        self.assertEqual(result, 10)
        print_mock.assert_not_called()

    def test_integers_printed_out_when_in_debug(self, web_content_mock, extract_numbers_mock, print_mock):
        # setup
        web_content_mock.return_value = mock.sentinel.web_content
        extract_numbers_mock.return_value = [1, 2, 3, 4]

        # test
        result = webscraper.sum_of_numbers_from_webpage(mock.sentinel.a_url)

        # assert
        web_content_mock.assert_called_once_with(mock.sentinel.a_url)
        extract_numbers_mock.assert_called_once_with(mock.sentinel.web_content)
        self.assertEqual(result, 10)
        print_mock.assert_has_calls([
            mock.call(1),
            mock.call(2),
            mock.call(3),
            mock.call(4),
        ])


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


class TestGetArgs(unittest.TestCase):
    def test_url_only(self):        
        # test
        result = webscraper.parse_args(['pgm_name', 'a_url'])

        # assert
        self.assertEqual(result, {
            'url': 'a_url',
            'debug': False,
        })

    
    def test_url_and_debug_flag_first(self):
        # test
        result = webscraper.parse_args(['pgm_name', '-v', 'a_url'])

        # assert
        self.assertEqual(result, {
            'url': 'a_url',
            'debug': True,
        })

    def test_url_and_debug_flag_second(self):
        # test
        result = webscraper.parse_args(['pgm_name', 'a_url', '-v'])

        # assert
        self.assertEqual(result, {
            'url': 'a_url',
            'debug': True,
        })


if __name__ == '__main__':
    unittest.main()
</pre>

Application Code
================

<pre class="file" data-filename="unit-tests.py" data-target="replace">
#! /usr/bin/env python3

"""This module contains the unit tests for this module"""

import requests
import re
import sys
import argparse

def retrieve_web_content(url):
    return requests.get(url).content.decode('utf8')


def extract_numbers_from_text(text):
    regex = r'\d+'
    result = re.findall(regex, text)
    return [int(r) for r in result]


def sum_of_numbers_from_webpage(url, debug=False):
    content = retrieve_web_content(url)
    nums = extract_numbers_from_text(content)
    if debug:
        for n in nums:
            print n
    return sum(nums)


def parse_args(argv):
    parser = argparse.ArgumentParser(description='Sum the numbers from a webpage')
    parser.add_argument('-v', action='store_true', dest='debug', help='Turn on debugging')
    parser.add_argument('url', help='The url to scrape')
    args = parser.parse_args(argv)
    return vars(args)
    
    
def main():
    url = sys.argv[1]
    result = sum_of_numbers_from_webpage(url)
    print (result)
</pre>