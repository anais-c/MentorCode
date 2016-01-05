class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :experts, through: :taggings
end
