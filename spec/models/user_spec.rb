require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    expect(User.new(name: 'Name')).to be_valid
  end
  it 'is not valid without a name' do
    expect(User.new(name: '')).to_not be_valid
  end
  it 'is not valid with a duplicate name' do
    User.new(name: 'Name').save
    expect(User.new(name: 'Name')).to_not be_valid
  end
  it 'is not valid with a name shorter than 3 characters' do
    expect(User.new(name: 'as')).to_not be_valid
  end
  it 'is not valid with a name longer than 10 characters' do
    expect(User.new(name: 'abcdefghijk')).to_not be_valid
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
