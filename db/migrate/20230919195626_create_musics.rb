class CreateMusics < ActiveRecord::Migration[7.0]
  def change
    create_table :musics do |t|
      t.string :title
      t.string :subtitle
      t.text :cover_url
      t.text :shazam_url
      t.string :genre
      t.string :album
      t.integer :release_year
      t.string :youtube_url
      t.string :preview, :text

      t.timestamps
    end
  end
end
