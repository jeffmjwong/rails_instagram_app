class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :instapost
  validates :content, presence: true
end
