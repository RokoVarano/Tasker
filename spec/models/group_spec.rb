require 'rails_helper'

RSpec.describe Group, type: :model do
  before :each do
    @user = User.new(name: 'GroupUser')
    @user.save

    @file = fixture_file_upload('avatar.png', 'image/png')
  end

  context 'unit Tests: ' do
    it 'is valid with valid attributes' do
      expect(@user.groups.create(name: 'GroupExample', image: @file)).to be_valid
    end

    it 'is invalid with empty name' do
      expect(@user.groups.create(name: '', image: @file)).to_not be_valid
    end

    it 'is invalid with empty image' do
      expect(@user.groups.create(name: 'GroupExample', image: nil)).to_not be_valid
    end
  end

  context 'associations' do
    it 'should belong to User' do 
      expect(Group.reflect_on_association(:user).macro).to  eq(:belongs_to) 
    end

    it 'should have many group_tasks' do 
      expect(Group.reflect_on_association(:group_tasks).macro).to  eq(:has_many) 
    end
  end
end
