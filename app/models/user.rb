class User < ApplicationRecord
  has_secure_password
  validates :firstName,  presence: true
  validates :lastName, presence: true
  validates :initAmount, numericality: true
  validates :amount, numericality: true
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
end
