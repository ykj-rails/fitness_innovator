class Workout < ApplicationRecord
  belongs_to :content

  validates :title, :menu, :week_id, :content_id, presence: true
end
