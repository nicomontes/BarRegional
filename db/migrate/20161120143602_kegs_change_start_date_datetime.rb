class KegsChangeStartDateDatetime < ActiveRecord::Migration[5.0]
  def change
    change_column(:kegs, :startDate, :datetime)
  end
  def up
    change_column :kegs, :startDate, :datetime
  end
  def down
    change_column :kegs, :startDate, :date
  end
end
