class Course < ApplicationRecord
  with_options dependent: :destroy do
    has_many :proposals
    has_many :votes, as: :votable
  end

  has_many :teachers, through: :proposals

  validates_presence_of :title

  validates_uniqueness_of :title, case_sensitive: false
end
