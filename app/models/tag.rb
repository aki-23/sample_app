class Tag < ApplicationRecord
  has_many :group_tag
  has_many :groups, through: :group_tag
end
