require 'rails_helper'

RSpec.describe Teacher, type: :model do
  describe '#email' do
    it do
      create(:teacher)

      is_expected.to validate_uniqueness_of(:email).case_insensitive
    end

    it do
      is_expected.to validate_presence_of(:email)
    end
  end
end
