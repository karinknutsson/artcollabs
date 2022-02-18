class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  acts_as_taggable_on :skills, :interests

  has_one_attached :avatar
  has_many_attached :photos
  has_many :links, dependent: :destroy

  has_many :collabs, dependent: :destroy
  has_many :projects, dependent: :destroy

  include PgSearch::Model
  multisearchable against: [:username, :first_name, :last_name]
end
