#!/usr/bin/ruby

puts "Checking / Installing Brew"
`/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
puts "Brew install Redis"
`brew install redis`
puts "Install redis gem"
`gem install redis`
