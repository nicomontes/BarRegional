class AddNumberDrinkToOperations < ActiveRecord::Migration[5.0]
  def change
    add_column :operations, :numberDrink, :decimal
  end
end
