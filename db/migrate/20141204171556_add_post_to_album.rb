class AddPostToAlbum < ActiveRecord::Migration
  def change
    add_column :albums, :post, :text
  end
end
