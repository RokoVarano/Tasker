module ApplicationHelper
  def navbar_display
    render :partial => 'layouts/nav' unless current_user.nil?
  end

  def navbar_title
    return 'Profile' if current_page?(user_path(current_user))
    return 'Tasks' if current_page?(tasks_path)
    return 'New Task' if current_page?(new_task_path)
    return 'Groups' if current_page?(groups_path)
    return 'New Group' if current_page?(new_group_path)
    return 'Group' if current_page?(group_path)
  end
end
