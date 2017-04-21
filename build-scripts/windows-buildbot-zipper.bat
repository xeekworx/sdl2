@echo off
rem just a helper batch file for collecting up files and zipping them.
rem usage: windows-buildbot-zipper.bat <zipfilename>
rem must be run from root of SDL source tree.

rem This has been changed for Xeekworx so that it includes more builds
rem and uses 7-zip instead of the mystery zip command.

SETLOCAL
IF EXIST "VisualC\Win32\Release [Static]" ^
IF EXIST "VisualC\x64\Release [Static]" ^
IF EXIST "VisualC\Win32\Debug [Static]" ^
IF EXIST "VisualC\x64\Debug [Static]" (
 SET have_staticlibs=true
)

IF EXIST VisualC\Win32\Release ^
IF EXIST VisualC\x64\Release ^
IF EXIST VisualC\Win32\Debug ^
IF EXIST VisualC\x64\Debug (
 GOTO okaydir
) ELSE (
 echo Please run from root of source tree after doing complete Debug and Release builds.
 GOTO done
)

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

IF have_staticlibs == "true" {
 mkdir lib\win32\release_static
 mkdir lib\win32\debug_static
 mkdir lib\x64\release_static
 mkdir lib\x64\debug_static
 
 copy "..\..\VisualC\Win32\Release [Static]\SDL2.lib" lib\win32\release_static\
 copy ..\..\VisualC\Win32\Release\SDL2main.lib lib\win32\release_static\
 copy "..\..\VisualC\x64\Release [Static]\SDL2.lib" lib\x64\release_static\
 copy ..\..\VisualC\x64\Release\SDL2main.lib lib\x64\release_static\
 copy "..\..\VisualC\Win32\Debug [Static]\SDL2.lib" lib\win32\debug_static\
 copy ..\..\VisualC\Win32\Debug\SDL2main.lib lib\win32\debug_static\
 copy "..\..\VisualC\x64\Debug [Static]\SDL2.lib" lib\x64\debug_static\
 copy ..\..\VisualC\x64\Debug\SDL2main.lib lib\x64\debug_static\
)

cd ..
if exist ..\%1 erase /q /f ..\%1
..\build-scripts\7z.exe a -tzip -y ..\%1 SDL
cd ..
erase /q /f /s zipper
rd /s /q zipper
if exist zipper rd /s /q zipper

:done

