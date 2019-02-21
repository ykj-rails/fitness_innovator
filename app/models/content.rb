class Content < ApplicationRecord
  belongs_to :user
  has_many :workouts
  has_many :meals

  accepts_nested_attributes_for :workouts, allow_destroy: true
  accepts_nested_attributes_for :meals, allow_destroy: true

  has_one_attached :befor_image
  has_one_attached :after_image

  validates :title, :before_body_weight, :after_body_weight, :period, presence: true
end
