module GroupsHelper
  def group_link(group)
    html_string = ''
    html_string << "<a class='item-container' href='#{group_path(group)}'>"
    html_string << avatar(group)
    html_string << "<div class='task-data'>"
    html_string << "<div class='name-points'>"
    html_string << "<p class='name'>#{group[:name]}</p>"
    html_string << '</div>'
    html_string << "<p class='task-date'>#{group[:created_at].strftime('%d of %B, %Y')}</p>"
    html_string << '</div>'
    html_string << '</a>'

    html_string.html_safe
  end
end
