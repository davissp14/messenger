
module Messenger
  class Send

    def self.message(msg)
      `redis-cli -h aws-us-east-1-portal.15.dblayer.com -p 15156 -a PBJSVFCGCEORLAAA PUBLISH message "#{msg}"`
    end

  end
end
