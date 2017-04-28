class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :firstName
      t.string :lastName
      t.string :alias
      t.string :password_digest
      t.decimal :initAmount
      t.decimal :amount
      t.string :email

      t.timestamps
    end
  end
end
