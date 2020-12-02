require 'rails_helper'

RSpec.describe Course, type: :model do
  describe '#title' do
    it do
      is_expected.to validate_presence_of(:title)
    end
  end
end
