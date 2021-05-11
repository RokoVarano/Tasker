module UsersHelper
  def user_link(number)
    html_string = ''
    html_string << "<div class='link-profile-icon'>"

    if number == 0
      html_string << '<i class="fas fa-clipboard-list"></i>'
      html_string << '</div>'
      html_string << '<h3 class="text-title">My tasks</h3>' 
    end

    if number == 1
      html_string << '<i class="fas fa-paste"></i>'
      html_string << '</div>'
      html_string << '<h3 class="text-title">External Tasks</h3>' 
    end

    if number == 2
      html_string << '<i class="fas fa-layer-group"></i>'
      html_string << '</div>'
      html_string << '<h3 class="text-title">Groups</h3>' 
    end

    if number == 3
      html_string << '<i class="fas fa-layer-group"></i>'
      html_string << '</div>'
      html_string << '<h3 class="text-title">Update Profile</h3>' 
    end

    if number == 4
      html_string << '<i class="fas fa-power-off"></i>'
      html_string << '</div>'
      html_string << '<h3 class="text-title" style="border:none">Log out</h3>' 
    end

    html_string.html_safe
  end
end


def task_link(task)
  html_string = ''
  html_string << avatar(task.groups[0]) unless task.groups.empty?
  html_string << image_tag('peon.jpg', class: 'avatar') if task.groups.empty?
  html_string << "<div class='task-data'>"
  html_string << "<div class='name-points'>"
  html_string << "<p class='name'>#{task[:name]}</p>"
  html_string << "<p class='points'>Points: #{task[:points]}</p>"
  html_string << '</div>'
  html_string << "<p class='task-date'>#{task[:created_at].strftime('%d of %B, %Y')}</p>"
  html_string << '</div>'

  html_string.html_safe
end