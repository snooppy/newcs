class CreateUsers < ActiveRecord::Migration
  
  def change
    begin
      down
      up
    rescue
      up
    end
  end
  
  def up
    create_table :users do |t|
      t.string :first_name
      t.string :second_name
      t.string :last_name
      t.string :login
      t.string :password
      t.string :email
      t.string :sex
      t.string :role
      
      ##### Students
      t.integer :group_id
      
      ##### Prepod
      t.integer :settings_id
      t.integer :pos
      
      t.timestamps
    end
  end
  def down
    drop_table :users
  end
end
