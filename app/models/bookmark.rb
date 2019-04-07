class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :content
  validates :user_id, :content_id, presence: true
end
