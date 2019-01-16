class NotificatorService
  def call
    @notifications = NotificationQuery.execute
    deliver_email(@notifications) if @notifications.present?   
  end

  private

  def deliver_email(notifications)
    notifications.each do |notification|
      user = notification.user
      NotificationMailer.notification_email(user, notification).deliver_now
      notification.update(sended: true)
    end  
  end  
end