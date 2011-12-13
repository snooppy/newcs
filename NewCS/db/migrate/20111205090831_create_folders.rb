class CreateFolders < ActiveRecord::Migration
  def change
    begin
      down
      up
    rescue
      up
    end
  end 
  
  def up
    create_table :folders do |t|
      t.string :name
      t.integer :parent
      t.integer :user_id
      t.integer :level
      t.timestamps
    end
    execute ("insert into folders set name = '/', id = 1, level = 0;")
  end
  
  def down
    drop_table :folders
  end
end
