call "%ProgramFiles(x86)%\Microsoft Visual Studio 10.0\VC\vcvarsall.bat" x86

del .\Debug\Everything.obj
msbuild .\EverythingLib.vcxproj /p:configuration=Debug /p:platform=Win32 /nologo
IF NOT EXIST .\Debug\Everything.obj goto Error1

del .\x64\Debug\Everything.obj
msbuild .\EverythingLib.vcxproj /p:configuration=Debug /p:platform=X64 /nologo
IF NOT EXIST .\x64\Debug\Everything.obj goto Error1

goto End

:Error1
color 04
echo Compile Error!
goto End

:End
color 0a
echo Build Done!
pause
