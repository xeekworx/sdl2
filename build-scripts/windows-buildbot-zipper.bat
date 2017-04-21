@echo off
rem just a helper batch file for collecting up files and zipping them.
rem usage: windows-buildbot-zipper.bat <zipfilename>
rem must be run from root of SDL source tree.

rem This has been changed for Xeekworx so that it includes more builds
rem and uses 7-zip instead of the mystery zip command.

IF EXIST VisualC\Win32\Release GOTO okaydir
echo Please run from root of source tree after doing a complete Debug and Release build.
GOTO done

:okaydir
erase /q /f /s zipper
IF EXIST zipper GOTO zippermade
mkdir zipper
:zippermade
cd zipper
mkdir SDL
cd SDL
mkdir include
mkdir lib
mkdir lib\win32
mkdir lib\win32\release
mkdir lib\win32\debug
mkdir lib\x64
mkdir lib\x64\release
mkdir lib\x64\debug
copy ..\..\include\*.h include\
copy ..\..\VisualC\Win32\Release\SDL2.dll lib\win32\release\
copy ..\..\VisualC\Win32\Release\SDL2.lib lib\win32\release\
copy ..\..\VisualC\Win32\Release\SDL2main.lib lib\win32\release\
copy ..\..\VisualC\x64\Release\SDL2.dll lib\x64\release\
copy ..\..\VisualC\x64\Release\SDL2.lib lib\x64\release\
copy ..\..\VisualC\x64\Release\SDL2main.lib lib\x64\release\
copy ..\..\VisualC\Win32\Debug\SDL2.dll lib\win32\debug\
copy ..\..\VisualC\Win32\Debug\SDL2.lib lib\win32\debug\
copy ..\..\VisualC\Win32\Debug\SDL2.pdb lib\win32\debug\
copy ..\..\VisualC\Win32\Debug\SDL2main.lib lib\win32\debug\
copy ..\..\VisualC\x64\Debug\SDL2.dll lib\x64\debug\
copy ..\..\VisualC\x64\Debug\SDL2.lib lib\x64\debug\
copy ..\..\VisualC\x64\Debug\SDL2.pdb lib\x64\debug\
copy ..\..\VisualC\x64\Debug\SDL2main.lib lib\x64\debug\
cd ..
erase /q /f ..\%1
..\build-scripts\7z.exe a -tzip -y ..\%1 SDL
cd ..
erase /q /f /s zipper

:done

