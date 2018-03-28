class Instapost < ApplicationRecord
  belongs_to :user
  mount_uploader :photo, PhotoUploader
  validates :caption, presence: true
  validates :photo, presence: true
end
