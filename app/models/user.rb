class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :timeoutable, :confirmable, :trackable

  has_many :contents
  has_one_attached :avatar

  validates :nickname, presence: true, length: { maximum: 10 }

end
