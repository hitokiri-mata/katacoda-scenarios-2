Intermediate TDD
================

This scenario is a worked example creating a web scraping utility.

It creates tests at the acceptance test level and at the unit test level.

Acceptance tests are tests that run a higher level than unit tests
and are used to validate correct the code behaves correctly.  Because the
tests are run at a higher level, it is more difficult to test all edge cases.

On the flip side, whilst unit tests are great for testing every edge case
an acceptance test is still required to validate that the units are connected
together in the correct way.  Thus a good test suite will include both unit
and acceptance tests.

When creating these tests, it is worth having a clear understanding of the boundaries
of the system under test and what sub systems need to be mocked, in order to provide
isolation from external systems outside of your control.  Writing tests first will
encourage thinking about this before creating the code, which might slow the initial
development will allow overall development to go faster.

