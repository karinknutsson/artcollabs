class Collaboration < ApplicationRecord
  belongs_to :project
  belongs_to :user

  validates :role, presence: true
  validates :message, presence: true
  
end
