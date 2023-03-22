class CreateAssets < ActiveRecord::Migration[7.0]
  def change
    create_table :assets do |t|
      t.string :name
      t.string :serial_number, null: false, index: { unique: true }
      t.date :purchase_date
      t.float :purchase_price
      t.string :location
      t.string :current_owner
      t.date :warranty_expiration_date
      t.text :maintenance_history
      t.string :asset_category
      t.string :asset_status

      t.timestamps
    end
  end
end
