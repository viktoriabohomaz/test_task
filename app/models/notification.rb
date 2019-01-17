# frozen_string_literal: true

class Notification < ApplicationRecord
  belongs_to :user

  validates :time, :date, :title, :description, presence: true

  scope :not_sent, -> { where(sended: false) } 
  scope :at_present_time, -> { where('date = :today AND time = :now', today: Date.current, now: Time.now.strftime('%k:%M'))}
end
