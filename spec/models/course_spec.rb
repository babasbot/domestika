require 'rails_helper'

RSpec.describe Course, type: :model do
  describe '#proposals' do
    it do
      is_expected.to have_many(:proposals).dependent(:destroy)
    end
  end

  describe '#proposals_count' do
    let!(:course) do
      create(:course)
    end

    it do
      expect {
        create(:proposal, course: course)
      }.to change {
        course.reload.proposals_count
      }.by(1)
    end
  end

  describe '#teacher' do
    it do
      is_expected.to have_many(:teachers)
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

  describe '#votes' do
    it do
      is_expected.to have_many(:votes).dependent(:destroy)
    end
  end

  describe '#votes_count' do
    let!(:course) do
      create(:course)
    end

    it do
      expect {
        create(:course_vote, votable: course)
      }.to change {
        course.reload.votes_count
      }.by(1)
    end
  end
end
