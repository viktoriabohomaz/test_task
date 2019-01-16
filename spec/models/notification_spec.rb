require 'rails_helper'

RSpec.describe Notification, type: :model do
  context 'association' do
    it { should belong_to(:user) }
  end

  context 'validation' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:time) }
    it { should validate_presence_of(:date) }
  end
end
