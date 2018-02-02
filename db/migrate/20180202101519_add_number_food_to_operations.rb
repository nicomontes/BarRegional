class AddNumberFoodToOperations < ActiveRecord::Migration[5.0]
  def change
    add_column :operations, :numberFood, :decimal
  end
end
