class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom

  validates_presence_of :content
end
