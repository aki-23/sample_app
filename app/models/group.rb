class Group < ApplicationRecord
	validates :name, presence: true, uniqueness: true
	validates :image, presence: true
  # has_many :users_groups
  # has_many :users, through: :users_groups
  has_many :users
  # has_many :group_tags, dependent: :destroy
  # has_many :tags, through: :group_tags
  belongs_to :tag
  has_many :messages, dependent: :destroy
  mount_uploader :image, ImageUploader

  def self.search(search)
    if search
      # group_name = Group.where('name LIKE(?)', "%#{search}%")
      # tags_prefecture = Tag.where('prefecture LIKE(?)', "%#{search}%")
      # Group.where('name LIKE(?)', "%#{search}%") & Tag.where('prefecture LIKE(?)', "%#{search}%")
      # Group.includes(:tags).where(('region LIKE(?)', "%#{search}%") || ('prefecture LIKE(?)', "%#{search}%"))
      Group.joins(:tag).where('name LIKE(?) or prefecture LIKE(?) or region LIKE(?)', "%#{search}%", "%#{search}%", "%#{search}%")
    else
      Group.all
    end
  end

end
