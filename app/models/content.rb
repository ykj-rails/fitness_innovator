class Content < ApplicationRecord
  belongs_to :user
  has_many :workouts, dependent: :destroy
  has_many :meals, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  has_many :like_it_users, through: :likes, source: :user
  has_many :bookmark_add_users, through: :bookmarks, source: :user

  accepts_nested_attributes_for :workouts, allow_destroy: true
  accepts_nested_attributes_for :meals, allow_destroy: true

  has_one_attached :befor_image
  has_one_attached :after_image

  validates :before_body_weight, :after_body_weight, :period, :befor_image, :after_image, presence: true
  # いいね関連メソッド
  def like_it(user)
    likes.create(user_id: user.id)
  end

  def unlike_it(user)
    likes.find_by(user_id: user.id).destroy
  end

  def like_it?(user)
    like_it_users.include?(user)
  end
  # ブックマーク関連メソッド
  def bookmark_add(user)
    bookmarks.create(user_id: user.id)
  end

  def bookmark_del(user)
    bookmarks.find_by(user_id: user.id).destroy
  end

  def bookmark_add?(user)
    bookmark_add_users.include?(user)
  end
end
