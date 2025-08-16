@echo off

REM BlauLang Compiler Runner
REM This batch file runs the BlauLang compiler

echo BlauLang Compiler Runner
 echo ======================

echo Running hello.bll example...
REM In a real implementation, this would invoke the BlauLang compiler
REM For now, we'll just display the example code

type hello.bll

echo 
To compile and run your own BlauLang programs, use:
REM blauc [source_file] [output_file]