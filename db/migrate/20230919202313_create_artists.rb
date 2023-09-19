class CreateArtists < ActiveRecord::Migration[7.0]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :composer
      t.text :description

      t.timestamps
    end
  end
end
