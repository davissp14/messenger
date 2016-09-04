module Messenger
  class Client
    class CommunicationDown < StandardError; end

    def self.start!
      puts "This is where communication will be logged..."
      begin
        redis = Redis.new(url: Messenger::REDIS_SERVER_URI)
        redis.subscribe_with_timeout(9999999, Messenger::CHANNELS) do |on|
          on.message do |channel, raw_message|
            message = JSON.parse(raw_message)
            name = "#{message['first_name']} #{message['last_name']}"
            body = message['body']
            if Messenger::User.id != message['id']
              `/usr/bin/osascript -e 'display notification "#{body}" with title "#{name}" sound name "/System/Library/Sounds/Sosumi.aiff"'`
            end
            puts "#{name}: #{body}"
          end
        end

      rescue
        puts $!.inspect
        exit(1)
      end
    end

    def self.send_message(msg)
      raise Messenger::Client::CommunicationDown unless Messenger::Client.active?
      raise Messenger::User::UnRegisteredUser unless Messenger::User.registered?

      redis = Redis.new(url: Messenger::REDIS_SERVER_URI)
      user = Messenger::User.info
      message = {
        id: user['id'],
        first_name: user['first_name'],
        last_name: user['last_name'],
        body: msg
      }
      redis.publish('message', message.to_json)
    rescue Messenger::User::UnRegisteredUser => e
      puts "You must register yourself prior to sending messages."
      Messenger::User.register
    rescue Messenger::Client::CommunicationDown => e
      puts "No active connection to the communication server. Run: `messenger --start`"
      exit(1)
    rescue
      puts $!.inspect
      exit(1)
    end

    def self.active?
      process = `ps aux | grep 'ruby /usr/local/bin/messenger --start' | grep -v grep`
      process != ""
    end


  end
end
