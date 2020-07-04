class Post < ApplicationRecord
  acts_as_taggable

  has_many :likes
  has_many :comments
  # has_many :tag_for_posts
  # has_many :equipments
  belongs_to :place
  belongs_to :user

  # 引数ユーザがこの投稿に対していいねしてるか
  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end

  mount_uploaders :images, ImageUploader

  # バリデーション
  validates :title, presence: true
  validates :title, length: { in: 1..30 } 

  validates :user_id, presence: true
  validates :place_id, presence: true
  validates :images, presence: true
  validates :title, presence: true
  validates :comment, presence: true
end