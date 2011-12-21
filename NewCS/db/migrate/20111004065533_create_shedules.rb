class CreateShedules < ActiveRecord::Migration
  def change
    begin
      down
      up
    rescue
      up
    end
  end 
  
  def up
    create_table :shedules do |t|
      t.integer :week
      t.integer :day
      t.integer :hour
      t.integer :classroom
      t.integer :sub_group2
      t.integer :sub_group3

      t.timestamps
    end
  end
  def down
    drop_table :shedules
  end
end
