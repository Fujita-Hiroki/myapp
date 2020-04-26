class Tag < ApplicationRecord
  has_many :micropost_tag_relationships, dependent: :destroy
  has_many :microposts, through: :micropost_tag_relationships
end
