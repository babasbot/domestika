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
  end
end
