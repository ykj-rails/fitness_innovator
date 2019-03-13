class Content < ApplicationRecord
  belongs_to :user
  has_many :workouts
  has_many :meals
  has_many :comments

  accepts_nested_attributes_for :workouts, allow_destroy: true
  accepts_nested_attributes_for :meals, allow_destroy: true

  has_one_attached :befor_image
  has_one_attached :after_image

  validates :title, :befor_image, :after_image,
            :before_body_weight, :after_body_weight, :period, presence: true
end
