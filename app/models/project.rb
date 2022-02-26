class Project < ApplicationRecord
  belongs_to :user

  acts_as_taggable_on :tags

  #validate :start_date_cannot_be_in_the_past
  #validate :end_date_cannot_be_before_start_date

  has_many :collabs, dependent: :destroy
  has_many :milestones, dependent: :destroy
  has_one_attached :photo, dependent: :destroy

  validates :photo, size: { less_than: 5.megabytes , message: 'The image should not be larger than 5 MB' }

  has_many_attached :media, dependent: :destroy
  has_one :project_chat, dependent: :destroy

  validates :title, presence: true, length: { maximum: 42 }, uniqueness: true
  validates :description, presence: true, length: { maximum: 10000 }
  validates :max_members, presence: true, numericality: { only_integer: true, greater_than_less_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  # validates :start_date, presence: true
  # validates :end_date, presence: true
  # validates :location, presence: true

  after_create :initialize_project_chat

  def start_date_cannot_be_in_the_past
    if start_date < Date.today
      errors.add(:start_date, "The start date cannot be in the past")
    end
  end

  def end_date_cannot_be_before_start_date
    if end_date < start_date
      errors.add(:end_date, "The end date needs to be before the start date")
    end
  end

  include PgSearch::Model
  pg_search_scope :search_by_title_location_and_description,
    against: [ :title, :location, :description ],
    using: {
      tsearch: { prefix: true }
    }
  multisearchable against: [:title, :location, :description]

  private

  def initialize_project_chat
    self.project_chat = ProjectChat.create(project: self)
  end
end
