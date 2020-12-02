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
  end
end
