class CreateDrinks < ActiveRecord::Migration[5.0]
  def change
    create_table :drinks do |t|
      t.string :name
      t.string :drink_type
      t.decimal :price

      t.timestamps
    end
  end
end
