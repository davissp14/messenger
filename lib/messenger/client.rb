module Messenger
  class Client

    def self.start!
      puts "This is where communication will be logged..."
      redis = Redis.new(url: Messenger::REDIS_SERVER_URI)
      redis.subscribe_with_timeout(9999999, "message") do |on|
        on.message do |channel, message|
          puts message
          `/usr/bin/osascript -e 'display notification "#{message}" with title "Message" sound name "/System/Library/Sounds/Sosumi.aiff"'`
        end
      end
    end

    def self.send_message(msg)
      if Messenger::User.registered?
        redis = Redis.new(url: Messenger::REDIS_SERVER_URI)
        user = Messenger::User.info[:info]
        redis.publish("message", "#{user[:first_name]} #{user[:last_name]}: #{msg}")
      else
        puts "You must register yourself prior to sending messages."
        Messenger::User.register
      end
    end
  end
end
