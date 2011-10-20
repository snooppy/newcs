class Group < ActiveRecord::Base
  has_one :prepod
  has_many :student
end
