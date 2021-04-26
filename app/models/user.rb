class User < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :name
  has_one_attached :image
  has_many :groups
  has_many :tasks
end
