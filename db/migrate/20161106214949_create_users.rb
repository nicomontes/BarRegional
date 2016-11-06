class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :firstName
      t.string :lastName
      t.string :alias
      t.string :password
      t.decimal :initAmount
      t.string :email

      t.timestamps
    end
  end
end
