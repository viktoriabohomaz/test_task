# frozen_string_literal: true

FactoryBot.define do
  factory :notification do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph_by_chars(800, false) }
    date { Faker::Date.between(2.days.ago, Date.today) }
    time { Faker::Time.between(2.days.ago, Date.today, :all) }
    user
  end
end
