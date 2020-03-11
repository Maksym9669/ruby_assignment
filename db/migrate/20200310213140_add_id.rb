class AddId < ActiveRecord::Migration[6.0]
  def change
    add_column :packages, :courier_id, :integer
  end
end
