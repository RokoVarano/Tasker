module UsersHelper

  def user_avatar
    if @user.image.attached?

      html_code = ''
      html_code << "<div class='avatar' style='background-image: url(#{url_for(@user.image)})'>  </div>".html_safe
      html_code.html_safe
    else
      "<div class='avatar' style='background-image: #{url('peon.jpg')}'>  </div>".html_safe
    end
  end

end
