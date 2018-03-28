class Instapost < ApplicationRecord
  belongs_to :user
  validates :caption, presence: true
  mount_uploader :photo, PhotoUploader
end
