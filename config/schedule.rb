# frozen_string_literal: true

every 1.minute do
  rake 'send_user_notification'
end
