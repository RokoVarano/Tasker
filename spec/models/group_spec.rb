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
end
