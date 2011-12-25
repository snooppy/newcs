class Shedule < ActiveRecord::Base
  has_one :subject_id
  has_one :prepod_id
  has_and_belongs_to_many :groups,
                          :join_table => "shedules_groups",
                          :foreign_key => "group_id",
                          :association_foreign_key => "shedule_id"
end
