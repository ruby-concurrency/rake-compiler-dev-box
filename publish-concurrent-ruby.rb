#!/usr/bin/env ruby

# get the current gem version
require_relative './concurrent-ruby/lib/concurrent/version'

GEMS = [
  "concurrent-ruby-#{Concurrent::VERSION}.gem",
  "concurrent-ruby-#{Concurrent::VERSION}-java.gem",
  "concurrent-ruby-ext-#{Concurrent::VERSION}.gem",
  "concurrent-ruby-ext-#{Concurrent::VERSION}-x86-mingw32.gem",
  "concurrent-ruby-ext-#{Concurrent::VERSION}-x64-mingw32.gem",
  #"concurrent-ruby-ext-#{Concurrent::VERSION}-x86-linux.gem",
  #"concurrent-ruby-ext-#{Concurrent::VERSION}-x86_64-linux.gem",
  #"concurrent-ruby-ext-#{Concurrent::VERSION}-x86_64-darwin-14.gem",
  #"concurrent-ruby-ext-#{Concurrent::VERSION}-x86-solaris-2.11.gem",
]

Dir["concurrent-ruby/pkg/concurrent-ruby-*#{Concurrent::VERSION}*.gem"].each do |gem|
  basename = File.basename(gem)
  if GEMS.include?(basename)
    puts "Publishing #{basename}..."
    #####`gem push #{gem}`
  else
    warn "Found unsupported package #{basename}, skipping..."
  end
end
