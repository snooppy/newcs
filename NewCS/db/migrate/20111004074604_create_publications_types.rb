class CreatePublicationsTypes < ActiveRecord::Migration
  def change
    begin
      down
      up
    rescue
      up
    end
  end 
  
  def up
    create_table :publications_types do |t|
      t.string :name

      t.timestamps
    end
  end
  def down
    drop_table :publication_types
  end
end
