class ChangeArtworks < ActiveRecord::Migration[5.2]
  def change
    add_index :artworks, :artist_id
    change_column :artwork_shares, :artwork_id, :integer, unique: false
    change_column :artwork_shares, :viewer_id, :integer, unique: false
  end
end
