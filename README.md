# g-CodeCoverage

Template project for setting up a C++ development project with unit tests
and code coverage analysis.

The project in this branch is a template for test driven development
with eclipse CDT.

It uses CDT's internal builder. Googletest (with googlemock) is included 
as a git submodule. That subdirectory is excluded from being built by the
internal builder, instead, some include paths point here, and some source
files are included directly by the project's test runner, 
test/test_runner.cpp.

To execute the unit tests, the eclipse plugin "C/C++ Unit Testing Support"
should be installed, and a run configuration unter "C/C++ Unit" should be
generated.

Coverage analysis is not yet integrated.

The project's git history tracks how to set up such an eclipse C++ project 
with googletest from scratch.  This branch up to this point can be used as 
a starting point for TDD projects with eclipse CDT that do not need coverage 
analysis. The next step would be to replace src/factorial.{cpp,hh} and 
test/factorial_test.cpp with the first test for the project's domain.
