class AddLiketoAlbum < ActiveRecord::Migration
  def change
    add_column :albums, :likes, :integer, default: 0
  end
end
