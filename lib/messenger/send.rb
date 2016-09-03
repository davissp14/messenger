
module Messenger
  class Send

    def self.message(msg)
      redis = Redis.new(url: Messenger::REDIS_SERVER_URI)
      redis.publish("message", msg)
    end

  end
end
