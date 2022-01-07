class Task < ApplicationRecord
  belongs_to :user
  has_many :group_tasks
  has_many :groups, through: :group_tasks

  def self.external(external, user_id)
    if external == 'true'
      Task.includes(:groups).where(user_id: user_id).select { |task| task.groups.empty? }
    else
      Task.includes(:groups).where(user_id: user_id).reject { |task| task.groups.empty? }
    end
  end
end
