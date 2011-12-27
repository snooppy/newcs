class Shedule < ActiveRecord::Base
  belongs_to :subject
  belongs_to :prepod
  has_and_belongs_to_many :groups,
                          :join_table => "shedules_groups",
                          :foreign_key => "group_id",
                          :association_foreign_key => "shedule_id"
end
