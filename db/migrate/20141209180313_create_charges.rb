class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.string :email
      t.integer :amount_in_cents
      t.string :description
      t.string :stripe_charge_id

      t.timestamps
    end
  end
end
