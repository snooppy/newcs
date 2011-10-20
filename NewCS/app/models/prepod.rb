class Prepod < User
  # validates :pos, :presence => true
  has_and_belongs_to_many :subjects,
                          :join_table => "prepods_subjects",
                          :foreign_key => "subject_id",
                          :association_foreign_key => "prepod_id",
                          :autosave =>true  
end
