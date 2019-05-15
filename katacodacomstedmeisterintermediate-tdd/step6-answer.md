<pre class="file" data-filename="webscraper.py" data-target="replace">
#! /usr/bin/env python3

import requests
import re

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
</pre>