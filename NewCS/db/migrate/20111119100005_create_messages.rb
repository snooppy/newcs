class CreateMessages < ActiveRecord::Migration
    def up
    create_table :messages do |t|
      t.text :text
      t.boolean :readed, :null => false, :default=> false
      t.boolean :showed_popup, :null => false, :default=> false
      t.boolean :showed_dialog, :null => false, :default=> false
      t.integer :userto_id
      t.integer :userfrom_id
      
      t.timestamps
    end
  end

  def down
    drop_table :messages
  end
end
