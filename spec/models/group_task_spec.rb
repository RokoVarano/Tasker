require 'rails_helper'

RSpec.describe GroupTask, type: :model do
  before :each do
    @user = User.new(name: 'GroupTaskUser')
    @user.save

    file = fixture_file_upload('avatar.png', 'image/png')
    @group = @user.groups.create(name: 'GroupExample', image: file)
    @group.save

    @task = @user.tasks.create(name: 'TaskExample', points: 3)
    @task.save
  end

  it 'is valid with valid values' do
    expect(@group.group_tasks.create(task_id: @task[:id])).to be_valid
  end

  it 'is invalid with duplicate values' do
    @group.group_tasks.create(task_id: @task[:id]).save!
    expect(@group.group_tasks.create(task_id: @task[:id])).to_not be_valid
  end

  it 'is invalid with reverse duplicate values' do
    @group.group_tasks.create(task_id: @task[:id]).save!
    expect(@task.group_tasks.create(group_id: @group[:id])).to_not be_valid
  end

  context 'associations' do
    it 'should belong to Group' do 
      expect(GroupTask.reflect_on_association(:group).macro).to  eq(:belongs_to) 
    end

    it 'should belong to Task' do 
      expect(GroupTask.reflect_on_association(:task).macro).to  eq(:belongs_to) 
    end
  end
end
