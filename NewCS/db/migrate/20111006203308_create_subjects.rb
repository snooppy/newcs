class CreateSubjects < ActiveRecord::Migration
  def change
    begin
      down
      up
    rescue
      up
    end
  end 
  
  def up
    create_table :subjects do |t|
      t.string :name
      t.timestamps
    end
  end
  def down
    drop_table :subjects
  end
end
