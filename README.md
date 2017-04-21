![Xeekworx](http://xeekworx.com/images/github/xeekworx_logo.png) <br />
Modified SDL2 Source, currently vesion 2.0.5
===========

**This is a modified version of SDL2 for Xeekworx projects.**

Modifications are listed here:
1. Microsoft Visual Studio 2017 Support
2. Using the Windows 10 SDK and v141 toolset for the VS2017 projects
3. C Runtimes set to static in the VS2017 projects
4. Fixed C Runtimes to be the correct debug vs release versions in the VS2017 projects
5. New "Release [Static]" & "Debug [Static]" VS2017 project configurations for building a SDL2 static library
6. Improved Windows Buildbot Zipper batch script that utilizes an included 7-zip utility
