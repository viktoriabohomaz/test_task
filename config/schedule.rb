# frozen_string_literal: true
job_type :rake, "cd :path && :environment_variable=:environment :bundle_command rake :task :output"
set :environment, "production"
set :output, {:error => "log/cron_error_log.log", :standard => "log/cron_log.log"}

every 1.minute do
  rake 'email_tasks:send_user_notification'
end
