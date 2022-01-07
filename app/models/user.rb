class User < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_length_of :name, maximum: 10
  validates_length_of :name, minimum: 3
  has_one_attached :image
  has_many :groups
  has_many :tasks
end
