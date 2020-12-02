class Vote < ApplicationRecord
  belongs_to :votable, polymorphic: true
  belongs_to :voter, class_name: 'Teacher'

  validates_uniqueness_of :voter_id, scope: %i[votable_id votable_type]
end
