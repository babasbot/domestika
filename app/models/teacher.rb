class Teacher < ApplicationRecord
  has_secure_password

  with_options dependent: :destroy do
    has_many :proposals
    has_many :votes, foreign_key: 'voter_id'
  end

  has_many :courses, through: :proposals

  validates_uniqueness_of :email, case_sensitive: false

  validates_presence_of :email
  validates_presence_of :name
  validates_presence_of :password
end
