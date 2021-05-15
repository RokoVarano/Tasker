class Group < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates_presence_of :image
  validates_presence_of :name
  has_many :group_tasks
  has_many :tasks, through: :group_tasks

  def group_points
    Group.includes(:tasks).find(self[:id]).tasks.group(:user).order('sum_points DESC').limit(3).sum(:points)
  end
end
