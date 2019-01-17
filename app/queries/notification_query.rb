# frozen_string_literal: true

class NotificationQuery
  def self.execute
    Notification.where(sended: false)
                .where('date = ? AND time = ?', Date.today, Time.now.strftime('%k:%M'))
  end
end
