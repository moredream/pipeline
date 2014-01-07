module ApplicationHelper
  def flash_class(level)
    case level
      when :notice then "alert alert-info"
      when :success then "alert alert-success"
      when :error then "alert alert-error"
      when :alert then "alert alert-alert"
    end
  end

  def profile_image(object)
    image_tag avatar_url(object), :class => 'thumbnail'
  end

  def place_image(object)
    if object.present?
      image_tag object , :class=>'media-object'
    else
      image_tag 'placeholder-64.png' , :class=>'pull-left'
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
