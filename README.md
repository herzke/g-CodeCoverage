# g-CodeCoverage

Template project for setting up a C++ development project with unit tests
and code coverage analysis.

The project in this branch is a template for test driven development
with coverage analysis without an integrated development environment.
It uses Makefiles to automate building, testing, and coverage
analysis.  Googletest (with Googlemock) is used as the test framework.

The project's git history shows how to set up such a project from
scratch.  Either this setup procedure can be replayed in other projects,
or this branch can be used as a starting point - the next step would
be to replace src/factorial.{cpp,hh} and test/factorial_test.cpp with
the first test for the correct domain.
