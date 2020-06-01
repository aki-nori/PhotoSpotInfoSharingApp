class Place < ApplicationRecord
  has_many :posts
  # has_many :tag_for_palaces
  belongs_to :category

  mount_uploaders :images, ImageUploader
end
