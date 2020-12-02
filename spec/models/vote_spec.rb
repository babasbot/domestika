require 'rails_helper'

RSpec.describe Vote, type: :model do
  describe '#votable' do
    it do
      is_expected.to belong_to(:votable)
    end
  end

  describe '#voter' do
    it do
      is_expected.to belong_to(:voter).class_name('Teacher')
    end

    it do
      create(:course_vote)

      is_expected.to validate_uniqueness_of(:voter_id).scoped_to(
        %i[votable_id votable_type]
      )
    end
  end
end
