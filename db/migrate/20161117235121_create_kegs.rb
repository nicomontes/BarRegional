class CreateKegs < ActiveRecord::Migration[5.0]
  def change
    create_table :kegs do |t|
      t.string :name
      t.decimal :drink_id
      t.date :startDate
      t.date :endDate
      t.decimal :capacity
      t.decimal :price

      t.timestamps
    end
  end
end
