namespace :email_tasks do
  desc "Send notifications for users"
  task send_user_notification: :environment do
    NotificatorService.new.call  
  end

end
