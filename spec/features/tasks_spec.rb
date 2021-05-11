# rubocop:disable Metrics/BlockLength

require 'rails_helper'

RSpec.feature 'Tasks', type: :feature do
  before(:each) do
    @user = User.new(name: 'MyUser')
    @user.save

    @task_no_group = @user.tasks.create(name: 'Task with no group', points: '1')
    @task_no_group.save

    @task_with_group = @user.tasks.create(name: 'Task_group', points: '2')
    @task_with_group.save

    file = fixture_file_upload('avatar.png', 'image/png')
    @group = @user.groups.create(name: 'Group 1', image: file)
    @group.save

    @group_task = @group.group_tasks.create(group_id: @group[:id], task_id: @task_with_group[:id])
    @group_task.save

    visit root_path

    within '#login_user' do
      fill_in 'user_name', with: @user[:name]
    end
    click_button 'Login'
  end

  context 'Group Tasks view:' do
    before(:each) do
      visit tasks_path(external: false)
    end

    scenario 'title should be Tasks' do
      within '.navbar' do
        expect(page).to have_content('Tasks')
      end
    end

    scenario 'total tasks should show the number of current tasks' do
      within(:css, '.task-count') do
        expect(page).to have_content('Total Tasks')
        expect(page).to have_content((Task.where(user_id: @user[:id]).select { |task| !task.groups.empty? }).length.to_s)
      end
    end

    scenario 'task with no group should not exist' do
      expect(page).to_not have_content(@task_no_group[:name])
    end

    scenario 'task with group should exist' do
      expect(page).to have_content(@task_with_group[:name])
    end

    scenario 'new task button' do
      click_link 'New Task'
      expect(page).to have_current_path(new_task_path)
    end
  end

  context 'External Tasks view:' do
    before(:each) do
      visit tasks_path(external: true)
    end

    scenario 'total tasks should show the number of current tasks' do
      within(:css, '.task-count') do
        expect(page).to have_content('Total Tasks')
        expect(page).to have_content((Task.where(user_id: @user[:id]).select { |task| task.groups.empty? }).length.to_s)
      end
    end

    scenario 'task with no group should exist' do
      expect(page).to have_content(@task_no_group[:name])
    end

    scenario 'task with group should not exist' do
      expect(page).to_not have_content(@task_with_group[:name])
    end
  end
end

# rubocop:enable Metrics/BlockLength
