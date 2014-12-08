class CreateSomeModels < ActiveRecord::Migration
  def change
    create_table :some_models do |t|
      t.integer :price
      t.string :name
      t.string :permalink

      t.timestamps
    end
  end
end
