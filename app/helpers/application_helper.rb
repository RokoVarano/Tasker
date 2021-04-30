module ApplicationHelper
  def navbar_display
    render partial: 'layouts/nav' unless current_user.nil?
  end

  def navbar_title
    @title
  end

  def task_count(tasks)
    html_string = ''

    if current_page?(tasks_path)
      html_string << "<div class='task-count'>"
      html_string << '<p>Total Tasks</p>'
      html_string << "<p>#{tasks.length}</p>"
      html_string << '</div>'
    end

    html_string.html_safe
  end

  def footer_display
    render partial: 'layouts/foot' unless current_user.nil?
  end

  def footer_btn
    return button_to 'New Task', new_task_path, method: :get, class: 'foot-btn' if current_page?(tasks_path)
    return button_to 'New Group', new_group_path, method: :get, class: 'foot-btn' if current_page?(groups_path)
  end

  def avatar(item)
    return if item.nil?

    return unless item.image.attached?

    "<div class='avatar' style='background-image: url(#{url_for(item.image)})'>  </div>".html_safe
  end
end
