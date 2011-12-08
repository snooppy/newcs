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
      t.string :parent
      t.integer :user_id
      t.timestamps
    end
  end
  
  def down
    drop_table :folders
  end
end
