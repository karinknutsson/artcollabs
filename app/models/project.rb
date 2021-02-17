class Project < ApplicationRecord
  belongs_to :user

  acts_as_taggable_on :keywords #You can also configure multiple tag types per model

  has_many :collaborations, dependent: :destroy
  has_many :milestones, dependent: :destroy
  has_many_attached :photos, dependent: :destroy
end
