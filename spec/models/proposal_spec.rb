require 'rails_helper'

RSpec.describe Proposal, type: :model do
  describe '#course' do
    it do
      is_expected.to belong_to(:course)
    end
  end

  describe '#teacher' do
    it do
      is_expected.to belong_to(:teacher)
    end

    it do
      create(:proposal)

      is_expected.to validate_uniqueness_of(:teacher_id).scoped_to(:course_id)
    end
  end
end
