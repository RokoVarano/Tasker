module TasksHelper
  def task_link(task)
    html_string = ""
    html_string << "<div>"
    html_string << "<img src='#{url_for(task.groups[0].image)}'/>" unless task.groups.empty?
    html_string << "<p>'#{task.name}'</p>"
    html_string << "<p>'#{task.created_at}'</p>"
    html_string << "</div>"

    html_string.html_safe
  end
end
