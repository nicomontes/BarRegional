class KegsChangeEndDateDatetime < ActiveRecord::Migration[5.0]
  def change
    change_column(:kegs, :endDate, :datetime)
  end
  def up
    change_column :kegs, :endDate, :datetime
  end
  def down
    change_column :kegs, :endDate, :date
  end
end
