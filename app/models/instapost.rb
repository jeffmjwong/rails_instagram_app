class Instapost < ApplicationRecord
  belongs_to :user
  has_many :comments
  mount_uploader :photo, PhotoUploader
  validates :caption, presence: true
  validates :photo, presence: true
end
