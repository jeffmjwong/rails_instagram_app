class Instapost < ApplicationRecord
  belongs_to :user
  mount_uploader :photo, PhotoUploader
  has_many :comments
  validates :caption, presence: true
  validates :photo, presence: true
end
