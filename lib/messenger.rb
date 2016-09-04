
module Messenger
  REDIS_SERVER_URI = ENV['REDIS_SERVER_URI']
  if REDIS_SERVER_URI.nil?
    puts "MISSING REDIS_SERVER_URI environment variable. Exiting."
    exit(1)
  end
  CHANNELS = "message"
end

require 'redis'
require 'optparse'
require 'shellwords'
require 'yaml'
require 'fileutils'
require 'json'
require 'securerandom'

require_relative './messenger/version'
require_relative './messenger/client'
require_relative './messenger/user'
