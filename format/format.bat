@echo off

SET BASEPATH=%~dp0

CALL "%JULIA_1103%" --project=%BASEPATH% %BASEPATH%\format.jl