class Course < ApplicationRecord
  with_options dependent: :destroy do
    has_many :proposals
  end

  has_many :teachers, through: :proposals

  validates_presence_of :title

  validates_uniqueness_of :title, case_sensitive: false
end
