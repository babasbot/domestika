require 'rails_helper'

RSpec.describe Course, type: :model do
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
