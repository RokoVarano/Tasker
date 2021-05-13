module ApplicationHelper
  def navbar_display
    return if current_page?(current_user)

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
    return if current_user.nil?

    return unless current_page?(tasks_path) || current_page?(groups_path)

    render partial: 'layouts/foot'
  end

  def footer_btn
    return link_to 'New Task', new_task_path, method: :get, class: 'foot-btn' if current_page?(tasks_path)
    return link_to 'New Group', new_group_path, method: :get, class: 'foot-btn' if current_page?(groups_path)
  end

  def avatar(item)
    return image_tag('peon.jpg', class: 'avatar') if item.nil? || Group.includes(image_attachment: :blob).find(item[:id]).nil?

    image_tag(url_for(Group.includes(image_attachment: :blob).find(item[:id]).image), class: 'avatar')
  end

  def user_avatar(item)
    return image_tag('peon.jpg', class: 'avatar user-avatar', style: 'border-radius: 50%') if item.nil? || !item.image.attached?

    image_tag(url_for(item.image), class: 'avatar user-avatar', style: 'border-radius: 50%')
  end
end
