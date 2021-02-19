class Milestone < ApplicationRecord
  belongs_to :project

  validates :title, presence: true, length: { maximum: 200 }, uniqueness: true
end
