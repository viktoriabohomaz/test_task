class NotificationMailer < ApplicationMailer
  
  def notification_email(user, notification)
    @user = user
    @notification = notification
    mail(to: @user.email, subject: 'You have new notification')
  end
end
