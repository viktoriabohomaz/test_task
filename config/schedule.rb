# frozen_string_literal: true
set :environment, "production"
set :output, {:error => "log/cron_error_log.log", :standard => "log/cron_log.log"}
env :PATH, ENV['PATH']

every 1.minute do
  rake 'email_tasks:send_user_notification'
end
