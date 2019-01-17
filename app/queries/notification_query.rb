# frozen_string_literal: true

class NotificationQuery
  def self.execute
    Notification.not_sent.at_present_time
  end
end
