class CreatePublicationsTypes < ActiveRecord::Migration
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
