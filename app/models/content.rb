class Content < ApplicationRecord
  belongs_to :user
  validates :title, :before_body_weight, :after_body_weight, :period, presence: true
end
