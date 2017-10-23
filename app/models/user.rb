class User < ApplicationRecord
  validates :email, email: true
  validates :email, uniqueness: true
  validates :name, :email, presence: true
end
