class CreatePublications < ActiveRecord::Migration
    def change
    begin
      down
      up
    rescue
      up
    end
  end
  def up
    create_table :publications, :options=>'DEFAULT CHARSET=UTF8' do |t|
      t.string  :title
      t.text    :article
      t.text    :prolog
      t.integer :level
      t.integer :not_validated
      t.text    :photo
      
      t.integer :publication_type_id
      t.integer :publication_cat_id
      t.integer :user_id
      
      t.timestamps
    end
  end
  def down
    drop_table :publications
  end
end
