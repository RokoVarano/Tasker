class Group < ApplicationRecord
  belongs_to :user
  has_many :tasks, through: :group_tasks
end
