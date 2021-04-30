require 'rails_helper'

RSpec.feature "Users", type: :feature do

  context 'Create user:' do
    before(:each) do
      visit root_path
    end

    scenario 'should succeed' do
      within '#create_user' do
        fill_in 'user_name', with: 'Perro'
      end      
      click_button 'Sign up'
      expect(page).to have_content("Perro was created!")
    end

    scenario 'empty should fail' do
      within '#create_user' do
        fill_in 'user_name', with: ''
      end
      click_button 'Sign up'
      expect(page).to have_content('User can not be empty')
    end

    scenario 'duplicate should fail' do
      User.new(name: 'Perro').save
      within '#create_user' do
        fill_in 'user_name', with: 'Perro'
      end
      click_button 'Sign up'
      expect(page).to have_content('User already exists')
    end
  end

  context 'Login user:' do
    before(:each) do
      visit root_path
      User.new(name: 'Login').save
    end

    scenario 'should succeed' do
      within '#login_user' do
        fill_in 'user_name', with: 'Login'
      end      
      click_button 'Login'
      expect(page).to have_content("Logged in!")
    end

    scenario 'non existant should fail' do
      within '#login_user' do
        fill_in 'user_name', with: 'NonExistant'
      end
      click_button 'Login'
      expect(page).to have_content('User does not exist')
    end

    scenario 'non existant should fail' do
      within '#login_user' do
        fill_in 'user_name', with: ''
      end
      click_button 'Login'
      expect(page).to have_content('User does not exist')
    end
  end

  context 'Profile page:' do
    before(:each) do
      @user = User.new(name: 'MyUser')
      @user.save
      visit root_path
      within '#login_user' do
        fill_in 'user_name', with: @user[:name]
      end
      click_button 'Login'
    end

    scenario 'title should be Profile' do
      within '.navbar' do
        expect(page).to have_content('Profile')
      end
    end

    scenario 'user widget should contain profile name' do
      within '#user_widget_name' do
        expect(page).to have_content(@user[:name])
      end
    end

    scenario 'link to My Tasks' do
      click_link 'My Tasks'
      expect(page).to have_current_path('/tasks?external=false')
    end

    scenario 'link to External Tasks' do
      click_link 'External Tasks'
      expect(page).to have_current_path('/tasks?external=true')
    end

    scenario 'link to All Groups' do
      click_link 'All Groups'
      expect(page).to have_current_path(groups_path)
    end
  end
end