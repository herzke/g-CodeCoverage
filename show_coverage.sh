#!/bin/sh
(./cmake-build-debug/run_tests \
&& lcov --capture --directory . --output-file coverage.info \
&& genhtml coverage.info --prefix $PWD --output-directory coverage \
&& x-www-browser ./coverage/src/index.html) #>/dev/null
