class GroupTask < ApplicationRecord
  belongs_to :group
  belongs_to :task
  validates_uniqueness_of :task, scope: :group
end
