module TasksHelper
  def task_link(task)
    html_string = ''
    html_string << avatar(task.groups[0]) unless task.groups.empty?
    html_string << '<div>'
    html_string << "<p>'#{task[:name]}'</p>"
    html_string << "<p>'#{task[:created_at]}'</p>"
    html_string << "<p>Points: #{task[:points]}</p>"
    html_string << '</div>'

    html_string.html_safe
  end
end
