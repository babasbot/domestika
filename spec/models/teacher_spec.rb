require 'rails_helper'

RSpec.describe Teacher, type: :model do
  describe '#courses' do
    it do
      is_expected.to have_many(:courses)
    end
  end

  describe '#email' do
    it do
      create(:teacher)

      is_expected.to validate_uniqueness_of(:email).case_insensitive
    end

    it do
      is_expected.to validate_presence_of(:email)
    end
  end

  describe '#name' do
    it do
      is_expected.to validate_presence_of(:name)
    end
  end

  describe '#proposals' do
    it do
      is_expected.to have_many(:proposals).dependent(:destroy)
    end
  end
end
