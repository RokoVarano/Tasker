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
    return @group[:name] if current_page?(group_path)
  end

  def task_count(tasks)
    html_string = ""

    if current_page?(tasks_path)
      html_string << "<div class='task-count'>"
      html_string << "<p>Total Tasks</p>"
      html_string << "<p>#{tasks.length}</p>"
      html_string << "</div>"
    end

    html_string.html_safe
  end

  def avatar(item)

    return if item.nil?

    return "<div class='avatar' style='background-image: url(#{url_for(item.image)})'>  </div>".html_safe if item.image.attached?

  end
end
