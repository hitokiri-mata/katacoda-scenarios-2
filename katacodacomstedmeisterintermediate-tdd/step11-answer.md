Unit Test Code
==============

<pre class="file" data-target="clipboard">
@mock.patch('webscraper.parse_args', autospec=True)
@mock.patch('webscraper.sys', autospec=True)
@mock.patch('webscraper.sum_of_numbers_from_webpage', autospec=True)
@mock.patch('webscraper.print')
class TestWebScraperMain(unittest.TestCase):
    def test_webscraper_main(self, print_mock, number_sum_mock, sys_mock, parse_args_mock):
        # setup
        sys_mock.argv = ['prog_name', mock.sentinel.argv_values]
        number_sum_mock.return_value = mock.sentinel.number_sum
        parse_args_mock.return_value = { 'url': mock.sentinel.a_url, 'debug': mock.sentinel.debug }

        # test
        result = webscraper.main()

        # assert
        number_sum_mock.assert_called_once_with(mock.sentinel.a_url)
        print_mock.assert_called_once_with(mock.sentinel.number_sum)
        parse_args_mock.assert_called_once_with([mock.sentinel.argv_values])
</pre>

Application Code
================

<pre class="file" data-target="clipboard">
def main():
    args = parse_args(sys.argv[1:])
    url = args['url']
    result = sum_of_numbers_from_webpage(url)
    print (result)
</pre>