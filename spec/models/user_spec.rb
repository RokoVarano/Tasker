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
end
