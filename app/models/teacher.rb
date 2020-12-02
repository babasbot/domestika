class Teacher < ApplicationRecord
  validates_uniqueness_of :email, case_sensitive: false

  validates_presence_of :email
  validates_presence_of :name
end
