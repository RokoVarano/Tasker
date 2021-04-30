class Group < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates_presence_of :image
  has_many :group_tasks
  has_many :tasks, through: :group_tasks
end
