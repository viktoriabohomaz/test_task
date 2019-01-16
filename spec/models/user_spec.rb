require 'rails_helper'

RSpec.describe User, type: :model do
  context 'association' do
    it { should have_many(:notifications).dependent(:destroy) }
  end

  context 'validation' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:middle_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end
end
