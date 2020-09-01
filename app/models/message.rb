class Message < ApplicationRecord
  belongs_to :group
  belongs_to :user
  # contentカラムが空の場合は保存しない unlessはifの逆 imageとcontentが空の場合は保存しない
  validates :content, presence: true, unless: :image?

  mount_uploader :image, ImageUploader

  
end
