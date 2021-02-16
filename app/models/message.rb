class Message < ApplicationRecord
  belongs_to :project_chat
  belongs_to :user
end
