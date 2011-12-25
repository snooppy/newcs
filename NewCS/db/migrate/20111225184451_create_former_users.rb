class CreateFormerUsers < ActiveRecord::Migration
  
    def change
    begin
      down
      up
    rescue
      up
    end
  end
  
  def up
    create_table :former_users, :options=>'DEFAULT CHARSET=UTF8' do |t|
      t.integer :user_id
      t.string :first_name
      t.string :second_name
      t.string :last_name
      t.string :login, :null => false
      t.string :password, :null => false
      t.string :email
      t.string :sex
      t.string :role
      t.string :photo
      
      ##### Students
      t.integer :group_id
      
      ##### Prepod
      t.integer :settings_id
      t.integer :pos
      
      t.timestamps
    end
  end
  
    def down
    drop_table :former_users
  end
end
