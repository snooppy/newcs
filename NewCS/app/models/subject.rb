class Subject < ActiveRecord::Base
  has_and_belongs_to_many :prepods,
                          :join_table => "prepods_subjects",
                          :foreign_key => "prepod_id",
                          :association_foreign_key => "subject_id"
has_and_belongs_to_many :publications,
                          :join_table => "publications_subjects",
                          :foreign_key => "publication_id",
                          :association_foreign_key => "subject_id"
                          
end
