class PrepodsSubjects < ActiveRecord::Migration
  def change
    begin
      down
      up
    rescue
      up
    end
  end 
  
  def up
    create_table :prepods_subjects, :id => false do |t|
      t.integer :prepod_id
      t.integer :subject_id
    end
  end

  def down
    drop_table :prepods_subjects
  end
end
