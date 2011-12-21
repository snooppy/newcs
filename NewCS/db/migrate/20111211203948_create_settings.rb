class CreateSettings < ActiveRecord::Migration
  def change
    begin
      down
      up
    rescue
      up
    end
  end 
  
  def up
    create_table :settings do |t|
      t.boolean :images , :default => true
      t.boolean :students , :default => true
      t.boolean :subjects , :default => true
      t.boolean :shedules , :default => true
      t.boolean :marks , :default => true
      t.boolean :files , :default => true
      t.boolean :publications , :default => true
      
      t.timestamps
    end
  end
  
  def down
    drop_table settings
  end
end
