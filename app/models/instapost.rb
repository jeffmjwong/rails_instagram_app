class Instapost < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :delete_all
  mount_uploader :photo, PhotoUploader
  validates :caption, presence: true
  validates :photo, presence: true
end
