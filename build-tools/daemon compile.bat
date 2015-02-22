@call var.bat
@bash index.sh
@echo Building DCX daemon...
@rem todo: rewrite this with ^ line wrapping

@set PARAMS=%PARAMS% USE_UPNP=1
@rem remove "rem " from the next line to deactivate upnp
@rem set PARAMS=%PARAMS% USE_UPNP=-

@cd src
@mingw32-make -f makefile.mingw %PARAMS%
@if errorlevel 1 goto error
@echo.
@echo.
@strip %COINNAME%d.exe
@if errorlevel 1 goto error
@echo !!!!!!! %COINNAME% Complete
@echo.
@echo.
@if not "%RUNALL%"=="1" pause
@goto end

:error
@echo.
@echo.
@echo !!!!!! Error! Build daemon failed.
@pause
:end
@cd ..\%EWBPATH%
