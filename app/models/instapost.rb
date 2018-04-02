class Instapost < ApplicationRecord
  belongs_to :user
  mount_uploader :photo, PhotoUploader
  has_many :comments, dependent: :destroy
  validates :caption, presence: true
  validates :photo, presence: true
end
