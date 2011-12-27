class Publication < ActiveRecord::Base
  has_and_belongs_to_many :subjects,
                          :join_table => "publications_subjects",
                          :foreign_key => "subject_id",
                          :association_foreign_key => "publication_id",
                          :autosave =>true
  belongs_to :publication_type
  belongs_to :publication_cat
  belongs_to :user
end
