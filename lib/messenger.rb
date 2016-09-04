
module Messenger
  REDIS_SERVER_URI = ENV['REDIS_SERVER_URI']
  CHANNEL = "messenger"
end

require 'redis'
require 'optparse'
require 'shellwords'
require 'yaml'
require 'fileutils'

require_relative './messenger/version'
require_relative './messenger/client'
require_relative './messenger/user'
