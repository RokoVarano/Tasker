module GroupsHelper
  def group_link(group)
    
    "<a href='#{group_path(group)}'>
      <div>
        <p>'#{group.name}'</p>
        <p>'#{group.created_at}'</p>
      </div>
    </a>".html_safe
  end
end
