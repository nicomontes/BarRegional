class AddDrinkIdToOperations < ActiveRecord::Migration[5.0]
  def change
    add_column :operations, :drink_id, :decimal
  end
end
