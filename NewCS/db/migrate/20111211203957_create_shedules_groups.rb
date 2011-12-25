class CreateShedulesGroups < ActiveRecord::Migration
  def change
    begin
      down
      up
    rescue
      up
    end
  end 
  
  def up
    create_table :shedules_groups, :id => false do |t|
      t.integer :shedule_id
      t.integer :group_id
    end
  end

  def down
    drop_table :shedules_groups
  end
  
end
