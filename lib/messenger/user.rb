require 'yaml'
require 'fileutils'

module Messenger
  class User
    class UnRegisteredUser < StandardError; end

    FILE_PATH = File.expand_path('~') + "/.user.yml"

    def self.registered?
      if File.exists?(FILE_PATH)
        info = Messenger::User.info
        if info && info['first_name'] && info['last_name']
          return true
        end
      end
      return false
    end

    def self.register
      puts "Welcome to the Registration Process!!"
      puts "What's your first name? "
      first_name = gets.chomp
      puts "What's your last name? "
      last_name = gets.chomp
      puts "That's it!  That's literally all I want from you."

      file = {}
      file['first_name'] = first_name
      file['last_name'] = last_name
      File.open(FILE_PATH, 'w') {|f| f.write file.to_yaml }
    end

    def self.info
      YAML::load_file(FILE_PATH)
    rescue
      nil
    end

  end
end
