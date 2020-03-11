class AddColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :packages, :courier_name, :string
  end
end
