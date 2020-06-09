class Place < ApplicationRecord
  has_many :posts
  # has_many :tag_for_palaces
  # belongs_to :category
  has_many :went_to_gos

  mount_uploaders :images, ImageUploader

   # 引数ユーザがこの場所に対して行ってみたいしてれば、そのwent_to_go_userを返す
  def went_to_go_user(user_id)
    went_to_gos.find_by(user_id: user_id)
  end
end
