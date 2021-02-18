class Chatroom < ApplicationRecord
  has_many :direct_messages
end
