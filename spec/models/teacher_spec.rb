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

  describe '#password' do
    it do
      is_expected.to have_secure_password
    end

    it do
      is_expected.to validate_presence_of(:password)
    end
  end

  describe '#proposals' do
    it do
      is_expected.to have_many(:proposals).dependent(:destroy)
    end
  end

  describe '#proposals_count' do
    let!(:teacher) do
      create(:teacher)
    end

    it do
      expect {
        create(:proposal, teacher: teacher)
      }.to change {
        teacher.reload.proposals_count
      }.by(1)
    end
  end

  describe '#votes' do
    it do
      is_expected.to have_many(:votes)
    end
  end
end
