class User < ApplicationRecord
  validates :email, email: true
  validates :name, :email, uniqueness: true, presence: true
end
