class Course < ApplicationRecord
  validates_presence_of :title

  validates_uniqueness_of :title, case_sensitive: false
end
