class CreateSheduleBlocks < ActiveRecord::Migration
  def change
    begin
      down
      up
    rescue
      up
    end
  end 
  
  def up
    create_table :shedule_blocks do |t|
      t.integer :week
      t.integer :cours
      t.string  :groups
      
      t.timestamps
    end
  end
  def down
    drop_table :shedule_blocks
  end
end
