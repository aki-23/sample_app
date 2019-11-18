class Group < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  # has_many :users_groups
  # has_many :users, through: :users_groups
  has_many :messages

  def self.search(search)
    if search
      Group.where('name LIKE(?)', "%#{search}%")
    else
      Group.all
    end
  end
  # def self.search(search)
  #   return Group.all unless search
  #   Group.where('text LIKE(?)', "%#{search}%")
  # end
end
