require 'rails_helper'

RSpec.feature 'Groups', type: :feature do
  before(:each) do
    @user = User.new(name: 'MyUser')
    @user.save

    visit root_path

    within '#login_user' do
      fill_in 'user_name', with: @user[:name]
    end
    click_button 'Login'
  end

  context 'Group index view: ' do
    before(:each) do
      file = fixture_file_upload('avatar.png', 'image/png')
      @group = @user.groups.create(name: 'Premade Group', image: file)
      @group.save!

      visit groups_path
    end

    scenario 'title should be Groups' do
      within '.navbar' do
        expect(page).to have_content('Groups')
      end
    end

    scenario 'name and date should appear' do
      expect(page).to have_content(@group[:name])
      expect(page).to have_content(@group[:created_at].strftime('%d of %B, %Y'))
    end
  end
end

# 13837844
