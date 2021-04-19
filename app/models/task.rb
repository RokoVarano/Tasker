class Task < ApplicationRecord
  belongs_to :user
  has_many :groups, through: :group_tasks
end
