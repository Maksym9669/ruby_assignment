class DeleteColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :packages, :courier_id
  end
end
