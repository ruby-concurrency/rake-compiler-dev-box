@echo off
SET ORIGINAL_PATH=%PATH%

SET X64=0

SET TEST_RUNNER="./concurrent-ruby/build-tests/runner.rb"

REM #################################################################
REM Ruby 1.9.3
ECHO '###############################################################'

SET PATH=C:\Ruby193\bin;%ORIGINAL_PATH%

CALL ruby -v
CALL ruby %TEST_RUNNER%

REM #################################################################
REM Ruby 2.0.0 (32 bit)
ECHO '###############################################################'

SET PATH=C:\Ruby200\bin;%ORIGINAL_PATH%

CALL ruby -v
CALL ruby %TEST_RUNNER%

REM #################################################################
REM Ruby 2.1.5 (32 bit)
ECHO '###############################################################'

SET PATH=C:\Ruby215\bin;%ORIGINAL_PATH%

CALL ruby -v
CALL ruby %TEST_RUNNER%

IF %X64==0 GOTO Eof
REM #################################################################
REM Ruby 2.0 (64 bit)
ECHO '###############################################################'

SET PATH=C:\Ruby200-x64\bin;%ORIGINAL_PATH%

CALL ruby -v
CALL ruby %TEST_RUNNER%

REM #################################################################
REM Ruby 2.1.5 (64 bit)
ECHO '###############################################################'

SET PATH=C:\Ruby215-x64\bin;%ORIGINAL_PATH%

CALL ruby -v
CALL ruby %TEST_RUNNER%

:Eof
