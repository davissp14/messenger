require 'yaml'
require 'fileutils'

module Messenger
  class User

    FILE_PATH = File.expand_path('~') + "/.user.yml"

    def self.registered?
      if File.exists?(FILE_PATH)
        file = YAML::load_file(FILE_PATH)
        info = file[:info]
        return false unless info
        return true unless info[:first_name].nil? && info[:last_name].nil?
      end
      false
    end

    def self.register
      puts "Welcome to the Registration Process!!"
      puts "What's your first name? "
      first_name = gets.chomp
      puts "What's your last name? "
      last_name = gets.chomp
      puts "That's it!  That's literally all I want from you."

      file = {info: {}}
      file[:info][:first_name] = first_name
      file[:info][:last_name] = last_name
      File.open(FILE_PATH, 'w') {|f| f.write file.to_yaml } #St
    end

    def self.info
      YAML::load_file(FILE_PATH)
    end

  end
end
