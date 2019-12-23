class Group < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  # has_many :users_groups
  # has_many :users, through: :users_groups
  has_many :users
  # belongs_to :user
  has_many :group_tag, dependent: :destroy
  has_many :tags, through: :group_tag
  has_many :messages
  mount_uploader :image, ImageUploader

  def self.search(search)
    if search
      # group_name = Group.where('name LIKE(?)', "%#{search}%")
      # tags_prefecture = Tag.where('prefecture LIKE(?)', "%#{search}%")
      # Group.where('name LIKE(?)', "%#{search}%") & Tag.where('prefecture LIKE(?)', "%#{search}%")
      Group.where('name LIKE(?)', "%#{search}%")
      # Group.where('name LIKE(?) or prefecture LIKE(?)', "%#{search}%", "%#{search}%")
    else
      Group.all
    end
  end

  # def self.search(search)
  #   return Group.all unless search
  #   Group.where('text LIKE(?)', "%#{search}%")
  # end
end
