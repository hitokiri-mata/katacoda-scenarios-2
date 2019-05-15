Add debug flag to the sum function
==================================

Unit Test Case
--------------

<pre class="file" data-target="clipboard">
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
        result = webscraper.sum_of_numbers_from_webpage(mock.sentinel.a_url, True)

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
</pre>

Application Code
----------------

<pre class="file" data-target="clipboard">
def sum_of_numbers_from_webpage(url, debug=False):
    content = retrieve_web_content(url)
    nums = extract_numbers_from_text(content)
    if debug:
        for n in nums:
            print (n)
    return sum(nums)
</pre>


Extend main function
====================

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
        number_sum_mock.assert_called_once_with(mock.sentinel.a_url, mock.sentinel.debug)
        print_mock.assert_called_once_with(mock.sentinel.number_sum)
        parse_args_mock.assert_called_once_with(mock.sentinel.argv_values)
</pre>


<pre class="file" data-target="clipboard">
def main():
    args = parse_args(sys.argv[1:])
    result = sum_of_numbers_from_webpage(args['url'], args['debug'])
    print (result)
</pre>