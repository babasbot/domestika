require 'rails_helper'

RSpec.describe Course, type: :model do
  describe '#proposals' do
    it do
      is_expected.to have_many(:proposals).dependent(:destroy)
    end
  end

  describe '#title' do
    it do
      is_expected.to validate_presence_of(:title)
    end

    it do
      create(:course)

      is_expected.to validate_uniqueness_of(:title).case_insensitive
    end
  end
end
