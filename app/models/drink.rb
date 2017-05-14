class Drink < ApplicationRecord
  has_many :operations
  has_many :kegs
  validates :name,  presence: true
  validates :drink_type, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
