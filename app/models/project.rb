class Project < ApplicationRecord
  belongs_to :user

  acts_as_taggable_on :keywords #You can also configure multiple tag types per model

  has_many :collaborations, dependent: :destroy
  has_many :milestones, dependent: :destroy
  has_many_attached :photos, dependent: :destroy

  # we can also add audio and video using cloudinary (both use video on the tag), need some config apparently. hints:
  # has_many_attached :audios, resource_type: video ,dependent: :destroy
  # <%= cl_video_tag @i..., controls: true, style: "width: 100%;" %>
  
  validates :title, presence: true, length: { maximum: 100 }, uniqueness: true
  validates :description, presence: true
  validates :status, presence: true, inclusion: { in: %w[open closed finished] }
  validates :budget, presence: true
  validates :max_members, presence: true
  # validates :start_date, presence: true
  # validates :end_date, presence: true
  validates :location, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_title_and_budget_and_location,
    against: [ :title, :budget, :location],
    using: {
      tsearch: { prefix: true } 
    }

end
