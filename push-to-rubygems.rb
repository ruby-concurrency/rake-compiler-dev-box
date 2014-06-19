#!/usr/bin/env ruby

Dir['concurrent-ruby/pkg/*.gem'].each do |gem|
  puts gem
  `gem push #{gem}`
end
