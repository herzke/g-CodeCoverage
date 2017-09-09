# g-CodeCoverage

Template project for setting up a C++ development project with unit tests
and code coverage analysis.

The project in this branch is a template for test driven development
and code coverage analysis with eclipse CDT.

It uses CDT's internal builder. Googletest (with googlemock) is included 
as a git submodule. That subdirectory is excluded from being built by the
internal builder, instead, some include paths point here, and some source
files are included directly by the project's test runner, 
test/test_runner.cpp.

To execute the unit tests, the eclipse plugin "C/C++ Unit Testing Support"
should be installed, and a run configuration unter "C/C++ Unit" should be
generated.

Coverage analysis has been enabled in the debug setings of the C and C++ 
compilers.  After building and executing, the coverage analysis has to
be run by double-clicking on one of the coverage analysis output files
(ending in .gcda or .gcno). The coverage analysis will then open a
dedicated view with coverage percentages, and will also add red/green
background highlighting to the C/C++ source files in the editor.

The project's git history tracks how to set up such an eclipse C++ project 
with googletest and coverage analysis from scratch.  This branch can be used 
as a starting point for TDD projects with coverage analysis for eclipse CDT. 
The next step would be to replace src/factorial.{cpp,hh} and 
test/factorial_test.cpp with the first test for the project's domain.
