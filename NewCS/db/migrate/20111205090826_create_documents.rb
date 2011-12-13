class CreateDocuments < ActiveRecord::Migration
  def change
    begin
      down
      up
    rescue
      up
    end
  end  
  
  def up
    create_table :documents do |t|
      t.string :path
      t.string :title
      t.string :name
      t.integer :size
      t.integer :user_id
      t.integer :folder
      t.integer :level
      # some else 
      # some else 
      t.timestamps
    end
    
  end
  def down
    drop_table :documents
  end
end
