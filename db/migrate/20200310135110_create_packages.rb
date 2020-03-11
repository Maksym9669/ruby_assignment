class CreatePackages < ActiveRecord::Migration[6.0]
  def change
    create_table :packages do |t|
      t.string :tracking_number
      t.boolean :delivery_status
      t.integer :courier_id

      t.timestamps
    end
  end
end
