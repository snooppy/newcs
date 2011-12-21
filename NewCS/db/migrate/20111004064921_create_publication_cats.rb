class CreatePublicationCats < ActiveRecord::Migration
  def change
    begin
      down
      up
    rescue
      up
    end
  end 
  
  def up
    create_table :publication_cats do |t|
      t.string :name

      t.timestamps
    end
  end
  def down
    drop_table :publication_cats
  end
end
