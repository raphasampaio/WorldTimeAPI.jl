@echo off

SET BASEPATH=%~dp0

CALL "%JULIA_1103%" --project=%BASEPATH% --interactive --load=%BASEPATH%\revise.jl