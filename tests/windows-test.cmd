@echo off
SET ORIGINAL_PATH=%PATH%

SET VERSION="0.7.0.rc3"

SET X64=0

ECHO "concurrent-ruby-%VERSION%-x64-mingw32.gem"
ECHO "concurrent-ruby-%VERSION%-x86-mingw32.gem"
ECHO "concurrent-ruby-%VERSION%.gem"
ECHO "concurrent-ruby-%VERSION%-java.gem"

CALL gem uninstall concurrent-ruby -I -a -x

SET EXAMPLES="."
SET PKG="../concurrent-ruby/pkg"

REM #################################################################
REM Ruby 1.9.3
ECHO '###############################################################'

SET PATH=C:\Ruby193\bin;%ORIGINAL_PATH%

CALL ruby -v
CALL ruby C:\Ruby193\DevKit\dk.rb init
CALL ruby C:\Ruby193\DevKit\dk.rb install --force

CALL gem install %PKG%\concurrent-ruby-%VERSION%-x86-mingw32.gem --no-ri --no-rdoc
CALL ruby %EXAMPLES%/bench_atomic.rb
CALL gem uninstall concurrent-ruby -I -a -x

CALL gem install %PKG%\concurrent-ruby-%VERSION%.gem --no-ri --no-rdoc
CALL ruby %EXAMPLES%/bench_atomic.rb
CALL gem uninstall concurrent-ruby -I -a -x

REM #################################################################
REM Ruby 2.0 (32 bit)
ECHO '###############################################################'

SET PATH=C:\Ruby200\bin;%ORIGINAL_PATH%

CALL ruby -v
CALL ruby C:\Ruby200\DevKit\dk.rb init
CALL ruby C:\Ruby200\DevKit\dk.rb install --force

CALL gem install %PKG%\concurrent-ruby-%VERSION%-x86-mingw32.gem --no-ri --no-rdoc
CALL ruby %EXAMPLES%/bench_atomic.rb
CALL gem uninstall concurrent-ruby -I -a -x

CALL gem install %PKG%\concurrent-ruby-%VERSION%.gem --no-ri --no-rdoc
CALL ruby %EXAMPLES%/bench_atomic.rb
CALL gem uninstall concurrent-ruby -I -a -x

REM #################################################################
REM JRuby 1.7.2 (32 bit)
ECHO '###############################################################'

SET PATH=C:\jruby-1.7.12\bin;%ORIGINAL_PATH%

CALL jruby -v

CALL jgem install %PKG%\concurrent-ruby-%VERSION%-java.gem --no-ri --no-rdoc
CALL jruby %EXAMPLES%/bench_atomic.rb
CALL jgem uninstall concurrent-ruby -I -a -x

IF %X64==0 GOTO Eof
REM #################################################################
REM Ruby 2.0 (64 bit)
ECHO '###############################################################'

SET PATH=C:\Ruby200-x64\bin;%ORIGINAL_PATH%

CALL ruby -v
CALL ruby C:\Ruby200x64\DevKit\dk.rb init
CALL ruby C:\Ruby200x64\DevKit\dk.rb install --force

CALL gem install %PKG%\concurrent-ruby-%VERSION%-x64-mingw32.gem --no-ri --no-rdoc
CALL ruby %EXAMPLES%/bench_atomic.rb
CALL gem uninstall concurrent-ruby -I -a -x

CALL gem install %PKG%\concurrent-ruby-%VERSION%-x86-mingw32.gem --no-ri --no-rdoc
CALL ruby %EXAMPLES%/bench_atomic.rb
CALL gem uninstall concurrent-ruby -I -a -x

CALL gem install %PKG%\concurrent-ruby-%VERSION%.gem --no-ri --no-rdoc
CALL ruby %EXAMPLES%/bench_atomic.rb
CALL gem uninstall concurrent-ruby -I -a -x

REM #################################################################
REM JRuby 1.7.2 (64 bit)
ECHO '###############################################################'

SET PATH=c:\jruby-1.7.12x64\bin;%ORIGINAL_PATH%

CALL jruby -v

CALL jgem install %PKG%\concurrent-ruby-%VERSION%-java.gem --no-ri --no-rdoc
CALL jruby %EXAMPLES%/bench_atomic.rb
CALL jgem uninstall concurrent-ruby -I -a -x

:Eof
