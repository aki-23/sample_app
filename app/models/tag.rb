class Tag < ApplicationRecord
  has_many :group_tag, dependent: :destroy
  has_many :groups, through: :group_tag
end
