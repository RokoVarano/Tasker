class GroupTask < ApplicationRecord
  belongs_to :groups
  belongs_to :tasks
end
