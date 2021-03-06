module ApplicationHelper
  def flash_class(level)
    case level
      when :notice then "alert alert-info"
      when :success then "alert alert-success"
      when :error then "alert alert-error"
      when :alert then "alert alert-alert"
    end
  end

  def tag_map(object)
    raw object.map { |t| link_to t.name, tag_path(t.name) }.join(', ')
  end

  def tag_cloud(tags, classes)
    max = 0
    tags.each do |t|
      if t.count.to_i > max
        max = t.count.to_i
      end
    end
    tags.each do |tag|
      index = tag.count.to_f / max * (classes.size - 1)
      yield(tag, classes[index.round])
    end
  end

  def tag_class(level)
    case level
      when "default" then "label label-default"
      when "primary" then "label label-primary"
      when "success" then "label label-success"
      when "info" then "label label-info"
      when "warning" then "label label-warning"
      when "danger" then "label label-danger"
      else  "label label-info"
    end
  end

  def current_user?(user)
    user == current_user
  end

  def place_image(object)
    if object.present?
       object
    else
       'placeholder-64.png'
    end
  end

  def avatar_url(user)

    if user.image.present?
      user.image
    else
      default_url ="guest-128.png"
    end
  end


end
