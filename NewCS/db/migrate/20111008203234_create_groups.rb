class CreateGroups < ActiveRecord::Migration
  def change
    begin
      down
      up
    rescue
      up
    end
  end 
  
  def up
    create_table :groups, :options=>'DEFAULT CHARSET=UTF8' do |t|
      t.string :name 
      t.integer :year
      t.timestamps
    end
  end
  def down
    drop_table :groups
  end
end
