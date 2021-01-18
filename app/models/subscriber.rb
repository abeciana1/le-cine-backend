class Subscriber < ApplicationRecord

    def self.welcome(subscriber)
        Notification.welcome(subscriber)
    end
end
