require 'rails_helper'

RSpec.feature "Tasks", type: :feature do
  
  before(:each) do
    @user = User.new(name: 'MyUser')
    @user.save

    @task_no_group = Task.new(:name => 'Task with no group', :points => '1', :user_id => @user[:id])
    @task_no_group.save

    @task_with_group = Task.new(:name => 'Task_group', :points => '2', :user_id => @user[:id])
    @task_with_group.save

    @group = Group.new(:name => "Group 1", :user_id => @user[:id])
    @group.save

    @group_task = GroupTask.create(group_id: @group[:id], task_id: @task_with_group[:id])
    @group_task.save

    visit root_path

    within '#login_user' do
     fill_in 'user_name', with: @user[:name]
    end
    click_button 'Login'
  end

  context 'All Tasks view:' do
    before(:each) do
      visit tasks_path(:external => false)
    end

    scenario 'title should be Tasks' do
      within '.navbar' do
        expect(page).to have_content('Tasks')
      end
    end

    scenario 'total tasks should show the number of current tasks' do
      within(:css, '.task-count') do
        expect(page).to have_content('Total Tasks')
        expect(page).to have_content(Task.where(:user_id => @user[:id]).length.to_s)
      end
    end

    scenario 'task with no group should exist' do
      expect(page).to have_content("Points: #{@task_no_group[:points]}")
      expect(page).to have_content("#{@task_no_group[:created_at]}")
    end

    scenario 'task with group should exist' do
      expect(page).to have_content(@task_with_group[:name])
      expect(page).to have_content("Points: #{@task_with_group[:points]}")
      expect(page).to have_content("#{@task_with_group[:created_at]}")
    end

    scenario 'new task button' do
      click_button "New Task"
      expect(page).to have_current_path(new_task_path)
    end
  end
end
