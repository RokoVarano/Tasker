require 'rails_helper'

RSpec.feature "Users", type: :feature do

  context 'Create user' do
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

  context 'Login user' do
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
  end
end