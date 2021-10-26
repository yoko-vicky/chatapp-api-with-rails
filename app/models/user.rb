class User < ApplicationRecord
  has_secure_password
  has_many :messages, dependent: :destroy
  has_many :chatrooms, through: :messages

  validates :username, presence: true, uniqueness: true
end
