class Meal < ApplicationRecord
  belongs_to :content

  validates :title, :menu, :content_id, presence: true
end
