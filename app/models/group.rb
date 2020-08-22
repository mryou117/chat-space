class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users
  # 空でない　重複していない
  validates :name, presence: true, uniqueness: true
end
