class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :relationships, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :went_to_gos, dependent: :destroy

  has_many :following_relationships,foreign_key: "follower_id", class_name: "FollowRelationship",  dependent: :destroy
  has_many :followings, through: :following_relationships
  has_many :follower_relationships,foreign_key: "following_id",class_name: "FollowRelationship", dependent: :destroy
  has_many :followers, through: :follower_relationships

  def following?(other_user)
    self.followings.include?(other_user)
  end

  mount_uploader :profile_image, ImageUploader
  mount_uploader :back_image, ImageUploader

  # バリデーション
  validates :name, length: { in: 1..15 }

  validates :account_name, presence: true
  validates :account_name, format: { with: /\A[0-9a-zA-Z]+\z/ }
  validates :account_name, presence: true
  validates :account_name, uniqueness: true
  validates :account_name, length: { in: 1..15 } 


end
