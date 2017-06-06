![Xeekworx](http://xeekworx.com/images/github/xeekworx_logo.png) <br />
Modified SDL2 Source, currently version 2.0.5
===========

**This is a modified version of SDL2 for Xeekworx projects.**

Modifications are listed here:
1. Microsoft Visual Studio 2017 Support
2. Using the Windows 10 SDK and v141 toolset for the VS2017 projects
3. C Runtimes set to static in the VS2017 projects
4. Fixed C Runtimes to be the correct debug vs release versions in the VS2017 projects
5. New "Release [Static]" & "Debug [Static]" VS2017 project configurations for building a SDL2 static library
6. Improved Windows Buildbot Zipper batch script that utilizes an included 7-zip utility
7. Static VS2017 configurations will create libraries that do not cause unnecessary exports and forces SDL2 to utilize MSVCRT libraries for better compatibility with projects using these libraries.

To build an application with the SDL2 static library for Windows you will need to add these other libraries (a part of the Windows SDK) to your link configuration:
winmm.lib
imm32.lib
version.lib
