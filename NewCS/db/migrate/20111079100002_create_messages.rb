class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :title
      t.text :text
      t.boolean :readed
      
      t.integer :userto_id
      t.integer :userfrom_id
      
      t.timestamps
    end
  end
end
