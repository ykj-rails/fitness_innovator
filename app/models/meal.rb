class Meal < ApplicationRecord
  belongs_to :content

  validates :title, :menu, presence: true
end
