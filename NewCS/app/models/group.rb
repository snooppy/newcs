class Group < ActiveRecord::Base
  has_one :prepod
  has_many :student
  has_and_belongs_to_many :shedules,
                          :join_table => "shedules_groups",
                          :foreign_key => "shedule_id",
                          :association_foreign_key => "group_id"
end
