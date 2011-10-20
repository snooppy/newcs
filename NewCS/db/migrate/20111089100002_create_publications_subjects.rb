class CreatePublicationsSubjects < ActiveRecord::Migration
   def up
    create_table :publications_subjects, :id => false do |t|
      t.integer :publication_id
      t.integer :subject_id
    end
  end

  def down
    drop_table :publications_subjects
  end
  
end
