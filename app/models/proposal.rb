class Proposal < ApplicationRecord
  belongs_to :course
  belongs_to :teacher

  validates_presence_of :course
  validates_presence_of :teacher

  validates_uniqueness_of :teacher_id, scope: :course_id
end
