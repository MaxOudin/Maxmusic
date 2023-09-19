class AddArtistToMusic < ActiveRecord::Migration[7.0]
  def change
    add_reference :musics, :artist, null: false, foreign_key: true
  end
end
