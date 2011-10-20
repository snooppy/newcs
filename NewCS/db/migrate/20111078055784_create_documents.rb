class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :title
      t.string :name
      t.integer :size
      t.integer :user_id
       # some else 
       # some else 
      t.timestamps
    end
  end
end
