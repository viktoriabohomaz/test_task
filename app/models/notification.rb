# frozen_string_literal: true

class Notification < ApplicationRecord
  belongs_to :user

  validates :time, :date, :title, :description, presence: true
end
