class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :timeoutable, :confirmable, :trackable

  has_many :contents
  has_many :comments
  has_one_attached :avatar

  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :nickname, presence: true, length: { maximum: 10 }
  validates :profile, length: { maximum: 150 }
  validates :height, :weight, length: { maximum: 3 }

end
