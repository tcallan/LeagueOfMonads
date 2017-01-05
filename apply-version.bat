@ECHO off

SET VERSION=0.1
SET PATH=3rd\Ploeh;3rd\Ssed

ECHO.
ECHO CURRENT VERSION: %VERSION%
ECHO.

Zero29.exe -a %VERSION%

IF EXIST ".\3rd\NuGet\DrivenRop.nuspec.bak" del /F /Q ".\DrivenRop.nuspec.bak"
IF EXIST ".\build-nuget.bat.bak" del /F /Q ".\build-nuget.bat.bak"
IF EXIST ".\release.msbuild.bak" del /F /Q ".\release.msbuild.bak"

ssed.exe -i.bak "s/<version>.*<\/version>/<version>%VERSION%<\/version>/g" ".\3rd\NuGet\DrivenRop.nuspec"
ssed.exe -i.bak "s/DrivenRop\..*\.nupkg/DrivenRop\.%VERSION%\.nupkg/g" ".\build-nuget.bat"
ssed.exe -i.bak "s/DrivenRop\..*\.zip/DrivenRop\.%VERSION%\.zip/g" ".\build-all.msbuild"

DEL /F /Q ".\3rd\NuGet\DrivenRop.nuspec.bak"
DEL /F /Q ".\build-nuget.bat.bak"
DEL /F /Q ".\build-all.msbuild.bak"

ECHO.
PAUSE