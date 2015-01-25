@echo off
SET ORIGINAL_PATH=%PATH%

SET VERSION="0.8.0.pre3"

SET X64=1

SET EXT_64_GEM=concurrent-ruby-ext-%VERSION%-x64-mingw32.gem
SET EXT_32_GEM=concurrent-ruby-ext-%VERSION%-x86-mingw32.gem
SET CORE_GEM=concurrent-ruby-%VERSION%.gem
SET JAVA_GEM=concurrent-ruby-%VERSION%-java.gem

CALL gem uninstall concurrent-ruby-ext -I -a -x
CALL gem uninstall concurrent-ruby -I -a -x
CALL gem uninstall ref -I -a -x

SET EXAMPLES=".\concurrent-ruby\examples"
SET PKG=".\concurrent-ruby\pkg"

REM #################################################################
REM Ruby 1.9.3
ECHO '###############################################################'

SET PATH=C:\Ruby193\bin;%ORIGINAL_PATH%

CALL ruby -v

CALL gem install %PKG%\%CORE_GEM% --no-ri --no-rdoc
CALL gem install %PKG%\%EXT_32_GEM% --no-ri --no-rdoc
CALL ruby %EXAMPLES%\bench_atomic.rb
CALL gem uninstall concurrent-ruby-ext -I -a -x
CALL gem uninstall concurrent-ruby -I -a -x
CALL gem uninstall ref -I -a -x

ECHO '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'

CALL gem install %PKG%\%CORE_GEM% --no-ri --no-rdoc
CALL ruby %EXAMPLES%\bench_atomic.rb
CALL gem uninstall concurrent-ruby -I -a -x
CALL gem uninstall ref -I -a -x

REM #################################################################
REM Ruby 2.0 (32 bit)
ECHO '###############################################################'

SET PATH=C:\Ruby200\bin;%ORIGINAL_PATH%

CALL ruby -v

CALL gem install %PKG%\%CORE_GEM% --no-ri --no-rdoc
CALL gem install %PKG%\%EXT_32_GEM% --no-ri --no-rdoc
CALL ruby %EXAMPLES%\bench_atomic.rb
CALL ruby %EXAMPLES%\benchmark_atomic_boolean.rb
CALL ruby %EXAMPLES%\benchmark_atomic_fixnum.rb
CALL gem uninstall concurrent-ruby-ext -I -a -x
CALL gem uninstall concurrent-ruby -I -a -x
CALL gem uninstall ref -I -a -x

ECHO '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'

CALL gem install %PKG%\%CORE_GEM% --no-ri --no-rdoc
CALL ruby %EXAMPLES%\bench_atomic.rb
CALL ruby %EXAMPLES%\benchmark_atomic_boolean.rb
CALL ruby %EXAMPLES%\benchmark_atomic_fixnum.rb
CALL gem uninstall concurrent-ruby -I -a -x
CALL gem uninstall ref -I -a -x

REM #################################################################
REM Ruby 2.1.5 (32 bit)
ECHO '###############################################################'

SET PATH=C:\Ruby21\bin;%ORIGINAL_PATH%

CALL ruby -v

CALL gem install %PKG%\%CORE_GEM% --no-ri --no-rdoc
CALL gem install %PKG%\%EXT_32_GEM% --no-ri --no-rdoc
CALL ruby %EXAMPLES%\bench_atomic.rb
CALL ruby %EXAMPLES%\benchmark_atomic_boolean.rb
CALL ruby %EXAMPLES%\benchmark_atomic_fixnum.rb
CALL gem uninstall concurrent-ruby-ext -I -a -x
CALL gem uninstall concurrent-ruby -I -a -x
CALL gem uninstall ref -I -a -x

ECHO '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'

CALL gem install %PKG%\%CORE_GEM% --no-ri --no-rdoc
CALL ruby %EXAMPLES%\bench_atomic.rb
CALL ruby %EXAMPLES%\benchmark_atomic_boolean.rb
CALL ruby %EXAMPLES%\benchmark_atomic_fixnum.rb
CALL gem uninstall concurrent-ruby -I -a -x
CALL gem uninstall ref -I -a -x

REM #################################################################
REM JRuby 1.7.18 (32 bit)
ECHO '###############################################################'

SET PATH=C:\jruby-1.7.18\bin;%ORIGINAL_PATH%

CALL jruby -v

CALL jgem install %PKG%\%JAVA_GEM% --no-ri --no-rdoc
CALL jruby %EXAMPLES%\bench_atomic.rb
CALL jruby %EXAMPLES%\benchmark_atomic_boolean.rb
CALL jruby %EXAMPLES%\benchmark_atomic_fixnum.rb
CALL jgem uninstall concurrent-ruby -I -a -x

IF %X64==0 GOTO Eof

REM #################################################################
REM Ruby 2.0 (64 bit)
ECHO '###############################################################'

SET PATH=C:\Ruby200-x64\bin;%ORIGINAL_PATH%

CALL ruby -v

CALL gem install %PKG%\%CORE_GEM% --no-ri --no-rdoc
CALL gem install %PKG%\%EXT_64_GEM% --no-ri --no-rdoc
CALL ruby %EXAMPLES%\bench_atomic.rb
CALL ruby %EXAMPLES%\benchmark_atomic_boolean.rb
CALL ruby %EXAMPLES%\benchmark_atomic_fixnum.rb
CALL gem uninstall concurrent-ruby-ext -I -a -x
CALL gem uninstall concurrent-ruby -I -a -x
CALL gem uninstall ref -I -a -x

ECHO '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'

CALL gem install %PKG%\%CORE_GEM% --no-ri --no-rdoc
CALL ruby %EXAMPLES%\bench_atomic.rb
CALL ruby %EXAMPLES%\benchmark_atomic_boolean.rb
CALL ruby %EXAMPLES%\benchmark_atomic_fixnum.rb
CALL gem uninstall concurrent-ruby -I -a -x
CALL gem uninstall ref -I -a -x

REM #################################################################
REM Ruby 2.1.5 (64 bit)
ECHO '###############################################################'

SET PATH=C:\Ruby21-x64\bin;%ORIGINAL_PATH%

CALL ruby -v

CALL gem install %PKG%\%CORE_GEM% --no-ri --no-rdoc
CALL gem install %PKG%\%EXT_64_GEM% --no-ri --no-rdoc
CALL ruby %EXAMPLES%\bench_atomic.rb
CALL ruby %EXAMPLES%\benchmark_atomic_boolean.rb
CALL ruby %EXAMPLES%\benchmark_atomic_fixnum.rb
CALL gem uninstall concurrent-ruby-ext -I -a -x
CALL gem uninstall concurrent-ruby -I -a -x
CALL gem uninstall ref -I -a -x

ECHO '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'

CALL gem install %PKG%\%CORE_GEM% --no-ri --no-rdoc
CALL ruby %EXAMPLES%\bench_atomic.rb
CALL ruby %EXAMPLES%\benchmark_atomic_boolean.rb
CALL ruby %EXAMPLES%\benchmark_atomic_fixnum.rb
CALL gem uninstall concurrent-ruby -I -a -x
CALL gem uninstall ref -I -a -x

REM #################################################################
REM JRuby 1.7.18 (64 bit)
ECHO '###############################################################'

SET PATH=C:\jruby-1.7.18-x64\bin;%ORIGINAL_PATH%

CALL jruby -v

CALL jgem install %PKG%\%JAVA_GEM% --no-ri --no-rdoc
CALL jruby %EXAMPLES%\bench_atomic.rb
CALL jruby %EXAMPLES%\benchmark_atomic_boolean.rb
CALL jruby %EXAMPLES%\benchmark_atomic_fixnum.rb
CALL jgem uninstall concurrent-ruby -I -a -x

:Eof
