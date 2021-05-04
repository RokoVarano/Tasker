module TasksHelper
  def task_link(task)
    html_string = ''
    html_string << avatar(task.groups[0]) unless task.groups.empty?
    html_string << image_tag('peon.jpg', options = { class: 'avatar' }) if task.groups.empty?
    html_string << "<div class='task-data'>"
    html_string << "<div class='name-points'>"
    html_string << "<p class='name'>#{task[:name]}</p>"
    html_string << "<p class='points'>Points: #{task[:points]}</p>"
    html_string << '</div>'
    html_string << "<p class='task-date'>#{task[:created_at].strftime('%d of %B, %Y')}</p>"
    html_string << '</div>'

    html_string.html_safe
  end

  def task_in_group(task)
    html_string = ''
    html_string << avatar(task.user)
    html_string << "<div class='task-data'>"
    html_string << "<div class='name-points'>"
    html_string << "<div>"
    html_string << "<p>#{task[:name]}</p>"
    html_string << "<p>#{task.user[:name]}</p>"
    html_string << '</div>'
    html_string << "<p class='points'>Points: #{task[:points]}</p>"
    html_string << '</div>'
    html_string << "<p class='task-date'>#{task[:created_at].strftime('%d of %B, %Y')}</p>"
    html_string << '</div>'

    html_string.html_safe
  end
end
