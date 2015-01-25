@echo off
SET ORIGINAL_PATH=%PATH%

SET X64=0

REM ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
REM ruby 1.9.3p551 (2014-11-13) [i386-mingw32]
REM 1.9.3
REM i386-mingw32
REM ruby

REM ruby 2.0.0p598 (2014-11-13) [i386-mingw32]
REM 2.0.0
REM i386-mingw32
REM ruby

REM ruby 2.1.5p273 (2014-11-13 revision 48405) [i386-mingw32]
REM 2.1.5
REM i386-mingw32
REM ruby

REM jruby 1.7.18 (1.9.3p551) 2014-12-22 625381c on Java HotSpot(TM) Client VM 1.7.0_07-b10 +jit [Windows 7-x86]
REM 2.1.5
REM x64-mingw32
REM ruby

REM ruby 2.0.0p598 (2014-11-13) [x64-mingw32]
REM 2.0.0
REM x64-mingw32
REM ruby

REM ruby 2.1.5p273 (2014-11-13 revision 48405) [x64-mingw32]
REM 2.1.5
REM x64-mingw32
REM ruby

REM jruby 1.7.18 (1.9.3p551) 2014-12-22 625381c on Java HotSpot(TM) Client VM 1.7.0_07-b10 +jit [Windows 7-x86]
REM 2.1.5
REM x64-mingw32
REM ruby
REM ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

REM #################################################################
REM Ruby 1.9.3

SET PATH=C:\Ruby193\bin;%ORIGINAL_PATH%
CALL ruby -v
CALL ruby -e 'puts RUBY_VERSION; puts RUBY_PLATFORM; puts RUBY_ENGINE; puts "\n"'

REM #################################################################
REM Ruby 2.0 (32 bit)

SET PATH=C:\Ruby200\bin;%ORIGINAL_PATH%
CALL ruby -v
CALL ruby -e 'puts RUBY_VERSION; puts RUBY_PLATFORM; puts RUBY_ENGINE; puts "\n"'

REM #################################################################
REM Ruby 2.1.5 (32 bit)

SET PATH=C:\Ruby21\bin;%ORIGINAL_PATH%
CALL ruby -v
CALL ruby -e 'puts RUBY_VERSION; puts RUBY_PLATFORM; puts RUBY_ENGINE; puts "\n"'

REM #################################################################
REM JRuby 1.7.18 (32 bit)

SET PATH=C:\jruby-1.7.18\bin;%ORIGINAL_PATH%
CALL jruby -v
CALL ruby -e 'puts RUBY_VERSION; puts RUBY_PLATFORM; puts RUBY_ENGINE; puts "\n"'

IF %X64==0 GOTO Eof
REM #################################################################
REM Ruby 2.0 (64 bit)

SET PATH=C:\Ruby200-x64\bin;%ORIGINAL_PATH%
CALL ruby -v
CALL ruby -e 'puts RUBY_VERSION; puts RUBY_PLATFORM; puts RUBY_ENGINE; puts "\n"'

REM #################################################################
REM Ruby 2.1.5 (64 bit)

SET PATH=C:\Ruby21-x64\bin;%ORIGINAL_PATH%
CALL ruby -v
CALL ruby -e 'puts RUBY_VERSION; puts RUBY_PLATFORM; puts RUBY_ENGINE; puts "\n"'

REM #################################################################
REM JRuby 1.7.18 (64 bit)

SET PATH=C:\jruby-1.7.18-x64\bin;%ORIGINAL_PATH%
CALL jruby -v
CALL ruby -e 'puts RUBY_VERSION; puts RUBY_PLATFORM; puts RUBY_ENGINE; puts "\n"'

:Eof
