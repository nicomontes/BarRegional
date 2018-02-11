class Operation < ApplicationRecord
  VALID_DATE_REGEX = /\d+\-[0-1][0-9]\-[0-3][0-9]\s[0-2][0-9]:[0-5][0-9]:[0-5][0-9]\sUTC/i
  belongs_to :user
  belongs_to :drink, optional: true
  belongs_to :food, optional: true
  validates :date, format: { with: VALID_DATE_REGEX }
  validates :sum, numericality: { other_than: 0 }
  validates :user_id, numericality: true
end
