<pre class="file" data-filename="webscraper.py" data-target="replace">
#! /usr/bin/env python3

"""This module contains the unit tests for this module"""

import requests
import re

def retrieve_web_content(url):
    return requests.get(url).content


def extract_numbers_from_text(text):
    regex = r'\d+'
    result = re.findall(regex, text)
    return result
</pre>