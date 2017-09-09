# g-CodeCoverage

The project in this branch is a template for test driven development
and code coverage analysis with the CLion IDE (version 2017.2.2).
It's git history can either serve as a template project for setting up
a C++ development project with unit tests and code coverage analysis
in CLion, or this branch can directly be used to base another project on.

CLion has no built-in coverage analysis, and I do not know of any
third-party plugin that would provide this functionality.  Coverage
analysis is therefore displayed in a web browser.

To enable this, the run configurations have to be edited like shown in the
screenshot.png. This configuration is stored in .idea/workspaces.xml, which
Jetbrains advises not to include in version control, since it contains user
specific settings.
