class AddDescriptionToModel < ActiveRecord::Migration
  def change
    add_column :albums, :description, :text, default: ''
  end
end
