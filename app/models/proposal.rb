class Proposal < ApplicationRecord
  with_options counter_cache: true do
    belongs_to :course
    belongs_to :teacher
  end

  has_many :votes, as: :votable, dependent: :destroy

  validates_presence_of :course
  validates_presence_of :teacher

  validates_uniqueness_of :teacher_id, scope: :course_id
end
