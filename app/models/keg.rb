class Keg < ApplicationRecord
  belongs_to :drink
  validates :startDate, format: { with: /\d+\-[0-1][0-9]\-[0-3][0-9]\ [0-2][0-9]\:[0-5][0-9]\:[0-5][0-9]/ }
  validates :endDate, format: { with: /\d+\-[0-1][0-9]\-[0-3][0-9]\ [0-2][0-9]\:[0-5][0-9]\:[0-5][0-9]/ }
  validates :capacity, numericality: { greater_than_or_equal_to: 0 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :drink_id, numericality: true
end
