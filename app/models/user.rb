class User < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :groups
  has_many :tasks
end