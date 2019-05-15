Unit Test Code
==============

<pre class="file" data-target="clipboard">
class TestGetArgs(unittest.TestCase):
    def test_url_only(self):        
        # test
        result = webscraper.parse_args(['a_url'])

        # assert
        self.assertEqual(result, {
            'url': 'a_url',
            'debug': False,
        })

    
    def test_url_and_debug_flag_first(self):
        # test
        result = webscraper.parse_args(['-v', 'a_url'])

        # assert
        self.assertEqual(result, {
            'url': 'a_url',
            'debug': True,
        })

    def test_url_and_debug_flag_second(self):
        # test
        result = webscraper.parse_args(['a_url', '-v'])

        # assert
        self.assertEqual(result, {
            'url': 'a_url',
            'debug': True,
        })
</pre>

Application Code
================

<pre class="file" data-target="clipboard">
def parse_args(argv):
    parser = argparse.ArgumentParser(description='Sum the numbers from a webpage')
    parser.add_argument('-v', action='store_true', dest='debug', help='Turn on debugging')
    parser.add_argument('url', help='The url to scrape')
    args = parser.parse_args(argv)
    return vars(args)
</pre>