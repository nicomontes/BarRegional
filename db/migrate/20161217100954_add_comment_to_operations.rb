class AddCommentToOperations < ActiveRecord::Migration[5.0]
  def change
    add_column :operations, :comment, :string
  end
end
