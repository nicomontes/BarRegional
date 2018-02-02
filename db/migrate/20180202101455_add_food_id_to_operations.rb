class AddFoodIdToOperations < ActiveRecord::Migration[5.0]
  def change
    add_column :operations, :food_id, :decimal
  end
end
