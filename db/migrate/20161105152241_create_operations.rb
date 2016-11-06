class CreateOperations < ActiveRecord::Migration[5.0]
  def change
    create_table :operations do |t|
      t.datetime :date
      t.decimal :sum
      t.integer :user_id

      t.timestamps
    end
    add_index :operations, :user_id
  end
end
