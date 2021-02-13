class Project < ApplicationRecord
  belongs_to :user

  acts_as_taggable_on :tags
  acts_as_taggable_on :keywords #You can also configure multiple tag types per model

  has_many_attached :photos
end
