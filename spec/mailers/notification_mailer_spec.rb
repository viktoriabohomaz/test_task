# frozen_string_literal: true

require 'rails_helper'

RSpec.describe NotificationMailer, type: :mailer do
  describe 'notify' do
    let!(:user) { FactoryBot.create(:user) }
    let!(:notification) { FactoryBot.create(:notification, user_id: user.id) }
    let(:mail) { NotificationMailer.notification_email(user, notification).deliver_now }

    it 'renders the headers' do
      expect(mail.subject).to eq('You have new notification')
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(['viktoriazlayaa@gmail.com'])
    end
  end
end
