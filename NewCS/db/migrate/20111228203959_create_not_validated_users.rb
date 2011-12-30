class CreateNotValidatedUsers < ActiveRecord::Migration
  def change
    begin
      down
      up
    rescue
      up
    end
  end
  
  def up
    create_table :not_validated_users do |t|
      t.string :login
      t.string :password
      t.string :first_name
      t.string :second_name
      t.string :last_name
      t.string :email
      t.string :sex
      t.string :role

      t.timestamps
    end
  end
  
  def down
    drop_table :not_validated_users
  end
end
