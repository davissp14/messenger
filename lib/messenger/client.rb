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
  end
end
