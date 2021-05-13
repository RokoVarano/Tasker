require 'rails_helper'

RSpec.describe Task, type: :model do
  before :each do
    @user = User.new(name: 'TaskUser')
    @user.save
  end

  it 'is valid with valid attributes' do
    expect(@user.tasks.create(name: 'TestTask', points: 3)).to be_valid
  end

  it 'is invalid with empty name' do
    expect(@user.tasks.create(name: '', points: 3)).to be_valid
  end

  it 'is invalid with empty points' do
    expect(@user.tasks.create(name: 'TesTask', points: nil)).to be_valid
  end

  context 'associations' do
    it 'should belong to User' do
      expect(Task.reflect_on_association(:user).macro).to eq(:belongs_to)
    end

    it 'should have many group_tasks' do
      expect(Task.reflect_on_association(:group_tasks).macro).to eq(:has_many)
    end
  end
end
