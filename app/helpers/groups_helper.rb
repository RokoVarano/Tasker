module GroupsHelper
  def group_link(group)
    html_string = ""
    html_string << "<a href='#{group_path(group)}' class='item-container'>"
    html_string << "<div>"
    html_string << avatar(group) unless group[:id].nil?
    html_string << "</div>"
    html_string << "<div>"
    html_string << "<p>'#{group.name}'</p>"
    html_string << "<p>'#{group.created_at}'</p>"
    html_string << "</div>"
    html_string << "</a>"
  
    html_string.html_safe
  end
end


