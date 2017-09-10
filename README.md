# g-CodeCoverage

## Getting C++ TDD with code coverage analysis to work with various IDEs.

This project is a testbed for me for trying out the different C++ IDEs
available on Linux as of now (2017).

My background is developing in C++ with emacs and Makefiles and I know
how to get things done that way.

To broaden my horizon and to see if I can profit from modern IDEs
support for refactoring, code generation, and build system management,
while sacrificing the emacs editing features, I started this little
project to help me decide in which IDE I should invest my time, by
learning to use it better.  Obvious candidates are eclipse, qtcreator,
and clion.  Netbeans fell from the list of candidates early on, and I
do not quite remember the reason anymore.  Sorry, netbeans.

So I set out to implement a very small project that lets me do TDD
with googletest and googlemock and code coverage analysis in

- plain Makefiles (see branch make)
- eclipe (see branch eclipse)
- qtcreator (no branch for that, sorry, see below)
- clion (see branch clion)

with the idea that these projects can serve as templates for real
projects later on.

The resulting template projects can be found in the respective
branches of this project.

## Lessons learned
### make

It is not that often that I set up a new project to do TDD with C++
and code coverage analysis.  Doing it once more for this project, I
realize that, also (or especially) this kind of project benefits from
having a template which can simply be reused, and spent some time to
integrate googletest as a git submodule.

### eclipse

eclipse is the only IDE in this bunch that has a somewhat working
plugin that can display code coverage directly in the editor of the
IDE. And like others, it supports googletest and can show the red or
green bar and individual test results in a tree view if properly
configured.

One Major problem with eclipse was that this plugin is only somewhat
working.  I experienced situations where the code coverage analysis
was seemingly working and reporting the correct coverage summaries,
but the annotation in the editor did not work.  I also experienced
that the gcov plugin in eclipse would report weird errors instead of
working.

Besides that, I found eclipse was difficult to configure, as the
locations of configuration dialogues are non-intuitive and spread, and
too many settings had to be configured after project creation: C++11,
no tabs, compile googletest without confusing the internal builder,
execute tests in test runner, and finally the coverage.  Even better,
half of these settings are forgotten when the project is opened in a
different "workspace" or on a different computer.  Some actions that I
used more than once seemed to have no keyboard shortcuts.  Why do they
still use -std=c++0x for C++11?  That feels pretty abandonned.  The
directory choices for git interaction are quite surprising.

On top of that, ecliipse crashed every single time that I exited it.
Leaving an error log file in the git repository of my example project,
of all places.

So despite being the only IDE that currently supports code coverage
analysis, my choice of IDE will probably not be eclipse.

### clion

I got that 30 day evaluation license to try out clion, a commercial
product that costs money otherwise.

Clion uses cmake as the build system and also somehow as the project
bookkeeping tool.  Files have to appear in CMakeLists.txt files
somewhere, otherwise they are greyed out in the project navigator.
Clion supports spreading CMakeLists.txt files over directory
hierarchies, but by default it seems to use only one file in the
project's root. I.e. if I add a source file to a subdirectory, the IDE
adds it to the cmake file in the root directory, instead of creating a
new cmake file in the subdirectory.

The IDE helps somewhat with managing the cmake files, but for some
things like adding googletest to the project or activating the
coverage flags for compiler and linker, the cmake files have to be
edited manually.

Clion also supports googletest by displaying test results nicely.  It
does not support coverage analysis, Jetbrains does not plan to add
this in the future, and there is no third-party plugin.

To display coverage analysis I used the lcov/genhtml/browser
combination just like I do with Makefiles.  For this, it would have
been nice if clion would support executing a custom command after
running the tests, but unfortunately this is not possible.  Instead,
one can add a custom command to execute before the IDE runs the tests.
Therefore, I resolved to have a script that actually executed the
tests, then does the coverage analysis and starts the browser, before
the IDE executes the tests itself a second time.

Similar to eclipse, some settings (like configuring the test
execution) are not considered part of the project and are by default
not checked into git.  So they have to be recreated manually on every
development machine.

Overall, my impression is mixed.  I have to resort to the browser
thing for coverage analysis, so no IDE feeling there.  I feel like I
have to learn two things at once, clion and cmake, to make effective
use of clion.  Apart from that I have a feeling that the code
completion and code generation features could really help. (I have not
done much refactoring yet with clion).  At the end of the trial period
I would have to shell out some money to Jetbrains if I want to
continue to use it.

### qtcreator

qtcreator feels much more snappy than either eclipse or clion.  In the
past, I tried to import a large C++ software project into every IDE
listed here, qtcreator was finished with indexing the sources in about a
minute, but I had to kill the other IDEs after half an hour.

The downside of qtcreator is Qt.  qtcreator is certainly Qt-centric.
Yes, you can develop non-Qt software with qtcreator, but you cannot
even create a non-Qt project unless you install the Qt development
library (qmake and qt-headers have to be part of a "Kit" that you
configure, commonly known as toolchain, even if you do not use them).

Technically, qtcreator is LGPL and you could use it for free for non-Qt
development, but the download website does its best to alienate you into
wondering if you need a commercial license from them.

Qt has recently gone in a strange direction with the QML stuff, but
fortunately this is not something that impedes C++ development with
qtcreator.  What does impede C++ development is that qtcreator has
recently lost its support for plain Makefile projects.

The qtcreator plugin guide lists a plugin for code coverage, but
neither that nor any of its forks can still be used with the current
qtcreator version.

Cmake projects are now supported, but qtcreator seems to have no
support for managing the CMakeLists.txt files through IDE operations.
The other option is qmake, and I do not want to go there for a non-Qt
project.

So with no support from the IDE for generating cmake files and no support
for Makefile based projects, I could not configure this example project
with qtcreator, as my cmake knowledge is minimal.

It is possible to open the clion project in qtcreator, because
qtcreator understands the cmake files genereted by clion -- somewhat.
It is possible to compile the code and to execute the tests and to have
the test result displayed nicely.  But some source files do not appear in
the qtcreator project view and I have no idea how to solve that.

An I have not tried to integrate lcov/web browser code coverage analysis.

## Summary

I am not completely happy with either of the choices. So far, clion seems
to have the least negative points, if you disregard the money thing.

I think I will continue to try out clion for the remainder of my
evaluation period and after that have another look at qtcreator, and
then decide whether I want to by clion or not.
