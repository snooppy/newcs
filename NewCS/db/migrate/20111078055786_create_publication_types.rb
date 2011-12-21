class CreatePublicationTypes < ActiveRecord::Migration  
  def change
    create_table :publication_types, :options=>'DEFAULT CHARSET=UTF8' do |t|
      t.string :name
      t.timestamps
    end
  end
end
