class Instapost < ApplicationRecord
  belongs_to :user
  validates :caption, presence: true
end
